/**
 * @file mm.c
 * @brief A 64-bit struct-based implicit free list memory allocator
 *
 * 15-213: Introduction to Computer Systems
 *
 * How my implementation works:
 *
 * I am using a segmented list design, with a minimum block size of 16 bytes
 *
 * Free blocks: consist of header, next (pointer to next free block in segmented
 *list) free (pointer to previous free block in segmented list), footer
 *
 * Alloc blocks: consist of header and payload (no footer)
 *
 *
 * Find fit function:
 * -> Consists of finding first valid fit, and then looks at a maximum of 20
 *blocks in the corresponding segmented list that come after the first fit, to
 *see if any of them have a size closer to the requested one by malloc
 *
 * Design choices made throughout the process
 *
 * 1. Removed footers on alloc blocks, improving util.
 *
 * 2. Mini blocks: I immplement it on a singly linked list, whose start is
 *stored in the variable block_t *mini_list_start
 *  -> If alloc: consist of header (8 bytes) and payload (8 bytes)
 *  -> If free: consist of header (8 bytes) and pointer to next mini block (8
 *bytes)
 *
 *************************************************************************
 *
 * ADVICE FOR STUDENTS.
 * - Step 0: Please read the writeup!
 * - Step 1: Write your heap checker.
 * - Step 2: Write contracts / debugging assert statements.
 * - Good luck, and have fun!
 *
 *************************************************************************
 *
 * @author Gonzalo de Hermenegildo <gdeherme@andrew.cmu.edu>
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "memlib.h"
#include "mm.h"

/* Do not change the following! */

#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#define memset mem_memset
#define memcpy mem_memcpy
#endif /* def DRIVER */

/* You can change anything from here onward */

/*
 *****************************************************************************
 * If DEBUG is defined (such as when running mdriver-dbg), these macros      *
 * are enabled. You can use them to print debugging output and to check      *
 * contracts only in debug mode.                                             *
 *                                                                           *
 * Only debugging macros with names beginning "dbg_" are allowed.            *
 * You may not define any other macros having arguments.                     *
 *****************************************************************************
 */
#ifdef DEBUG
/* When DEBUG is defined, these form aliases to useful functions */
#define dbg_requires(expr) assert(expr)
#define dbg_assert(expr) assert(expr)
#define dbg_ensures(expr) assert(expr)
#define dbg_printf(...) ((void)printf(__VA_ARGS__))
#define dbg_printheap(...) print_heap(__VA_ARGS__)
#else
/* When DEBUG is not defined, these should emit no code whatsoever,
 * not even from evaluation of argument expressions.  However,
 * argument expressions should still be syntax-checked and should
 * count as uses of any variables involved.  This used to use a
 * straightforward hack involving sizeof(), but that can sometimes
 * provoke warnings about misuse of sizeof().  I _hope_ that this
 * newer, less straightforward hack will be more robust.
 * Hat tip to Stack Overflow poster chqrlie (see
 * https://stackoverflow.com/questions/72647780).
 */
#define dbg_discard_expr_(...) ((void)((0) && printf(__VA_ARGS__)))
#define dbg_requires(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_assert(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_ensures(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_printf(...) dbg_discard_expr_(__VA_ARGS__)
#define dbg_printheap(...) ((void)((0) && print_heap(__VA_ARGS__)))
#endif

/* Basic constants */

typedef uint64_t word_t;

/** @brief Word and header size (bytes) */
static const size_t wsize = sizeof(word_t); // wsize = 8 bytes

/** @brief Double word size (bytes) */
static const size_t dsize = 2 * wsize; // dsize = 16 bytes

/** @brief Minimum block size (bytes) */
/* static const size_t min_block_size = 2 * dsize; // min_block_size = 32 bytes
 */
static const size_t min_block_size = dsize; // update to 16 bytes
/**
 *
 * (Must be divisible by dsize)
 */
static const size_t chunksize = (1 << 12);

static const word_t alloc_mask = 0x1;
// added
static const word_t prev_alloc_mask = 0x2;

static const word_t prev_mini_mask = 0x4;

static const word_t size_mask = ~(word_t)0xF;

/** @brief Represents the header and payload of one block in the heap */
typedef struct block {
    word_t header;
    union {
        /* fpointers_t *free_pointers; */
        struct {
            struct block *next_free;
            struct block *prev_free;
        };

        char payload[0];
    };
} block_t;

// MACROS
#define SEG_LIST_LEN 10
#define FIRST_GROUP_SIZE 16
#define SECOND_GROUP_SIZE 32
#define THIRD_GROUP_SIZE 64
#define FOURTH_GROUP_SIZE 128
#define FIFTH_GROUP_SIZE 256
#define SIXTH_GROUP_SIZE 512
#define SEVENTH_GROUP_SIZE 1024
#define EIGHTTH_GROUP_SIZE 2048
#define NINTH_GROUP_SIZE 4096
#define TENTH_GROUP_SIZE 8192

/* Global variables */

/** @brief Pointer to first block in the heap */
static block_t *heap_start = NULL;

/** @brief Pointer to segmented free-list list */
static block_t *segment_list[SEG_LIST_LEN];

/** @brief Pointer to mini block free-list list */
static block_t *mini_list_start = NULL;

/*
 *****************************************************************************
 * The functions below are short wrapper functions to perform                *
 * bit manipulation, pointer arithmetic, and other helper operations.        *
 *                                                                           *
 * We've given you the function header comments for the functions below      *
 * to help you understand how this baseline code works.                      *
 *                                                                           *
 * Note that these function header comments are short since the functions    *
 * they are describing are short as well; you will need to provide           *
 * adequate details for the functions that you write yourself!               *
 *****************************************************************************
 */

/*
 * ---------------------------------------------------------------------------
 *                        BEGIN SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/**
 * @brief Returns the maximum of two integers.
 * @param[in] x
 * @param[in] y
 * @return `x` if `x > y`, and `y` otherwise.
 */
static size_t max(size_t x, size_t y) {
    return (x > y) ? x : y;
}

/**
 * @brief Rounds `size` up to next multiple of n
 * @param[in] size
 * @param[in] n
 * @return The size after rounding up
 */
static size_t round_up(size_t size, size_t n) {
    return n * ((size + (n - 1)) / n);
}

/**
 * @brief Packs the `size` and `alloc` of a block into a word suitable for
 *        use as a packed value.
 *
 * Packed values are used for both headers and footers.
 *
 * The allocation status is packed into the lowest bit of the word.
 *
 * @param[in] size The size of the block being represented
 * @param[in] alloc True if the block is allocated
 * @return The packed value
 */
static word_t pack(size_t size, bool alloc, bool prev_alloc, bool prev_mini) {
    word_t word = size;
    if (alloc) {
        word |= alloc_mask;
    }

    // Encode if previous alloced or not
    if (prev_alloc) {
        word |= prev_alloc_mask;
    }

    // Encode if previous mini block or not
    if (prev_mini) {
        word |= prev_mini_mask;
    }

    return word;
}

/**
 * @brief Extracts the size represented in a packed word.
 *
 * This function simply clears the lowest 4 bits of the word, as the heap
 * is 16-byte aligned.
 *
 * @param[in] word
 * @return The size of the block represented by the word
 */
static size_t extract_size(word_t word) {
    return (word & size_mask);
}

/**
 * @brief Extracts the size of a block from its header.
 * @param[in] block
 * @return The size of the block
 */
static size_t get_size(block_t *block) {
    return extract_size(block->header);
}

/**
 * @brief Given a payload pointer, returns a pointer to the corresponding
 *        block.
 * @param[in] bp A pointer to a block's payload
 * @return The corresponding block
 */
static block_t *payload_to_header(void *bp) {
    return (block_t *)((char *)bp - offsetof(block_t, payload));
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        payload.
 * @param[in] block
 * @return A pointer to the block's payload
 * @pre The block must be a valid block, not a boundary tag.
 */
static void *header_to_payload(block_t *block) {
    dbg_requires(get_size(block) != 0);
    return (void *)(block->payload);
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        footer.
 * @param[in] block
 * @return A pointer to the block's footer
 * @pre The block must be a valid block, not a boundary tag.
 */
static word_t *header_to_footer(block_t *block) {
    dbg_requires(get_size(block) != 0 &&
                 "Called header_to_footer on the epilogue block");
    return (word_t *)(block->payload + get_size(block) - dsize);
}

/**
 * @brief Given a block footer, returns a pointer to the corresponding
 *        header.
 *
 * The header is found by subtracting the block size from
 * the footer and adding back wsize.
 *
 * If the prologue is given, then the footer is return as the block.
 *
 * @param[in] footer A pointer to the block's footer
 * @return A pointer to the start of the block
 */
static block_t *footer_to_header(word_t *footer) {
    size_t size = extract_size(*footer);
    if (size == 0) {
        return (block_t *)footer;
    }
    return (block_t *)((char *)footer + wsize - size);
}

/**
 * @brief Returns the payload size of a given block.
 *
 * The payload size is equal to the entire block size minus the sizes of the
 * block's header and footer.
 *
 * @param[in] block
 * @return The size of the block's payload
 */
static size_t get_payload_size(block_t *block) {
    size_t asize = get_size(block);
    return asize - wsize;
}

/**
 * @brief Returns the allocation status of a given header value.
 *
 * This is based on the lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the word
 */
static bool extract_alloc(word_t word) {
    return (bool)(word & alloc_mask);
}

/**
 * @brief Returns the allocation status of a given prev header value.
 *
 * This is based on the second to lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the word
 */
static bool extract_prev_alloc(word_t word) {
    word_t masked = word & prev_alloc_mask;
    return (bool)(masked >> 1);
}

/**
 * @brief Returns the mini status of a given  header value.
 *
 *
 * @param[in] word
 * @return The mini status correpsonding to the word
 */
static bool extract_prev_mini(word_t word) {
    word_t masked = word & prev_mini_mask;
    return (bool)(masked >> 2);
}

/**
 * @brief Returns the allocation status of a block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool get_alloc(block_t *block) {
    return extract_alloc(block->header);
}

/**
 * @brief Returns the allocation status of the previous block, based on its
 * header.
 * @param[in] block
 * @return The allocation status of the previous block
 */
static bool get_prev_alloc(block_t *block) {
    return extract_prev_alloc(block->header);
}

/**
 * @brief Returns the mini status of the previous block
 * @param[in] block
 */
static bool get_prev_mini(block_t *block) {
    return extract_prev_mini(block->header);
}

/**
 * @brief Writes an epilogue header at the given address.
 *
 * The epilogue header has size 0, and is marked as allocated.
 *
 * @param[out] block The location to write the epilogue header
 */
static void write_epilogue(block_t *block, bool is_prev_mini) {
    dbg_requires(block != NULL);
    dbg_requires((char *)block == (char *)mem_heap_hi() - 7);
    block->header = pack(0, true, false, is_prev_mini); // add mini blocks
}

/**
 * @brief Finds the next consecutive block on the heap.
 *
 * This function accesses the next block in the "implicit list" of the heap
 * by adding the size of the block.
 *
 * @param[in] block A block in the heap
 * @return The next consecutive block on the heap
 * @pre The block is not the epilogue
 */
static block_t *find_next(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_next on the last block in the heap");
    return (block_t *)((char *)block + get_size(block));
}

/**
 * @brief Finds the footer of the previous block on the heap.
 * @param[in] block A block in the heap
 * @return The location of the previous block's footer
 */
static word_t *find_prev_footer(block_t *block) {
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
}

/**
 * @brief Finds the previous consecutive block on the heap.
 *
 * This is the previous block in the "implicit list" of the heap.
 *
 * The position of the previous block is found by reading the previous
 * block's footer to determine its size, then calculating the start of the
 * previous block based on its size.
 *
 * @param[in] block A block in the heap
 * @return The previous consecutive block in the heap.
 * @pre The block is not the prologue
 */
static block_t *find_prev(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_prev on the first block in the heap");
    word_t *footerp = find_prev_footer(block);
    return footer_to_header(footerp);
}

/**
 * @brief Writes a mini block starting at the given address.
 *
 * For alloced block writes header and payload, for free block
 * writes header and next pointer
 */
static void write_miniblock(block_t *block, size_t size, bool alloc,
                            bool prev_alloc, bool prev_mini) {
    // Step 1: current block
    if (alloc) { // Alloc mini block: header and payload
        block->header = pack(size, alloc, prev_alloc, prev_mini);
    } else { // Free mini block: header and next pointer
        block->header = pack(size, alloc, prev_alloc, prev_mini);
    }

    // Step 2: Edit next block's prev_alloc bit
    block_t *next_block = find_next(block);
    bool is_next_alloc = get_alloc(next_block);
    size_t next_size = get_size(next_block);

    // If next block alloc: only edit header
    if (is_next_alloc) {
        next_block->header = pack(next_size, is_next_alloc, alloc, true);
    } else { // If next block free: edit header and footer
        next_block->header = pack(next_size, is_next_alloc, alloc, true);
    }
}

/**
 * @brief Writes a block starting at the given address.
 *
 * This function writes both a header and footer, where the location of the
 * footer is computed in relation to the header.
 *
 *
 * @param[out] block The location to begin writing the block header
 * @param[in] size The size of the new block
 * @param[in] alloc The allocation status of the new block
 */
static void write_block(block_t *block, size_t size, bool alloc,
                        bool prev_alloc, bool prev_mini) {
    dbg_requires(block != NULL);
    dbg_requires(size > 0);

    // Mini block case
    if (size == min_block_size) {
        write_miniblock(block, size, alloc, prev_alloc, prev_mini);
    }
    // General case (works)
    else {
        // Step 1: Current block writing
        if (alloc) { // Alloc block: no footer
            block->header = pack(size, alloc, prev_alloc, prev_mini);
        } else { // Free block: footer
            block->header = pack(size, alloc, prev_alloc, prev_mini);
            word_t *footerp = header_to_footer(block);
            *footerp = pack(size, alloc, prev_alloc, prev_mini);
        }

        // Step 2: Edit next block's prev_alloc bit
        block_t *next_block = find_next(block);
        bool is_next_alloc = get_alloc(next_block);
        size_t next_size = get_size(next_block);

        // If next block alloc: only edit header
        if (is_next_alloc) {
            next_block->header = pack(next_size, is_next_alloc, alloc, false);
        } else { // If next block free: edit header and footer
            next_block->header = pack(next_size, is_next_alloc, alloc, false);
        }
    }

    //@poscondition
    dbg_requires(get_size(block) == size);
}

/*
 * ---------------------------------------------------------------------------
 *                        END SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/******** The remaining content below are helper and debug routines ********/

/**
 * @brief
 *
 * Checks block is not
 * @param[in] block
 * @return
 */
static bool not_in_free_list(block_t *input_block) {
    // loop through each free list
    for (size_t i = 0; i < SEG_LIST_LEN; i++) {
        block_t *seg_free_list_start = segment_list[i];
        // ensure block not in list
        for (block_t *block = seg_free_list_start; block != NULL;
             block = block->next_free) {
            if (input_block == block)
                return false;
        }
    }

    // otherwise
    return true;
}

/**
 * @brief
 *
 * Returns seg list index depending on size
 *
 * @param[in] Size
 * @return
 */
static size_t determine_seg_index(size_t size) {
    if (size <= FIRST_GROUP_SIZE)
        return 0;
    else if (size <= SECOND_GROUP_SIZE)
        return 1;
    else if (size <= THIRD_GROUP_SIZE)
        return 2;
    else if (size <= FOURTH_GROUP_SIZE)
        return 3;
    else if (size <= FIFTH_GROUP_SIZE)
        return 4;
    else if (size <= SIXTH_GROUP_SIZE)
        return 5;
    else if (size <= SEVENTH_GROUP_SIZE)
        return 6;
    else if (size <= EIGHTTH_GROUP_SIZE)
        return 7;
    else if (size <= NINTH_GROUP_SIZE)
        return 8;
    else
        return 9;

    // otherwise raise fail
    dbg_assert(1 == 0);
}

/**
 * @brief
 *
 * Adds block to start of mini free list (LIFO)
 * @param[in] block
 * @return
 */
static void add_to_mini_free_list(block_t *block) {
    dbg_printf("\n Added to mini free list\n");
    // edge case: free list is NULL, empty
    if (mini_list_start == NULL) {
        mini_list_start = block;
        block->next_free = NULL;
    }
    // general case
    else {
        block->next_free = mini_list_start;
        mini_list_start = block;

        dbg_assert(block->next_free != block);
    }
}

/**
 * @brief
 *
 * Adds block to start of free list (LIFO)
 * @param[in] block
 * @return
 */
static void add_to_free_list(block_t *block) {
    dbg_requires(not_in_free_list(block));
    dbg_requires(!get_alloc(block));

    size_t size = get_size(block);

    // check if miniblock
    if (size == min_block_size) {
        add_to_mini_free_list(block);
    }

    else { // General case (works)
        // Determine seg list that block belongs to
        size_t index = determine_seg_index(size);

        // edge case: free list is NULL, empty
        if (segment_list[index] == NULL) {
            segment_list[index] = block;
            block->prev_free = NULL;
            block->next_free = NULL;
        }
        // general case
        else {
            block->next_free = segment_list[index];
            segment_list[index]->prev_free = block;
            block->prev_free = NULL;
            segment_list[index] = block;

            dbg_assert(block->next_free != block);
        }
    }
}

/**
 * @brief
 *
 * Removes block from mini free list
 * @param[in] block
 * @return
 */
static void remove_from_mini_free_list(block_t *block) {
    dbg_requires(block != NULL);

    block_t *current = mini_list_start;
    block_t *prev = NULL;

    // until we encounter node or end
    while (current != NULL && current != block) {
        prev = current;
        current = current->next_free;
    }

    if (current == NULL) {
        dbg_assert(0);
        return; // Node not found
    }

    if (prev == NULL) { // removed start of list
        mini_list_start = current->next_free;
    } else { // general case
        prev->next_free = current->next_free;
    }
}

/**
 * @brief
 *
 * Removes block from free list
 * @param[in] block
 * @return
 */
static void remove_from_free_list(block_t *block) {
    dbg_requires(block != NULL);

    size_t size = get_size(block);

    // check if miniblock
    if (size == min_block_size) {
        dbg_assert(mini_list_start != NULL);
        remove_from_mini_free_list(block);
    }

    else { // General case (works)
           // Determine seg list that block belongs to
        size_t index = determine_seg_index(size);

        // next and prev
        block_t *next = block->next_free;
        block_t *prev = block->prev_free;

        if (prev != NULL) {
            prev->next_free = next;
        } else {
            // we need to find which segment list it is in
            segment_list[index] = next;
        }

        if (next != NULL) {
            next->prev_free = prev;
        }

        // disconnect from doubly linked  list
        block->next_free = NULL;
        block->prev_free = NULL;
    }
}

/**
 * @brief
 *
 * Coalesces block into heap, avoiding separate adjacent
 * free blocks
 *
 * @param[in] block
 * @return
 */
static block_t *coalesce_block(block_t *block) {
    // Determine which case of coalescing we must do

    // @ requires
    dbg_requires(block != NULL);

    // determine if next or prev blocks free or not
    block_t *coalesced_block = NULL;

    dbg_assert(block != NULL);

    // CODE AFTER REMOVING footers: can't call find_prev
    block_t *next = find_next(block);
    bool next_free = !get_alloc(next);
    bool prev_free = !get_prev_alloc(block);

    bool prev_mini = get_prev_mini(block);

    // Case on it: note, this function only called with current block already
    // marked as free
    if (!prev_free && !next_free) {
        // CASE 1: block already marked as free
        dbg_printf("-- Adding to free list --\n");
        coalesced_block = block;
        dbg_requires(not_in_free_list(block));
    }

    else if (!prev_free && next_free) {
        // Remove from free list
        remove_from_free_list(next);

        // Merge block and next
        size_t new_size = get_size(block) + get_size(next);
        write_block(block, new_size, false, true,
                    prev_mini); // mini blocks update
        coalesced_block = block;

        dbg_requires(not_in_free_list(block));
    }

    else if (prev_free && !next_free) {
        // GET PREV BLOCK
        // initialize var
        block_t *prev = NULL;

        // 1. Case it's a mini block
        if (prev_mini) {
            prev =
                (block_t *)((char *)(&(block->header)) -
                            min_block_size); // each minus unit is 8 bytes back
        } else {                             // regular free block
            // since we know it's free, we know it has a footer
            prev = find_prev(block);
        }

        // CONTINUE REGARDLESS OF HOW WE OBTAINED PREV BLOCK
        // Remove from free list
        dbg_assert(prev != NULL);
        remove_from_free_list(prev);

        // Merge block and previous
        size_t new_size = get_size(prev) + get_size(block);
        write_block(prev, new_size, false, get_prev_alloc(prev),
                    get_prev_mini(prev)); // mini blocks update
        coalesced_block = prev;
    }

    else if (prev_free && next_free) {
        // GET PREV BLOCK
        // initialize var
        block_t *prev = NULL;

        // 1. Case it's a mini block
        if (prev_mini) {
            prev =
                (block_t *)((char *)(block)-min_block_size); // each minus unit
                                                             // is 8 bytes back
        } else { // regular free block
            // since we know it's free, we know it has a footer
            prev = find_prev(block);
        }

        // CONTINUE REGARDLESS OF HOW WE OBTAINED PREV BLOCK
        // Remove from free list
        remove_from_free_list(prev);
        remove_from_free_list(next);

        // Merge block and previous
        size_t new_size = get_size(prev) + get_size(block) + get_size(next);
        write_block(prev, new_size, false, get_prev_alloc(prev),
                    get_prev_mini(prev)); // mini blocks update
        coalesced_block = prev;
    }

    // Add coalesced block to free list
    dbg_assert(coalesced_block != NULL);
    dbg_assert(!get_alloc(coalesced_block));

    add_to_free_list(coalesced_block);

    dbg_ensures(mm_checkheap(__LINE__));

    return coalesced_block;
}

/**
 * @brief
 *
 * Adds a large block of new free memory onto heap
 *
 * @param[in] size
 * @return
 */
static block_t *extend_heap(size_t size) {
    void *bp;

    // Allocate an even number of words to maintain alignment
    size = round_up(size, dsize);
    if ((bp = mem_sbrk((intptr_t)size)) == (void *)-1) {
        return NULL;
    }

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);
    write_block(block, size, false, get_prev_alloc(block),
                get_prev_mini(block)); // mini blocks update

    // Create new epilogue header
    block_t *block_next = find_next(block);
    write_epilogue(block_next, get_size(block) == min_block_size);

    // Coalesce in case the previous block was free
    block = coalesce_block(block);

    return block;
}

/**
 * @brief
 *
 * Splits a free block in the heap into an alloced
 * block and a free block if there is available space to spare
 *
 * @param[in] block
 * @param[in] asize
 */
static void split_block(block_t *block, size_t asize) {
    // asize: size of the block we want to allocate
    // if block larger than asize, we can reuse some of that leftover space

    // This takes in an alloced block! And trying to spare some space
    dbg_requires(get_alloc(block));
    dbg_requires(get_size(block) >=
                 asize); // cannot have block be bigger than space we put it in

    size_t block_size = get_size(block);
    if ((block_size - asize) >= min_block_size) {
        // Big block was already removed from free list

        // 1. mark large block's initial chunk as alloc (on heap)
        block_t *block_next;
        write_block(block, asize, true, get_prev_alloc(block),
                    get_prev_mini(block)); // adding mini blocks

        dbg_printf("\n split block 1 size: %lu", get_size(block));

        // 2.1 mark second chunk as free (on heap)
        block_next = find_next(block);
        write_block(block_next, block_size - asize, false, true,
                    get_size(block) == min_block_size); // mini block update

        // 2.2 re add onto free list new smaller chunk
        dbg_printf("\n block size - asize: %lu", block_size - asize);
        add_to_free_list(block_next);

        if (get_size(block_next) == 16) {
            dbg_assert(mini_list_start == block_next);
            block_t *epilogue = (block_t *)((char *)(mem_heap_hi()) - 7);
            dbg_assert(get_prev_mini(epilogue) == 1);
        }

        dbg_ensures(!get_alloc(block_next));
    }
    dbg_ensures(get_alloc(block));
}

/**
 * @brief
 *
 * Finds fit in mini list
 * @param[in] block
 * @return
 */
static block_t *find_mini_fit(size_t asize) {
    // if mini list not empty, just get first one
    if (mini_list_start != NULL) {
        return mini_list_start;
    }

    // otherwise
    return NULL;
}

/**
 * @brief
 *
 * Finds the first fit in the free list for a specific size
 *
 * @param[in] asize
 * @return
 */
static block_t *find_fit(size_t asize) {
    // SEG LIST IMPLEMENTATION

    block_t *mini_block_fit = NULL;
    // check if miniblock
    if (asize == min_block_size) {
        mini_block_fit = find_mini_fit(asize);
    }

    // only go to other pools if no available mini space
    if (mini_block_fit != NULL) {
        return mini_block_fit;
    }

    else { // General case (works)
        // Determine seg list that block belongs to
        size_t index = determine_seg_index(asize);

        // Look for it from its block size upwards
        for (size_t i = index; i < SEG_LIST_LEN; i++) {
            block_t *seg_free_list_start = segment_list[i];

            for (block_t *block = seg_free_list_start; block != NULL;
                 block = block->next_free) {
                size_t available_size = get_size(block);
                if (available_size >= asize) {
                    // Found fit!
                    // Now try to look into next 20 blocks, find better block?
                    size_t counter = 0;
                    size_t best_size = available_size;
                    block_t *best_fit = block;

                    for (block_t *compare_block = block; compare_block != NULL;
                         compare_block = compare_block->next_free) {
                        size_t compare_size = get_size(compare_block);
                        if ((compare_size < best_size) &&
                            (compare_size >= asize)) {
                            best_fit = compare_block;
                            best_size = compare_size;
                        }

                        // stop at some point
                        if (counter == 20)
                            return best_fit;

                        counter++;
                    }

                    // or if we reach end of seg list before exploring 10 free
                    // blocks
                    return best_fit;
                }
            }
        }
    }

    return NULL; // no fit found
}

/**
 * @brief
 *
 * Checks if heap has valid prologue
 *
 * @return bool
 */
static bool valid_prologue() {
    // edge case: empty heap
    if (heap_start == NULL)
        return true;

    // general case
    dbg_assert(heap_start != NULL);
    block_t *prologue = find_prev(heap_start);
    if (get_size(prologue) == 0)
        return true;
    return false;
}

/**
 * @brief
 *
 * Checks if heap has valid epilogue
 *
 * @return bool
 */
static bool valid_epilogue() {
    // edge case: empty heap
    if (heap_start == NULL)
        return true;
    // general case
    for (block_t *block = heap_start; get_size(block) >= 0;
         block = find_next(block)) {
        if (get_size(block) == 0)
            return true;
    }
    return false;
}

/**
 * @brief
 *
 * Checks validity of each individual block in heap
 *
 * @return bool
 */

static bool valid_blocks() {
    // edge case: empty heap
    if (heap_start == NULL)
        return true;

    // general case:
    for (block_t *block = heap_start; get_size(block) > 0;
         block = find_next(block)) {
        // A. block correct alignment
        if ((uintptr_t)(&(block->payload)) % 16 != 0) {
            dbg_printf("Not properly aligned\n");
            return false;
        }
        // B. min size
        if (get_size(block) < min_block_size) {
            dbg_printf("Block size smaller than min size\n");
            return false;
        }
    }

    // otherwise
    return true;
}

/**
 * @brief
 *
 * Checks no consecutive free blocks in heap
 *
 * @return bool
 */

static bool check_coalescing() {
    // edge case: empty heap
    if (heap_start == NULL)
        return true;

    // general case:
    for (block_t *block = heap_start; get_size(block) > 0;
         block = find_next(block)) {
        bool is_free = !get_alloc(block);
        // found a free block
        if (is_free) {
            dbg_assert(block != NULL);
            bool prev_free = !get_alloc(find_prev(block));
            bool next_free = !get_alloc(find_next(block));

            // can't have consecutive free blocks
            if (prev_free || next_free)
                return false;
        }
    }

    // otherwise
    return true;
}

/**
 * @brief
 *
 * Checks
 * FIRST CHECK: all free list pointers are between mem_heap_lo() and
 * mem_heap_high().
 *
 * SECOND CHECK: all next/previous pointers are consistent
 * (if As next pointer points to B, Bs previous pointer should point to A).
 *
 * @return bool
 */

static bool consistent_pointers() {
    // loop through each free list
    for (size_t i = 0; i < SEG_LIST_LEN; i++) {
        block_t *seg_free_list_start = segment_list[i];

        for (block_t *A = seg_free_list_start; A != NULL; A = A->next_free) {
            // first check: between mem_heap_lo() and high()
            size_t *heap_start_address = mem_heap_lo();
            size_t *heap_end_address = mem_heap_hi();

            if ((uintptr_t)A < (uintptr_t)heap_start_address)
                return false;
            if ((uintptr_t)A > (uintptr_t)heap_end_address)
                return false;

            // second check: pointers consistent
            block_t *B = A->next_free;
            // reached end of list
            if (B == NULL) {
                return true;
            }
            // else
            if (B->prev_free != A) {
                dbg_printf("Two astray pointers\n");
                return false;
            }
        }
    }

    // otherwise
    return true;
}

/**
 * @brief
 *
 * Compares number of free blocks in heap and in free list
 *
 * @return bool
 */

static bool list_match_heap() {
    // Count heap free blocks
    size_t heap_count = 0;
    // edge case: empty heap

    /* dbg_printf("1: %zu\n", heap_count); */
    if (heap_start == NULL)
        heap_count = 0;
    else { // general case
        for (block_t *block = heap_start; get_size(block) > 0;
             block = find_next(block)) {
            bool is_free = !get_alloc(block);
            if (is_free)
                heap_count++;
        }
        /* dbg_printf("2: %zu\n", heap_count); */
    }

    // Count list free blocks
    size_t list_count = 0;

    // loop through each free list
    for (size_t i = 0; i < SEG_LIST_LEN; i++) {
        block_t *seg_free_list_start = segment_list[i];
        // count free block in each individual list
        for (block_t *A = seg_free_list_start; A != NULL; A = A->next_free) {
            list_count++;
        }
    }

    // Debugging
    if (heap_count != list_count) {
        dbg_printf("\nHeap count: %zu\n", heap_count);
        dbg_printf("List count: %zu\n", list_count);
    }

    // match
    return heap_count == list_count;
}

/**
 * @brief
 *
 * Ensures every block in free list is marked as free
 *
 * @return bool
 */

static bool all_free() {
    // loop through each free list
    for (size_t i = 0; i < SEG_LIST_LEN; i++) {
        block_t *seg_free_list_start = segment_list[i];
        // go through blocks in current free list
        for (block_t *A = seg_free_list_start; A != NULL; A = A->next_free) {
            if (get_alloc(A))
                return false;
        }
    }

    // otherwise
    return true;
}

/**
 * @brief
 *
 * Ensures no blocks next field points to itself in the free list
 *
 * @return bool
 */

static bool no_cycles() {

    // loop through each free list
    for (size_t i = 0; i < SEG_LIST_LEN; i++) {
        block_t *seg_free_list_start = segment_list[i];
        // go through blocks in current free list
        for (block_t *block = seg_free_list_start; block != NULL;
             block = block->next_free) {
            if (block->next_free == block)
                return false;
        }
    }

    // otherwise
    return true;
}

/**
 * @brief
 *
 * For debugging purposes, checks validity of heap
 *
 * @param[in] line
 * @return
 */
bool mm_checkheap(int line) {
    // CHECKING HEAP
    // 1. Check epilogue / prologue
    if (!valid_epilogue()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Invalid epilogue\n");
        return false;
    }
    if (!valid_prologue()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Invalid prologue\n");
        return false;
    }

    // 2. Check blocks valid individually
    if (!valid_blocks()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Invalid blocks\n");
        return false;
    }

    // 3. Check coalescing
    if (!check_coalescing()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Invalid coalescing\n");
        return false;
    }

    // CHECKING FREE LIST

    // 1. No next points to itself
    if (!no_cycles()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Next points to itself\n");
        return false;
    }

    // 2. next-prev and prev-next in free list coincide
    if (!consistent_pointers()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Invalid consistent pointers\n");
        return false;
    }

    // 3. Ensure all blocks on free list are marked as free
    if (!all_free()) {
        dbg_printf("Alloced block is in free list\n");
        return false;
    }

    // 4. See if number of heap free blocks match free_list number of blocks
    if (!list_match_heap()) {
        dbg_printf("Heap checker error at line %d\n", line);
        dbg_printf("Invalid list_match_heap\n");
        return false;
    }

    // Passes all checks
    return true;
}

/**
 * @brief
 *
 * Initializes heap
 *
 * @return
 */
bool mm_init(void) {
    // Create the initial empty heap
    word_t *start = (word_t *)(mem_sbrk(2 * wsize));

    if (start == (void *)-1) {
        return false;
    }

    /* // KEY: have to reinitialize free list to NULL */
    /* free_list_start = NULL; */

    // Reinitialize each free list to NULL
    for (size_t i = 0; i < SEG_LIST_LEN; i++) {
        segment_list[i] = NULL;
    }

    // reinitialize mini to null
    mini_list_start = NULL;

    start[0] = pack(0, true, false,
                    false); // Heap prologue (block footer) mini block update
    start[1] = pack(0, true, true,
                    false); // Heap epilogue (block header)  mini block update

    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);

    // Extend the empty heap with a free block of chunksize bytes
    if (extend_heap(chunksize) == NULL) {
        return false;
    }

    return true;
}

/**
 * @brief
 *
 * Allocates a block in memory of the given size
 *
 * @param[in] size
 * @return
 */
void *malloc(size_t size) {
    dbg_requires(mm_checkheap(__LINE__));
    dbg_printf("\n Malloc of size: %lu\n", size);

    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

    // Initialize heap if it isn't initialized
    if (heap_start == NULL) {
        if (!(mm_init())) {
            dbg_printf("Problem initializing heap. Likely due to sbrk");
            return NULL;
        }
    }

    // Ignore spurious request
    if (size == 0) {
        dbg_ensures(mm_checkheap(__LINE__));
        return bp;
    }

    // Adjust block size to include overhead and to meet alignment requirements
    /* asize = round_up(size + dsize, dsize); */
    asize = round_up(size + wsize, dsize);

    // Search the free list for a fit
    block = find_fit(asize);

    // If no fit is found, request more memory, and then and place the block
    if (block == NULL) {
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        block = extend_heap(extendsize);
        // extend_heap returns an error
        if (block == NULL) {
            return bp;
        }
    }

    // The block should be marked as free
    dbg_assert(!get_alloc(block));

    // Mark block as allocated
    size_t block_size = get_size(block);
    write_block(block, block_size, true, get_prev_alloc(block),
                get_prev_mini(block)); // mini block update

    // we remove big chunk from free_list, and readd smaller chunk in
    // split_block
    remove_from_free_list(block);

    dbg_ensures(mm_checkheap(__LINE__));
    // Try to split the block if too large
    split_block(block, asize);
    // SPLIT BLOCK TAKES CARE OF MARKING AS FREE OR NOT, AS WELL AS EDITING FREE
    // LIST

    bp = header_to_payload(block);
    dbg_ensures(mm_checkheap(__LINE__));
    return bp;
}

/**
 * @brief
 *
 * Frees the corresponding block in memory
 *
 * @param[in] bp
 */
void free(void *bp) {
    dbg_requires(mm_checkheap(__LINE__));

    if (bp == NULL) {
        return;
    }

    block_t *block = payload_to_header(bp);
    size_t size = get_size(block);

    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    dbg_printf("\n Called free on block of size: %lu\n", size);

    // Mark the block as free
    write_block(block, size, false, get_prev_alloc(block),
                get_prev_mini(block)); // mini block update

    // Try to coalesce the block with its neighbors
    coalesce_block(block);

    dbg_ensures(mm_checkheap(__LINE__));
}

/**
 * @brief
 *
 * reallocates a pointer given an input size
 *
 * @param[in] ptr
 * @param[in] size
 * @return
 */
void *realloc(void *ptr, size_t size) {
    block_t *block = payload_to_header(ptr);
    size_t copysize;
    void *newptr;

    // If size == 0, then free block and return NULL
    if (size == 0) {
        free(ptr);
        return NULL;
    }

    // If ptr is NULL, then equivalent to malloc
    if (ptr == NULL) {
        return malloc(size);
    }

    // Otherwise, proceed with reallocation
    newptr = malloc(size);

    // If malloc fails, the original block is left untouched
    if (newptr == NULL) {
        return NULL;
    }

    // Copy the old data
    copysize = get_payload_size(block); // gets size of old payload
    if (size < copysize) {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    return newptr;
}

/**
 * @brief
 *
 * Standard C library calloc function
 *
 * @param[in] elements
 * @param[in] size
 * @return
 */
void *calloc(size_t elements, size_t size) {
    void *bp;
    size_t asize = elements * size;

    if (elements == 0) {
        return NULL;
    }
    if (asize / elements != size) {
        // Multiplication overflowed
        return NULL;
    }

    bp = malloc(asize);
    if (bp == NULL) {
        return NULL;
    }

    // Initialize all bits to 0
    memset(bp, 0, asize);

    return bp;
}

/*
 *****************************************************************************
 * Do not delete the following super-secret(tm) lines!                       *
 *                                                                           *
 * 53 6f 20 79 6f 75 27 72 65 20 74 72 79 69 6e 67 20 74 6f 20               *
 *                                                                           *
 * 66 69 67 75 72 65 20 6f 75 74 20 77 68 61 74 20 74 68 65 20               *
 * 68 65 78 61 64 65 63 69 6d 61 6c 20 64 69 67 69 74 73 20 64               *
 * 6f 2e 2e 2e 20 68 61 68 61 68 61 21 20 41 53 43 49 49 20 69               *
 *                                                                           *
 * 73 6e 27 74 20 74 68 65 20 72 69 67 68 74 20 65 6e 63 6f 64               *
 * 69 6e 67 21 20 4e 69 63 65 20 74 72 79 2c 20 74 68 6f 75 67               *
 * 68 21 20 2d 44 72 2e 20 45 76 69 6c 0a c5 7c fc 80 6e 57 0a               *
 *                                                                           *
 *****************************************************************************
 */
