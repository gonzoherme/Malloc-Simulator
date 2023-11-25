; ModuleID = 'mm.c'
source_filename = "mm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.block = type { i64, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.block*, %struct.block* }

@segment_list = internal unnamed_addr global [10 x %struct.block*] zeroinitializer, align 16, !dbg !0
@mini_list_start = internal unnamed_addr global %struct.block* null, align 8, !dbg !55
@heap_start = internal unnamed_addr global %struct.block* null, align 8, !dbg !61

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_checkheap(i32 noundef %0) local_unnamed_addr #0 !dbg !73 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !80, !tbaa !89
  %3 = icmp eq %struct.block* %2, null, !dbg !93
  br i1 %3, label %89, label %4, !dbg !94

4:                                                ; preds = %1
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !95, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !103, metadata !DIExpression()), !dbg !108
  %5 = getelementptr %struct.block, %struct.block* %2, i64 0, i32 0, !dbg !110
  %6 = getelementptr inbounds i64, i64* %5, i64 -1, !dbg !111
  call void @llvm.dbg.value(metadata i64* %6, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i64* %6, metadata !112, metadata !DIExpression()), !dbg !118
  %7 = load i64, i64* %6, align 8, !dbg !120, !tbaa !121
  call void @llvm.dbg.value(metadata i64 %7, metadata !123, metadata !DIExpression()), !dbg !128
  %8 = and i64 %7, -16, !dbg !130
  call void @llvm.dbg.value(metadata i64 %8, metadata !117, metadata !DIExpression()), !dbg !118
  %9 = icmp eq i64 %8, 0, !dbg !131
  %10 = bitcast i64* %6 to %struct.block*, !dbg !133
  %11 = bitcast %struct.block* %2 to i8*, !dbg !133
  %12 = sub i64 0, %8, !dbg !133
  %13 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !133
  %14 = bitcast i8* %13 to %struct.block*, !dbg !133
  %15 = select i1 %9, %struct.block* %10, %struct.block* %14, !dbg !133
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !86, metadata !DIExpression()), !dbg !134
  %16 = getelementptr %struct.block, %struct.block* %15, i64 0, i32 0, !dbg !135
  %17 = load i64, i64* %16, align 8, !dbg !135, !tbaa !137
  call void @llvm.dbg.value(metadata i64 %17, metadata !123, metadata !DIExpression()), !dbg !139
  %18 = icmp ult i64 %17, 16, !dbg !147
  br i1 %18, label %19, label %501, !dbg !148

19:                                               ; preds = %4
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !149, metadata !DIExpression()), !dbg !153
  %20 = load i64, i64* %5, align 8, !dbg !156, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i64 %20, metadata !123, metadata !DIExpression()), !dbg !160
  %21 = and i64 %20, -16, !dbg !162
  %22 = icmp eq i64 %21, 0, !dbg !163
  %23 = xor i1 %22, true, !dbg !164
  %24 = getelementptr inbounds %struct.block, %struct.block* %2, i64 0, i32 1
  %25 = ptrtoint %union.anon* %24 to i64
  %26 = and i64 %25, 15
  %27 = icmp eq i64 %26, 0
  %28 = select i1 %23, i1 %27, i1 false, !dbg !164
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.value(metadata i64 %20, metadata !123, metadata !DIExpression()), !dbg !169
  br i1 %28, label %29, label %46, !dbg !164

29:                                               ; preds = %19, %29
  %30 = phi i64 [ %37, %29 ], [ %21, %19 ]
  %31 = phi %struct.block* [ %34, %29 ], [ %2, %19 ]
  call void @llvm.dbg.value(metadata %struct.block* %31, metadata !149, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.value(metadata %struct.block* %31, metadata !171, metadata !DIExpression()), !dbg !174
  %32 = bitcast %struct.block* %31 to i8*, !dbg !176
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !179
  %33 = getelementptr inbounds i8, i8* %32, i64 %30, !dbg !181
  %34 = bitcast i8* %33 to %struct.block*, !dbg !182
  call void @llvm.dbg.value(metadata %struct.block* %34, metadata !149, metadata !DIExpression()), !dbg !153
  %35 = bitcast i8* %33 to i64*, !dbg !156
  %36 = load i64, i64* %35, align 8, !dbg !156, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i64 %36, metadata !123, metadata !DIExpression()), !dbg !160
  %37 = and i64 %36, -16, !dbg !162
  %38 = icmp eq i64 %37, 0, !dbg !163
  %39 = xor i1 %38, true, !dbg !164
  %40 = getelementptr inbounds i8, i8* %33, i64 8
  %41 = ptrtoint i8* %40 to i64
  %42 = and i64 %41, 15
  %43 = icmp eq i64 %42, 0
  %44 = select i1 %39, i1 %43, i1 false, !dbg !164
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.value(metadata i64 %36, metadata !123, metadata !DIExpression()), !dbg !169
  br i1 %44, label %29, label %45, !dbg !164, !llvm.loop !183

45:                                               ; preds = %29
  br i1 %38, label %47, label %501, !dbg !186

46:                                               ; preds = %19
  br i1 %22, label %89, label %501, !dbg !186

47:                                               ; preds = %45
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !187, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.value(metadata i64 %20, metadata !123, metadata !DIExpression()), !dbg !203
  br i1 %22, label %89, label %48, !dbg !205

48:                                               ; preds = %47, %81
  %49 = phi i64 [ %87, %81 ], [ %21, %47 ]
  %50 = phi i64 [ %83, %81 ], [ %20, %47 ]
  %51 = phi i64* [ %82, %81 ], [ %5, %47 ]
  %52 = phi %struct.block* [ %86, %81 ], [ %2, %47 ]
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !187, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i64 %50, metadata !213, metadata !DIExpression()), !dbg !218
  %53 = and i64 %50, 1, !dbg !220
  %54 = icmp eq i64 %53, 0, !dbg !221
  call void @llvm.dbg.value(metadata i1 %54, metadata !191, metadata !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !222
  br i1 %54, label %60, label %55, !dbg !223

55:                                               ; preds = %48
  %56 = bitcast %struct.block* %52 to i8*
  %57 = getelementptr inbounds i8, i8* %56, i64 %49
  %58 = bitcast i8* %57 to i64*
  %59 = load i64, i64* %58, align 8, !dbg !224, !tbaa !137
  br label %81, !dbg !223

60:                                               ; preds = %48
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !95, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !103, metadata !DIExpression()), !dbg !227
  %61 = getelementptr inbounds i64, i64* %51, i64 -1, !dbg !229
  call void @llvm.dbg.value(metadata i64* %61, metadata !100, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i64* %61, metadata !112, metadata !DIExpression()), !dbg !230
  %62 = load i64, i64* %61, align 8, !dbg !232, !tbaa !121
  call void @llvm.dbg.value(metadata i64 %62, metadata !123, metadata !DIExpression()), !dbg !233
  %63 = and i64 %62, -16, !dbg !235
  call void @llvm.dbg.value(metadata i64 %63, metadata !117, metadata !DIExpression()), !dbg !230
  %64 = icmp eq i64 %63, 0, !dbg !236
  %65 = bitcast i64* %61 to %struct.block*, !dbg !237
  %66 = bitcast %struct.block* %52 to i8*, !dbg !237
  %67 = sub i64 0, %63, !dbg !237
  %68 = getelementptr inbounds i8, i8* %66, i64 %67, !dbg !237
  %69 = bitcast i8* %68 to %struct.block*, !dbg !237
  %70 = select i1 %64, %struct.block* %65, %struct.block* %69, !dbg !237
  %71 = getelementptr %struct.block, %struct.block* %70, i64 0, i32 0, !dbg !238
  %72 = load i64, i64* %71, align 8, !dbg !238, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i64 %72, metadata !213, metadata !DIExpression()), !dbg !241
  %73 = and i64 %72, 1, !dbg !243
  %74 = icmp eq i64 %73, 0, !dbg !244
  call void @llvm.dbg.value(metadata i1 %74, metadata !194, metadata !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !245
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !171, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !250
  %75 = getelementptr inbounds i8, i8* %66, i64 %49, !dbg !252
  %76 = bitcast i8* %75 to i64*, !dbg !253
  %77 = load i64, i64* %76, align 8, !dbg !253, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.value(metadata i64 %77, metadata !213, metadata !DIExpression()), !dbg !256
  %78 = and i64 %77, 1, !dbg !258
  %79 = icmp eq i64 %78, 0, !dbg !259
  call void @llvm.dbg.value(metadata i1 %79, metadata !197, metadata !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !245
  %80 = select i1 %74, i1 true, i1 %79, !dbg !260
  br i1 %80, label %501, label %81, !dbg !260

81:                                               ; preds = %60, %55
  %82 = phi i64* [ %58, %55 ], [ %76, %60 ], !dbg !224
  %83 = phi i64 [ %59, %55 ], [ %77, %60 ], !dbg !224
  %84 = bitcast %struct.block* %52 to i8*, !dbg !262
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !171, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !267
  %85 = getelementptr inbounds i8, i8* %84, i64 %49, !dbg !269
  %86 = bitcast i8* %85 to %struct.block*, !dbg !270
  call void @llvm.dbg.value(metadata %struct.block* %86, metadata !187, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.value(metadata i64 %83, metadata !123, metadata !DIExpression()), !dbg !203
  %87 = and i64 %83, -16, !dbg !271
  %88 = icmp eq i64 %87, 0, !dbg !272
  br i1 %88, label %89, label %48, !dbg !205, !llvm.loop !273

89:                                               ; preds = %81, %46, %1, %47
  call void @llvm.dbg.value(metadata i64 0, metadata !275, metadata !DIExpression()), !dbg !284
  %90 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 0), align 16, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %90, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %90, metadata !282, metadata !DIExpression()), !dbg !289
  br label %91, !dbg !290

91:                                               ; preds = %94, %89
  %92 = phi %struct.block* [ %90, %89 ], [ %96, %94 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %92, metadata !282, metadata !DIExpression()), !dbg !289
  %93 = icmp eq %struct.block* %92, null, !dbg !291
  br i1 %93, label %98, label %94, !dbg !293

94:                                               ; preds = %91
  %95 = getelementptr inbounds %struct.block, %struct.block* %92, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %96 = load %struct.block*, %struct.block** %95, align 8, !dbg !294, !tbaa !297
  %97 = icmp eq %struct.block* %96, %92, !dbg !298
  br i1 %97, label %501, label %91, !dbg !299, !llvm.loop !300

98:                                               ; preds = %91
  call void @llvm.dbg.value(metadata i64 1, metadata !275, metadata !DIExpression()), !dbg !284
  %99 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 1), align 8, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %99, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %99, metadata !282, metadata !DIExpression()), !dbg !289
  br label %100, !dbg !290

100:                                              ; preds = %103, %98
  %101 = phi %struct.block* [ %99, %98 ], [ %105, %103 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %101, metadata !282, metadata !DIExpression()), !dbg !289
  %102 = icmp eq %struct.block* %101, null, !dbg !291
  br i1 %102, label %107, label %103, !dbg !293

103:                                              ; preds = %100
  %104 = getelementptr inbounds %struct.block, %struct.block* %101, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %105 = load %struct.block*, %struct.block** %104, align 8, !dbg !294, !tbaa !297
  %106 = icmp eq %struct.block* %105, %101, !dbg !298
  br i1 %106, label %501, label %100, !dbg !299, !llvm.loop !302

107:                                              ; preds = %100
  call void @llvm.dbg.value(metadata i64 2, metadata !275, metadata !DIExpression()), !dbg !284
  %108 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 2), align 16, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %108, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %108, metadata !282, metadata !DIExpression()), !dbg !289
  br label %109, !dbg !290

109:                                              ; preds = %112, %107
  %110 = phi %struct.block* [ %108, %107 ], [ %114, %112 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %110, metadata !282, metadata !DIExpression()), !dbg !289
  %111 = icmp eq %struct.block* %110, null, !dbg !291
  br i1 %111, label %116, label %112, !dbg !293

112:                                              ; preds = %109
  %113 = getelementptr inbounds %struct.block, %struct.block* %110, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %114 = load %struct.block*, %struct.block** %113, align 8, !dbg !294, !tbaa !297
  %115 = icmp eq %struct.block* %114, %110, !dbg !298
  br i1 %115, label %501, label %109, !dbg !299, !llvm.loop !303

116:                                              ; preds = %109
  call void @llvm.dbg.value(metadata i64 3, metadata !275, metadata !DIExpression()), !dbg !284
  %117 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 3), align 8, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %117, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %117, metadata !282, metadata !DIExpression()), !dbg !289
  br label %118, !dbg !290

118:                                              ; preds = %121, %116
  %119 = phi %struct.block* [ %117, %116 ], [ %123, %121 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %119, metadata !282, metadata !DIExpression()), !dbg !289
  %120 = icmp eq %struct.block* %119, null, !dbg !291
  br i1 %120, label %125, label %121, !dbg !293

121:                                              ; preds = %118
  %122 = getelementptr inbounds %struct.block, %struct.block* %119, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %123 = load %struct.block*, %struct.block** %122, align 8, !dbg !294, !tbaa !297
  %124 = icmp eq %struct.block* %123, %119, !dbg !298
  br i1 %124, label %501, label %118, !dbg !299, !llvm.loop !304

125:                                              ; preds = %118
  call void @llvm.dbg.value(metadata i64 4, metadata !275, metadata !DIExpression()), !dbg !284
  %126 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 4), align 16, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %126, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %126, metadata !282, metadata !DIExpression()), !dbg !289
  br label %127, !dbg !290

127:                                              ; preds = %130, %125
  %128 = phi %struct.block* [ %126, %125 ], [ %132, %130 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %128, metadata !282, metadata !DIExpression()), !dbg !289
  %129 = icmp eq %struct.block* %128, null, !dbg !291
  br i1 %129, label %134, label %130, !dbg !293

130:                                              ; preds = %127
  %131 = getelementptr inbounds %struct.block, %struct.block* %128, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %132 = load %struct.block*, %struct.block** %131, align 8, !dbg !294, !tbaa !297
  %133 = icmp eq %struct.block* %132, %128, !dbg !298
  br i1 %133, label %501, label %127, !dbg !299, !llvm.loop !305

134:                                              ; preds = %127
  call void @llvm.dbg.value(metadata i64 5, metadata !275, metadata !DIExpression()), !dbg !284
  %135 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 5), align 8, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %135, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %135, metadata !282, metadata !DIExpression()), !dbg !289
  br label %136, !dbg !290

136:                                              ; preds = %139, %134
  %137 = phi %struct.block* [ %135, %134 ], [ %141, %139 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %137, metadata !282, metadata !DIExpression()), !dbg !289
  %138 = icmp eq %struct.block* %137, null, !dbg !291
  br i1 %138, label %143, label %139, !dbg !293

139:                                              ; preds = %136
  %140 = getelementptr inbounds %struct.block, %struct.block* %137, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %141 = load %struct.block*, %struct.block** %140, align 8, !dbg !294, !tbaa !297
  %142 = icmp eq %struct.block* %141, %137, !dbg !298
  br i1 %142, label %501, label %136, !dbg !299, !llvm.loop !306

143:                                              ; preds = %136
  call void @llvm.dbg.value(metadata i64 6, metadata !275, metadata !DIExpression()), !dbg !284
  %144 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 6), align 16, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %144, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %144, metadata !282, metadata !DIExpression()), !dbg !289
  br label %145, !dbg !290

145:                                              ; preds = %148, %143
  %146 = phi %struct.block* [ %144, %143 ], [ %150, %148 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %146, metadata !282, metadata !DIExpression()), !dbg !289
  %147 = icmp eq %struct.block* %146, null, !dbg !291
  br i1 %147, label %152, label %148, !dbg !293

148:                                              ; preds = %145
  %149 = getelementptr inbounds %struct.block, %struct.block* %146, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %150 = load %struct.block*, %struct.block** %149, align 8, !dbg !294, !tbaa !297
  %151 = icmp eq %struct.block* %150, %146, !dbg !298
  br i1 %151, label %501, label %145, !dbg !299, !llvm.loop !307

152:                                              ; preds = %145
  call void @llvm.dbg.value(metadata i64 7, metadata !275, metadata !DIExpression()), !dbg !284
  %153 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 7), align 8, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %153, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %153, metadata !282, metadata !DIExpression()), !dbg !289
  br label %154, !dbg !290

154:                                              ; preds = %157, %152
  %155 = phi %struct.block* [ %153, %152 ], [ %159, %157 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %155, metadata !282, metadata !DIExpression()), !dbg !289
  %156 = icmp eq %struct.block* %155, null, !dbg !291
  br i1 %156, label %161, label %157, !dbg !293

157:                                              ; preds = %154
  %158 = getelementptr inbounds %struct.block, %struct.block* %155, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %159 = load %struct.block*, %struct.block** %158, align 8, !dbg !294, !tbaa !297
  %160 = icmp eq %struct.block* %159, %155, !dbg !298
  br i1 %160, label %501, label %154, !dbg !299, !llvm.loop !308

161:                                              ; preds = %154
  call void @llvm.dbg.value(metadata i64 8, metadata !275, metadata !DIExpression()), !dbg !284
  %162 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 8), align 16, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %162, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %162, metadata !282, metadata !DIExpression()), !dbg !289
  br label %163, !dbg !290

163:                                              ; preds = %166, %161
  %164 = phi %struct.block* [ %162, %161 ], [ %168, %166 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %164, metadata !282, metadata !DIExpression()), !dbg !289
  %165 = icmp eq %struct.block* %164, null, !dbg !291
  br i1 %165, label %170, label %166, !dbg !293

166:                                              ; preds = %163
  %167 = getelementptr inbounds %struct.block, %struct.block* %164, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %168 = load %struct.block*, %struct.block** %167, align 8, !dbg !294, !tbaa !297
  %169 = icmp eq %struct.block* %168, %164, !dbg !298
  br i1 %169, label %501, label %163, !dbg !299, !llvm.loop !309

170:                                              ; preds = %163
  call void @llvm.dbg.value(metadata i64 9, metadata !275, metadata !DIExpression()), !dbg !284
  %171 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 9), align 8, !dbg !287, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %171, metadata !279, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %171, metadata !282, metadata !DIExpression()), !dbg !289
  br label %172, !dbg !290

172:                                              ; preds = %175, %170
  %173 = phi %struct.block* [ %171, %170 ], [ %177, %175 ], !dbg !289
  call void @llvm.dbg.value(metadata %struct.block* %173, metadata !282, metadata !DIExpression()), !dbg !289
  %174 = icmp eq %struct.block* %173, null, !dbg !291
  br i1 %174, label %179, label %175, !dbg !293

175:                                              ; preds = %172
  %176 = getelementptr inbounds %struct.block, %struct.block* %173, i64 0, i32 1, i32 0, i32 0, !dbg !294
  %177 = load %struct.block*, %struct.block** %176, align 8, !dbg !294, !tbaa !297
  %178 = icmp eq %struct.block* %177, %173, !dbg !298
  br i1 %178, label %501, label %172, !dbg !299, !llvm.loop !310

179:                                              ; preds = %172
  call void @llvm.dbg.value(metadata i64 0, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %90, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %180 = icmp eq %struct.block* %90, null, !dbg !331
  br i1 %180, label %198, label %181, !dbg !332

181:                                              ; preds = %179, %194
  %182 = phi %struct.block* [ %192, %194 ], [ %90, %179 ]
  %183 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %183, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %184 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %184, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %185 = bitcast i8* %183 to %struct.block*, !dbg !336
  %186 = icmp ult %struct.block* %182, %185, !dbg !336
  %187 = bitcast i8* %184 to %struct.block*
  %188 = icmp ugt %struct.block* %182, %187
  %189 = select i1 %186, i1 true, i1 %188, !dbg !338
  br i1 %189, label %501, label %190, !dbg !338

190:                                              ; preds = %181
  %191 = getelementptr inbounds %struct.block, %struct.block* %182, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %192 = load %struct.block*, %struct.block** %191, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %192, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %193 = icmp eq %struct.block* %192, null, !dbg !340
  br i1 %193, label %369, label %194, !dbg !342

194:                                              ; preds = %190
  %195 = getelementptr inbounds %struct.block, %struct.block* %192, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %196 = load %struct.block*, %struct.block** %195, align 8, !dbg !343, !tbaa !297
  %197 = icmp eq %struct.block* %196, %182, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %197, label %181, label %501, !dbg !346, !llvm.loop !347

198:                                              ; preds = %179
  call void @llvm.dbg.value(metadata i64 1, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %99, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %199 = icmp eq %struct.block* %99, null, !dbg !331
  br i1 %199, label %217, label %200, !dbg !332

200:                                              ; preds = %198, %213
  %201 = phi %struct.block* [ %211, %213 ], [ %99, %198 ]
  %202 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %202, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %203 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %203, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %204 = bitcast i8* %202 to %struct.block*, !dbg !336
  %205 = icmp ult %struct.block* %201, %204, !dbg !336
  %206 = bitcast i8* %203 to %struct.block*
  %207 = icmp ugt %struct.block* %201, %206
  %208 = select i1 %205, i1 true, i1 %207, !dbg !338
  br i1 %208, label %501, label %209, !dbg !338

209:                                              ; preds = %200
  %210 = getelementptr inbounds %struct.block, %struct.block* %201, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %211 = load %struct.block*, %struct.block** %210, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %211, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %212 = icmp eq %struct.block* %211, null, !dbg !340
  br i1 %212, label %369, label %213, !dbg !342

213:                                              ; preds = %209
  %214 = getelementptr inbounds %struct.block, %struct.block* %211, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %215 = load %struct.block*, %struct.block** %214, align 8, !dbg !343, !tbaa !297
  %216 = icmp eq %struct.block* %215, %201, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %216, label %200, label %501, !dbg !346, !llvm.loop !349

217:                                              ; preds = %198
  call void @llvm.dbg.value(metadata i64 2, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %108, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %218 = icmp eq %struct.block* %108, null, !dbg !331
  br i1 %218, label %236, label %219, !dbg !332

219:                                              ; preds = %217, %232
  %220 = phi %struct.block* [ %230, %232 ], [ %108, %217 ]
  %221 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %221, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %222 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %222, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %223 = bitcast i8* %221 to %struct.block*, !dbg !336
  %224 = icmp ult %struct.block* %220, %223, !dbg !336
  %225 = bitcast i8* %222 to %struct.block*
  %226 = icmp ugt %struct.block* %220, %225
  %227 = select i1 %224, i1 true, i1 %226, !dbg !338
  br i1 %227, label %501, label %228, !dbg !338

228:                                              ; preds = %219
  %229 = getelementptr inbounds %struct.block, %struct.block* %220, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %230 = load %struct.block*, %struct.block** %229, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %230, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %231 = icmp eq %struct.block* %230, null, !dbg !340
  br i1 %231, label %369, label %232, !dbg !342

232:                                              ; preds = %228
  %233 = getelementptr inbounds %struct.block, %struct.block* %230, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %234 = load %struct.block*, %struct.block** %233, align 8, !dbg !343, !tbaa !297
  %235 = icmp eq %struct.block* %234, %220, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %235, label %219, label %501, !dbg !346, !llvm.loop !350

236:                                              ; preds = %217
  call void @llvm.dbg.value(metadata i64 3, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %117, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %237 = icmp eq %struct.block* %117, null, !dbg !331
  br i1 %237, label %255, label %238, !dbg !332

238:                                              ; preds = %236, %251
  %239 = phi %struct.block* [ %249, %251 ], [ %117, %236 ]
  %240 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %240, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %241 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %241, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %242 = bitcast i8* %240 to %struct.block*, !dbg !336
  %243 = icmp ult %struct.block* %239, %242, !dbg !336
  %244 = bitcast i8* %241 to %struct.block*
  %245 = icmp ugt %struct.block* %239, %244
  %246 = select i1 %243, i1 true, i1 %245, !dbg !338
  br i1 %246, label %501, label %247, !dbg !338

247:                                              ; preds = %238
  %248 = getelementptr inbounds %struct.block, %struct.block* %239, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %249 = load %struct.block*, %struct.block** %248, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %249, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %250 = icmp eq %struct.block* %249, null, !dbg !340
  br i1 %250, label %369, label %251, !dbg !342

251:                                              ; preds = %247
  %252 = getelementptr inbounds %struct.block, %struct.block* %249, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %253 = load %struct.block*, %struct.block** %252, align 8, !dbg !343, !tbaa !297
  %254 = icmp eq %struct.block* %253, %239, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %254, label %238, label %501, !dbg !346, !llvm.loop !351

255:                                              ; preds = %236
  call void @llvm.dbg.value(metadata i64 4, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %126, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %256 = icmp eq %struct.block* %126, null, !dbg !331
  br i1 %256, label %274, label %257, !dbg !332

257:                                              ; preds = %255, %270
  %258 = phi %struct.block* [ %268, %270 ], [ %126, %255 ]
  %259 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %259, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %260 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %260, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %261 = bitcast i8* %259 to %struct.block*, !dbg !336
  %262 = icmp ult %struct.block* %258, %261, !dbg !336
  %263 = bitcast i8* %260 to %struct.block*
  %264 = icmp ugt %struct.block* %258, %263
  %265 = select i1 %262, i1 true, i1 %264, !dbg !338
  br i1 %265, label %501, label %266, !dbg !338

266:                                              ; preds = %257
  %267 = getelementptr inbounds %struct.block, %struct.block* %258, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %268 = load %struct.block*, %struct.block** %267, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %268, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %269 = icmp eq %struct.block* %268, null, !dbg !340
  br i1 %269, label %369, label %270, !dbg !342

270:                                              ; preds = %266
  %271 = getelementptr inbounds %struct.block, %struct.block* %268, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %272 = load %struct.block*, %struct.block** %271, align 8, !dbg !343, !tbaa !297
  %273 = icmp eq %struct.block* %272, %258, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %273, label %257, label %501, !dbg !346, !llvm.loop !352

274:                                              ; preds = %255
  call void @llvm.dbg.value(metadata i64 5, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %135, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %275 = icmp eq %struct.block* %135, null, !dbg !331
  br i1 %275, label %293, label %276, !dbg !332

276:                                              ; preds = %274, %289
  %277 = phi %struct.block* [ %287, %289 ], [ %135, %274 ]
  %278 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %278, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %279 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %279, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %280 = bitcast i8* %278 to %struct.block*, !dbg !336
  %281 = icmp ult %struct.block* %277, %280, !dbg !336
  %282 = bitcast i8* %279 to %struct.block*
  %283 = icmp ugt %struct.block* %277, %282
  %284 = select i1 %281, i1 true, i1 %283, !dbg !338
  br i1 %284, label %501, label %285, !dbg !338

285:                                              ; preds = %276
  %286 = getelementptr inbounds %struct.block, %struct.block* %277, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %287 = load %struct.block*, %struct.block** %286, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %287, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %288 = icmp eq %struct.block* %287, null, !dbg !340
  br i1 %288, label %369, label %289, !dbg !342

289:                                              ; preds = %285
  %290 = getelementptr inbounds %struct.block, %struct.block* %287, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %291 = load %struct.block*, %struct.block** %290, align 8, !dbg !343, !tbaa !297
  %292 = icmp eq %struct.block* %291, %277, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %292, label %276, label %501, !dbg !346, !llvm.loop !353

293:                                              ; preds = %274
  call void @llvm.dbg.value(metadata i64 6, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %144, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %294 = icmp eq %struct.block* %144, null, !dbg !331
  br i1 %294, label %312, label %295, !dbg !332

295:                                              ; preds = %293, %308
  %296 = phi %struct.block* [ %306, %308 ], [ %144, %293 ]
  %297 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %297, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %298 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %298, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %299 = bitcast i8* %297 to %struct.block*, !dbg !336
  %300 = icmp ult %struct.block* %296, %299, !dbg !336
  %301 = bitcast i8* %298 to %struct.block*
  %302 = icmp ugt %struct.block* %296, %301
  %303 = select i1 %300, i1 true, i1 %302, !dbg !338
  br i1 %303, label %501, label %304, !dbg !338

304:                                              ; preds = %295
  %305 = getelementptr inbounds %struct.block, %struct.block* %296, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %306 = load %struct.block*, %struct.block** %305, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %306, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %307 = icmp eq %struct.block* %306, null, !dbg !340
  br i1 %307, label %369, label %308, !dbg !342

308:                                              ; preds = %304
  %309 = getelementptr inbounds %struct.block, %struct.block* %306, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %310 = load %struct.block*, %struct.block** %309, align 8, !dbg !343, !tbaa !297
  %311 = icmp eq %struct.block* %310, %296, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %311, label %295, label %501, !dbg !346, !llvm.loop !354

312:                                              ; preds = %293
  call void @llvm.dbg.value(metadata i64 7, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %153, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %313 = icmp eq %struct.block* %153, null, !dbg !331
  br i1 %313, label %331, label %314, !dbg !332

314:                                              ; preds = %312, %327
  %315 = phi %struct.block* [ %325, %327 ], [ %153, %312 ]
  %316 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %316, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %317 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %317, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %318 = bitcast i8* %316 to %struct.block*, !dbg !336
  %319 = icmp ult %struct.block* %315, %318, !dbg !336
  %320 = bitcast i8* %317 to %struct.block*
  %321 = icmp ugt %struct.block* %315, %320
  %322 = select i1 %319, i1 true, i1 %321, !dbg !338
  br i1 %322, label %501, label %323, !dbg !338

323:                                              ; preds = %314
  %324 = getelementptr inbounds %struct.block, %struct.block* %315, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %325 = load %struct.block*, %struct.block** %324, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %325, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %326 = icmp eq %struct.block* %325, null, !dbg !340
  br i1 %326, label %369, label %327, !dbg !342

327:                                              ; preds = %323
  %328 = getelementptr inbounds %struct.block, %struct.block* %325, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %329 = load %struct.block*, %struct.block** %328, align 8, !dbg !343, !tbaa !297
  %330 = icmp eq %struct.block* %329, %315, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %330, label %314, label %501, !dbg !346, !llvm.loop !355

331:                                              ; preds = %312
  call void @llvm.dbg.value(metadata i64 8, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %162, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %332 = icmp eq %struct.block* %162, null, !dbg !331
  br i1 %332, label %350, label %333, !dbg !332

333:                                              ; preds = %331, %346
  %334 = phi %struct.block* [ %344, %346 ], [ %162, %331 ]
  %335 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %335, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %336 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %336, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %337 = bitcast i8* %335 to %struct.block*, !dbg !336
  %338 = icmp ult %struct.block* %334, %337, !dbg !336
  %339 = bitcast i8* %336 to %struct.block*
  %340 = icmp ugt %struct.block* %334, %339
  %341 = select i1 %338, i1 true, i1 %340, !dbg !338
  br i1 %341, label %501, label %342, !dbg !338

342:                                              ; preds = %333
  %343 = getelementptr inbounds %struct.block, %struct.block* %334, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %344 = load %struct.block*, %struct.block** %343, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %344, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %345 = icmp eq %struct.block* %344, null, !dbg !340
  br i1 %345, label %369, label %346, !dbg !342

346:                                              ; preds = %342
  %347 = getelementptr inbounds %struct.block, %struct.block* %344, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %348 = load %struct.block*, %struct.block** %347, align 8, !dbg !343, !tbaa !297
  %349 = icmp eq %struct.block* %348, %334, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %349, label %333, label %501, !dbg !346, !llvm.loop !356

350:                                              ; preds = %331
  call void @llvm.dbg.value(metadata i64 9, metadata !311, metadata !DIExpression()) #6, !dbg !326
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !315, metadata !DIExpression()) #6, !dbg !329
  call void @llvm.dbg.value(metadata %struct.block* %171, metadata !318, metadata !DIExpression()) #6, !dbg !330
  %351 = icmp eq %struct.block* %171, null, !dbg !331
  br i1 %351, label %369, label %352, !dbg !332

352:                                              ; preds = %350, %365
  %353 = phi %struct.block* [ %363, %365 ], [ %171, %350 ]
  %354 = tail call i8* @mem_heap_lo() #6, !dbg !333
  call void @llvm.dbg.value(metadata i8* %354, metadata !320, metadata !DIExpression()) #6, !dbg !334
  %355 = tail call i8* @mem_heap_hi() #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %355, metadata !324, metadata !DIExpression()) #6, !dbg !334
  %356 = bitcast i8* %354 to %struct.block*, !dbg !336
  %357 = icmp ult %struct.block* %353, %356, !dbg !336
  %358 = bitcast i8* %355 to %struct.block*
  %359 = icmp ugt %struct.block* %353, %358
  %360 = select i1 %357, i1 true, i1 %359, !dbg !338
  br i1 %360, label %501, label %361, !dbg !338

361:                                              ; preds = %352
  %362 = getelementptr inbounds %struct.block, %struct.block* %353, i64 0, i32 1, i32 0, i32 0, !dbg !339
  %363 = load %struct.block*, %struct.block** %362, align 8, !dbg !339, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %363, metadata !325, metadata !DIExpression()) #6, !dbg !334
  %364 = icmp eq %struct.block* %363, null, !dbg !340
  br i1 %364, label %369, label %365, !dbg !342

365:                                              ; preds = %361
  %366 = getelementptr inbounds %struct.block, %struct.block* %363, i64 0, i32 1, i32 0, i32 1, !dbg !343
  %367 = load %struct.block*, %struct.block** %366, align 8, !dbg !343, !tbaa !297
  %368 = icmp eq %struct.block* %367, %353, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !318, metadata !DIExpression()) #6, !dbg !330
  br i1 %368, label %352, label %501, !dbg !346, !llvm.loop !357

369:                                              ; preds = %190, %209, %228, %247, %266, %285, %304, %323, %342, %361, %350
  call void @llvm.dbg.value(metadata i64 0, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %370 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 0), align 16, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %370, metadata !365, metadata !DIExpression()), !dbg !371
  %371 = icmp eq %struct.block* %370, null, !dbg !372
  br i1 %371, label %382, label %376, !dbg !374

372:                                              ; preds = %376
  %373 = getelementptr inbounds %struct.block, %struct.block* %377, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %374 = load %struct.block*, %struct.block** %373, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %374, metadata !365, metadata !DIExpression()), !dbg !371
  %375 = icmp eq %struct.block* %374, null, !dbg !372
  br i1 %375, label %382, label %376, !dbg !374, !llvm.loop !376

376:                                              ; preds = %369, %372
  %377 = phi %struct.block* [ %374, %372 ], [ %370, %369 ]
  %378 = getelementptr %struct.block, %struct.block* %377, i64 0, i32 0, !dbg !378
  %379 = load i64, i64* %378, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %379, metadata !213, metadata !DIExpression()), !dbg !383
  %380 = and i64 %379, 1, !dbg !385
  %381 = icmp eq i64 %380, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %381, label %372, label %501, !dbg !387

382:                                              ; preds = %372, %369
  call void @llvm.dbg.value(metadata i64 1, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %383 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 1), align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %383, metadata !365, metadata !DIExpression()), !dbg !371
  %384 = icmp eq %struct.block* %383, null, !dbg !372
  br i1 %384, label %395, label %385, !dbg !374

385:                                              ; preds = %382, %391
  %386 = phi %struct.block* [ %393, %391 ], [ %383, %382 ]
  %387 = getelementptr %struct.block, %struct.block* %386, i64 0, i32 0, !dbg !378
  %388 = load i64, i64* %387, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %388, metadata !213, metadata !DIExpression()), !dbg !383
  %389 = and i64 %388, 1, !dbg !385
  %390 = icmp eq i64 %389, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %390, label %391, label %501, !dbg !387

391:                                              ; preds = %385
  %392 = getelementptr inbounds %struct.block, %struct.block* %386, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %393 = load %struct.block*, %struct.block** %392, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %393, metadata !365, metadata !DIExpression()), !dbg !371
  %394 = icmp eq %struct.block* %393, null, !dbg !372
  br i1 %394, label %395, label %385, !dbg !374, !llvm.loop !388

395:                                              ; preds = %391, %382
  call void @llvm.dbg.value(metadata i64 2, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %396 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 2), align 16, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %396, metadata !365, metadata !DIExpression()), !dbg !371
  %397 = icmp eq %struct.block* %396, null, !dbg !372
  br i1 %397, label %408, label %398, !dbg !374

398:                                              ; preds = %395, %404
  %399 = phi %struct.block* [ %406, %404 ], [ %396, %395 ]
  %400 = getelementptr %struct.block, %struct.block* %399, i64 0, i32 0, !dbg !378
  %401 = load i64, i64* %400, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %401, metadata !213, metadata !DIExpression()), !dbg !383
  %402 = and i64 %401, 1, !dbg !385
  %403 = icmp eq i64 %402, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %403, label %404, label %501, !dbg !387

404:                                              ; preds = %398
  %405 = getelementptr inbounds %struct.block, %struct.block* %399, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %406 = load %struct.block*, %struct.block** %405, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %406, metadata !365, metadata !DIExpression()), !dbg !371
  %407 = icmp eq %struct.block* %406, null, !dbg !372
  br i1 %407, label %408, label %398, !dbg !374, !llvm.loop !389

408:                                              ; preds = %404, %395
  call void @llvm.dbg.value(metadata i64 3, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %409 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 3), align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %409, metadata !365, metadata !DIExpression()), !dbg !371
  %410 = icmp eq %struct.block* %409, null, !dbg !372
  br i1 %410, label %421, label %411, !dbg !374

411:                                              ; preds = %408, %417
  %412 = phi %struct.block* [ %419, %417 ], [ %409, %408 ]
  %413 = getelementptr %struct.block, %struct.block* %412, i64 0, i32 0, !dbg !378
  %414 = load i64, i64* %413, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %414, metadata !213, metadata !DIExpression()), !dbg !383
  %415 = and i64 %414, 1, !dbg !385
  %416 = icmp eq i64 %415, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %416, label %417, label %501, !dbg !387

417:                                              ; preds = %411
  %418 = getelementptr inbounds %struct.block, %struct.block* %412, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %419 = load %struct.block*, %struct.block** %418, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %419, metadata !365, metadata !DIExpression()), !dbg !371
  %420 = icmp eq %struct.block* %419, null, !dbg !372
  br i1 %420, label %421, label %411, !dbg !374, !llvm.loop !390

421:                                              ; preds = %417, %408
  call void @llvm.dbg.value(metadata i64 4, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %422 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 4), align 16, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %422, metadata !365, metadata !DIExpression()), !dbg !371
  %423 = icmp eq %struct.block* %422, null, !dbg !372
  br i1 %423, label %434, label %424, !dbg !374

424:                                              ; preds = %421, %430
  %425 = phi %struct.block* [ %432, %430 ], [ %422, %421 ]
  %426 = getelementptr %struct.block, %struct.block* %425, i64 0, i32 0, !dbg !378
  %427 = load i64, i64* %426, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %427, metadata !213, metadata !DIExpression()), !dbg !383
  %428 = and i64 %427, 1, !dbg !385
  %429 = icmp eq i64 %428, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %429, label %430, label %501, !dbg !387

430:                                              ; preds = %424
  %431 = getelementptr inbounds %struct.block, %struct.block* %425, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %432 = load %struct.block*, %struct.block** %431, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %432, metadata !365, metadata !DIExpression()), !dbg !371
  %433 = icmp eq %struct.block* %432, null, !dbg !372
  br i1 %433, label %434, label %424, !dbg !374, !llvm.loop !391

434:                                              ; preds = %430, %421
  call void @llvm.dbg.value(metadata i64 5, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %435 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 5), align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %435, metadata !365, metadata !DIExpression()), !dbg !371
  %436 = icmp eq %struct.block* %435, null, !dbg !372
  br i1 %436, label %447, label %437, !dbg !374

437:                                              ; preds = %434, %443
  %438 = phi %struct.block* [ %445, %443 ], [ %435, %434 ]
  %439 = getelementptr %struct.block, %struct.block* %438, i64 0, i32 0, !dbg !378
  %440 = load i64, i64* %439, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %440, metadata !213, metadata !DIExpression()), !dbg !383
  %441 = and i64 %440, 1, !dbg !385
  %442 = icmp eq i64 %441, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %442, label %443, label %501, !dbg !387

443:                                              ; preds = %437
  %444 = getelementptr inbounds %struct.block, %struct.block* %438, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %445 = load %struct.block*, %struct.block** %444, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %445, metadata !365, metadata !DIExpression()), !dbg !371
  %446 = icmp eq %struct.block* %445, null, !dbg !372
  br i1 %446, label %447, label %437, !dbg !374, !llvm.loop !392

447:                                              ; preds = %443, %434
  call void @llvm.dbg.value(metadata i64 6, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %448 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 6), align 16, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %448, metadata !365, metadata !DIExpression()), !dbg !371
  %449 = icmp eq %struct.block* %448, null, !dbg !372
  br i1 %449, label %460, label %450, !dbg !374

450:                                              ; preds = %447, %456
  %451 = phi %struct.block* [ %458, %456 ], [ %448, %447 ]
  %452 = getelementptr %struct.block, %struct.block* %451, i64 0, i32 0, !dbg !378
  %453 = load i64, i64* %452, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %453, metadata !213, metadata !DIExpression()), !dbg !383
  %454 = and i64 %453, 1, !dbg !385
  %455 = icmp eq i64 %454, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %455, label %456, label %501, !dbg !387

456:                                              ; preds = %450
  %457 = getelementptr inbounds %struct.block, %struct.block* %451, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %458 = load %struct.block*, %struct.block** %457, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %458, metadata !365, metadata !DIExpression()), !dbg !371
  %459 = icmp eq %struct.block* %458, null, !dbg !372
  br i1 %459, label %460, label %450, !dbg !374, !llvm.loop !393

460:                                              ; preds = %456, %447
  call void @llvm.dbg.value(metadata i64 7, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %461 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 7), align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %461, metadata !365, metadata !DIExpression()), !dbg !371
  %462 = icmp eq %struct.block* %461, null, !dbg !372
  br i1 %462, label %473, label %463, !dbg !374

463:                                              ; preds = %460, %469
  %464 = phi %struct.block* [ %471, %469 ], [ %461, %460 ]
  %465 = getelementptr %struct.block, %struct.block* %464, i64 0, i32 0, !dbg !378
  %466 = load i64, i64* %465, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %466, metadata !213, metadata !DIExpression()), !dbg !383
  %467 = and i64 %466, 1, !dbg !385
  %468 = icmp eq i64 %467, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %468, label %469, label %501, !dbg !387

469:                                              ; preds = %463
  %470 = getelementptr inbounds %struct.block, %struct.block* %464, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %471 = load %struct.block*, %struct.block** %470, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %471, metadata !365, metadata !DIExpression()), !dbg !371
  %472 = icmp eq %struct.block* %471, null, !dbg !372
  br i1 %472, label %473, label %463, !dbg !374, !llvm.loop !394

473:                                              ; preds = %469, %460
  call void @llvm.dbg.value(metadata i64 8, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %474 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 8), align 16, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %474, metadata !365, metadata !DIExpression()), !dbg !371
  %475 = icmp eq %struct.block* %474, null, !dbg !372
  br i1 %475, label %486, label %476, !dbg !374

476:                                              ; preds = %473, %482
  %477 = phi %struct.block* [ %484, %482 ], [ %474, %473 ]
  %478 = getelementptr %struct.block, %struct.block* %477, i64 0, i32 0, !dbg !378
  %479 = load i64, i64* %478, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %479, metadata !213, metadata !DIExpression()), !dbg !383
  %480 = and i64 %479, 1, !dbg !385
  %481 = icmp eq i64 %480, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %481, label %482, label %501, !dbg !387

482:                                              ; preds = %476
  %483 = getelementptr inbounds %struct.block, %struct.block* %477, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %484 = load %struct.block*, %struct.block** %483, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %484, metadata !365, metadata !DIExpression()), !dbg !371
  %485 = icmp eq %struct.block* %484, null, !dbg !372
  br i1 %485, label %486, label %476, !dbg !374, !llvm.loop !395

486:                                              ; preds = %482, %473
  call void @llvm.dbg.value(metadata i64 9, metadata !358, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !362, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  %487 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 9), align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %487, metadata !365, metadata !DIExpression()), !dbg !371
  %488 = icmp eq %struct.block* %487, null, !dbg !372
  br i1 %488, label %499, label %489, !dbg !374

489:                                              ; preds = %486, %495
  %490 = phi %struct.block* [ %497, %495 ], [ %487, %486 ]
  %491 = getelementptr %struct.block, %struct.block* %490, i64 0, i32 0, !dbg !378
  %492 = load i64, i64* %491, align 8, !dbg !378, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.value(metadata i64 %492, metadata !213, metadata !DIExpression()), !dbg !383
  %493 = and i64 %492, 1, !dbg !385
  %494 = icmp eq i64 %493, 0, !dbg !386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !365, metadata !DIExpression()), !dbg !371
  br i1 %494, label %495, label %501, !dbg !387

495:                                              ; preds = %489
  %496 = getelementptr inbounds %struct.block, %struct.block* %490, i64 0, i32 1, i32 0, i32 0, !dbg !375
  %497 = load %struct.block*, %struct.block** %496, align 8, !dbg !371, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %497, metadata !365, metadata !DIExpression()), !dbg !371
  %498 = icmp eq %struct.block* %497, null, !dbg !372
  br i1 %498, label %499, label %489, !dbg !374, !llvm.loop !396

499:                                              ; preds = %495, %486
  %500 = tail call fastcc zeroext i1 @list_match_heap(), !dbg !397
  br label %501, !dbg !79

501:                                              ; preds = %60, %94, %103, %112, %121, %130, %139, %148, %157, %166, %175, %181, %194, %213, %200, %232, %219, %251, %238, %270, %257, %289, %276, %308, %295, %327, %314, %346, %333, %365, %352, %376, %385, %398, %411, %424, %437, %450, %463, %476, %489, %46, %499, %45, %4
  %502 = phi i1 [ false, %4 ], [ false, %45 ], [ %500, %499 ], [ false, %46 ], [ false, %489 ], [ false, %476 ], [ false, %463 ], [ false, %450 ], [ false, %437 ], [ false, %424 ], [ false, %411 ], [ false, %398 ], [ false, %385 ], [ false, %376 ], [ false, %352 ], [ false, %365 ], [ false, %333 ], [ false, %346 ], [ false, %314 ], [ false, %327 ], [ false, %295 ], [ false, %308 ], [ false, %276 ], [ false, %289 ], [ false, %257 ], [ false, %270 ], [ false, %238 ], [ false, %251 ], [ false, %219 ], [ false, %232 ], [ false, %200 ], [ false, %213 ], [ false, %194 ], [ false, %181 ], [ false, %175 ], [ false, %166 ], [ false, %157 ], [ false, %148 ], [ false, %139 ], [ false, %130 ], [ false, %121 ], [ false, %112 ], [ false, %103 ], [ false, %94 ], [ false, %60 ], !dbg !79
  ret i1 %502, !dbg !399
}

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_init() local_unnamed_addr #0 !dbg !400 {
  %1 = tail call i8* @mem_sbrk(i64 noundef 16) #6, !dbg !405
  call void @llvm.dbg.value(metadata i8* %1, metadata !402, metadata !DIExpression()), !dbg !406
  %2 = icmp eq i8* %1, inttoptr (i64 -1 to i8*), !dbg !407
  br i1 %2, label %21, label %3, !dbg !409

3:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i8* %1, metadata !402, metadata !DIExpression()), !dbg !406
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(80) bitcast ([10 x %struct.block*]* @segment_list to i8*), i8 0, i64 80, i1 false), !dbg !410, !tbaa !89
  call void @llvm.dbg.value(metadata i32 undef, metadata !403, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i32 undef, metadata !403, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !413
  store %struct.block* null, %struct.block** @mini_list_start, align 8, !dbg !414, !tbaa !89
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !424
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !424
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !424
  call void @llvm.dbg.value(metadata i64 0, metadata !423, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()), !dbg !426
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !426
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !426
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !426
  call void @llvm.dbg.value(metadata i64 0, metadata !423, metadata !DIExpression()), !dbg !426
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()), !dbg !426
  call void @llvm.dbg.value(metadata i64 3, metadata !423, metadata !DIExpression()), !dbg !426
  call void @llvm.dbg.value(metadata i64 3, metadata !423, metadata !DIExpression()), !dbg !426
  %4 = getelementptr inbounds i8, i8* %1, i64 8, !dbg !428
  %5 = bitcast i8* %1 to <2 x i64>*, !dbg !429
  store <2 x i64> <i64 1, i64 3>, <2 x i64>* %5, align 8, !dbg !429, !tbaa !121
  store i8* %4, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !430, !tbaa !89
  call void @llvm.dbg.value(metadata i64 4096, metadata !431, metadata !DIExpression()) #6, !dbg !439
  call void @llvm.dbg.value(metadata i64 4096, metadata !431, metadata !DIExpression()) #6, !dbg !439
  %6 = tail call i8* @mem_sbrk(i64 noundef 4096) #6, !dbg !442
  call void @llvm.dbg.value(metadata i8* %6, metadata !436, metadata !DIExpression()) #6, !dbg !439
  %7 = icmp eq i8* %6, inttoptr (i64 -1 to i8*), !dbg !444
  br i1 %7, label %21, label %8, !dbg !445

8:                                                ; preds = %3
  call void @llvm.dbg.value(metadata i8* %6, metadata !446, metadata !DIExpression()) #6, !dbg !451
  %9 = getelementptr inbounds i8, i8* %6, i64 -8, !dbg !453
  %10 = bitcast i8* %9 to %struct.block*, !dbg !454
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !437, metadata !DIExpression()) #6, !dbg !439
  %11 = bitcast i8* %9 to i64*, !dbg !455
  %12 = load i64, i64* %11, align 8, !dbg !455, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !456, metadata !DIExpression()) #6, !dbg !473
  call void @llvm.dbg.value(metadata i64 4096, metadata !461, metadata !DIExpression()) #6, !dbg !473
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !473
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !473
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !473
  %13 = and i64 %12, 6, !dbg !475
  call void @llvm.dbg.value(metadata i64 4096, metadata !415, metadata !DIExpression()) #6, !dbg !476
  call void @llvm.dbg.value(metadata i64 4096, metadata !415, metadata !DIExpression()) #6, !dbg !479
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !479
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !479
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !479
  call void @llvm.dbg.value(metadata i64 4096, metadata !423, metadata !DIExpression()) #6, !dbg !479
  call void @llvm.dbg.value(metadata i64 4096, metadata !423, metadata !DIExpression()) #6, !dbg !479
  call void @llvm.dbg.value(metadata i64 undef, metadata !423, metadata !DIExpression()) #6, !dbg !479
  %14 = or i64 %13, 4096, !dbg !481
  call void @llvm.dbg.value(metadata i64 %14, metadata !423, metadata !DIExpression()) #6, !dbg !479
  store i64 %14, i64* %11, align 8, !dbg !482, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !483, metadata !DIExpression()) #6, !dbg !486
  %15 = getelementptr inbounds i8, i8* %6, i64 4080, !dbg !488
  %16 = bitcast i8* %15 to i64*, !dbg !489
  call void @llvm.dbg.value(metadata i64* %16, metadata !465, metadata !DIExpression()) #6, !dbg !490
  call void @llvm.dbg.value(metadata i64 4096, metadata !415, metadata !DIExpression()) #6, !dbg !491
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !491
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !491
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !491
  call void @llvm.dbg.value(metadata i64 4096, metadata !423, metadata !DIExpression()) #6, !dbg !491
  call void @llvm.dbg.value(metadata i64 4096, metadata !423, metadata !DIExpression()) #6, !dbg !491
  call void @llvm.dbg.value(metadata i64 undef, metadata !423, metadata !DIExpression()) #6, !dbg !491
  call void @llvm.dbg.value(metadata i64 %14, metadata !423, metadata !DIExpression()) #6, !dbg !491
  store i64 %14, i64* %16, align 8, !dbg !493, !tbaa !121
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !171, metadata !DIExpression()) #6, !dbg !494
  call void @llvm.dbg.value(metadata i8* %6, metadata !470, metadata !DIExpression(DW_OP_plus_uconst, 4088, DW_OP_stack_value)) #6, !dbg !496
  call void @llvm.dbg.value(metadata i1 undef, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !496
  call void @llvm.dbg.value(metadata i64 undef, metadata !472, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !496
  call void @llvm.dbg.value(metadata i64 undef, metadata !415, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !497
  call void @llvm.dbg.value(metadata i64 undef, metadata !415, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !501
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !171, metadata !DIExpression()) #6, !dbg !504
  %17 = getelementptr inbounds i8, i8* %6, i64 4088, !dbg !506
  call void @llvm.dbg.value(metadata i8* %17, metadata !438, metadata !DIExpression()) #6, !dbg !439
  call void @llvm.dbg.value(metadata i8* %17, metadata !507, metadata !DIExpression()) #6, !dbg !513
  call void @llvm.dbg.value(metadata i1 false, metadata !512, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !513
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()) #6, !dbg !515
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !515
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !515
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !515
  call void @llvm.dbg.value(metadata i64 0, metadata !423, metadata !DIExpression()) #6, !dbg !515
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !515
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !515
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !515
  %18 = bitcast i8* %17 to i64*, !dbg !517
  store i64 1, i64* %18, align 8, !dbg !518, !tbaa !137
  %19 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %10) #6, !dbg !519
  call void @llvm.dbg.value(metadata %struct.block* %19, metadata !437, metadata !DIExpression()) #6, !dbg !439
  %20 = icmp ne %struct.block* %19, null
  br label %21

21:                                               ; preds = %8, %3, %0
  %22 = phi i1 [ false, %0 ], [ %20, %8 ], [ false, %3 ], !dbg !406
  ret i1 %22, !dbg !520
}

declare !dbg !521 i8* @mem_sbrk(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_malloc(i64 noundef %0) local_unnamed_addr #0 !dbg !526 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !530, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.value(metadata i8* null, metadata !534, metadata !DIExpression()), !dbg !536
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !537, !tbaa !89
  %3 = icmp eq %struct.block* %2, null, !dbg !539
  br i1 %3, label %4, label %27, !dbg !540

4:                                                ; preds = %1
  %5 = tail call i8* @mem_sbrk(i64 noundef 16) #6, !dbg !541
  call void @llvm.dbg.value(metadata i8* %5, metadata !402, metadata !DIExpression()) #6, !dbg !545
  %6 = icmp eq i8* %5, inttoptr (i64 -1 to i8*), !dbg !546
  br i1 %6, label %539, label %7, !dbg !547

7:                                                ; preds = %4
  call void @llvm.dbg.value(metadata i8* %5, metadata !402, metadata !DIExpression()) #6, !dbg !545
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(80) bitcast ([10 x %struct.block*]* @segment_list to i8*), i8 0, i64 80, i1 false) #6, !dbg !548, !tbaa !89
  call void @llvm.dbg.value(metadata i32 undef, metadata !403, metadata !DIExpression()) #6, !dbg !549
  call void @llvm.dbg.value(metadata i32 undef, metadata !403, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !549
  store %struct.block* null, %struct.block** @mini_list_start, align 8, !dbg !550, !tbaa !89
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()) #6, !dbg !551
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !551
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !551
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !551
  call void @llvm.dbg.value(metadata i64 0, metadata !423, metadata !DIExpression()) #6, !dbg !551
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !551
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !551
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !551
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()) #6, !dbg !553
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !553
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !553
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !553
  call void @llvm.dbg.value(metadata i64 0, metadata !423, metadata !DIExpression()) #6, !dbg !553
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !553
  call void @llvm.dbg.value(metadata i64 3, metadata !423, metadata !DIExpression()) #6, !dbg !553
  call void @llvm.dbg.value(metadata i64 3, metadata !423, metadata !DIExpression()) #6, !dbg !553
  %8 = getelementptr inbounds i8, i8* %5, i64 8, !dbg !555
  %9 = bitcast i8* %5 to <2 x i64>*, !dbg !556
  store <2 x i64> <i64 1, i64 3>, <2 x i64>* %9, align 8, !dbg !556, !tbaa !121
  store i8* %8, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !557, !tbaa !89
  call void @llvm.dbg.value(metadata i64 4096, metadata !431, metadata !DIExpression()) #6, !dbg !558
  call void @llvm.dbg.value(metadata i64 4096, metadata !431, metadata !DIExpression()) #6, !dbg !558
  %10 = tail call i8* @mem_sbrk(i64 noundef 4096) #6, !dbg !560
  call void @llvm.dbg.value(metadata i8* %10, metadata !436, metadata !DIExpression()) #6, !dbg !558
  %11 = icmp eq i8* %10, inttoptr (i64 -1 to i8*), !dbg !561
  br i1 %11, label %539, label %12, !dbg !562

12:                                               ; preds = %7
  call void @llvm.dbg.value(metadata i8* %10, metadata !446, metadata !DIExpression()) #6, !dbg !563
  %13 = getelementptr inbounds i8, i8* %10, i64 -8, !dbg !565
  %14 = bitcast i8* %13 to %struct.block*, !dbg !566
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !437, metadata !DIExpression()) #6, !dbg !558
  %15 = bitcast i8* %13 to i64*, !dbg !567
  %16 = load i64, i64* %15, align 8, !dbg !567, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !456, metadata !DIExpression()) #6, !dbg !568
  call void @llvm.dbg.value(metadata i64 4096, metadata !461, metadata !DIExpression()) #6, !dbg !568
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !568
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !568
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !568
  %17 = and i64 %16, 6, !dbg !570
  call void @llvm.dbg.value(metadata i64 4096, metadata !415, metadata !DIExpression()) #6, !dbg !571
  call void @llvm.dbg.value(metadata i64 4096, metadata !415, metadata !DIExpression()) #6, !dbg !573
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !573
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !573
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !573
  call void @llvm.dbg.value(metadata i64 undef, metadata !423, metadata !DIExpression()) #6, !dbg !573
  %18 = or i64 %17, 4096, !dbg !575
  call void @llvm.dbg.value(metadata i64 %18, metadata !423, metadata !DIExpression()) #6, !dbg !573
  store i64 %18, i64* %15, align 8, !dbg !576, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !483, metadata !DIExpression()) #6, !dbg !577
  %19 = getelementptr inbounds i8, i8* %10, i64 4080, !dbg !579
  %20 = bitcast i8* %19 to i64*, !dbg !580
  call void @llvm.dbg.value(metadata i64* %20, metadata !465, metadata !DIExpression()) #6, !dbg !581
  call void @llvm.dbg.value(metadata i64 4096, metadata !415, metadata !DIExpression()) #6, !dbg !582
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !582
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !582
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !582
  call void @llvm.dbg.value(metadata i64 %18, metadata !423, metadata !DIExpression()) #6, !dbg !582
  store i64 %18, i64* %20, align 8, !dbg !584, !tbaa !121
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !171, metadata !DIExpression()) #6, !dbg !585
  call void @llvm.dbg.value(metadata i8* %10, metadata !470, metadata !DIExpression(DW_OP_plus_uconst, 4088, DW_OP_stack_value)) #6, !dbg !587
  call void @llvm.dbg.value(metadata i1 undef, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !587
  call void @llvm.dbg.value(metadata i64 undef, metadata !472, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !587
  call void @llvm.dbg.value(metadata i64 undef, metadata !415, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !588
  call void @llvm.dbg.value(metadata i64 undef, metadata !415, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !590
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !171, metadata !DIExpression()) #6, !dbg !592
  %21 = getelementptr inbounds i8, i8* %10, i64 4088, !dbg !594
  call void @llvm.dbg.value(metadata i8* %21, metadata !438, metadata !DIExpression()) #6, !dbg !558
  call void @llvm.dbg.value(metadata i8* %21, metadata !507, metadata !DIExpression()) #6, !dbg !595
  call void @llvm.dbg.value(metadata i1 false, metadata !512, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !595
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()) #6, !dbg !597
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !597
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !597
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !597
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !597
  %22 = bitcast i8* %21 to i64*, !dbg !599
  store i64 1, i64* %22, align 8, !dbg !600, !tbaa !137
  %23 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %14) #6, !dbg !601
  call void @llvm.dbg.value(metadata %struct.block* %23, metadata !437, metadata !DIExpression()) #6, !dbg !558
  %24 = icmp eq %struct.block* %23, null
  %25 = icmp eq i64 %0, 0
  %26 = or i1 %25, %24, !dbg !602
  br i1 %26, label %539, label %29, !dbg !602

27:                                               ; preds = %1
  %28 = icmp eq i64 %0, 0, !dbg !603
  br i1 %28, label %539, label %29, !dbg !605

29:                                               ; preds = %12, %27
  call void @llvm.dbg.value(metadata i64 %0, metadata !606, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !612
  call void @llvm.dbg.value(metadata i64 16, metadata !611, metadata !DIExpression()), !dbg !612
  %30 = add i64 %0, 23, !dbg !614
  %31 = and i64 %30, -16, !dbg !615
  call void @llvm.dbg.value(metadata i64 %31, metadata !531, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.value(metadata i64 %31, metadata !616, metadata !DIExpression()), !dbg !643
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !619, metadata !DIExpression()), !dbg !643
  %32 = icmp eq i64 %31, 16, !dbg !645
  br i1 %32, label %33, label %36, !dbg !647

33:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i64 undef, metadata !648, metadata !DIExpression()), !dbg !651
  %34 = load %struct.block*, %struct.block** @mini_list_start, align 8, !dbg !654, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %34, metadata !619, metadata !DIExpression()), !dbg !643
  %35 = icmp eq %struct.block* %34, null, !dbg !656
  br i1 %35, label %55, label %341, !dbg !657

36:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i64 %31, metadata !658, metadata !DIExpression()), !dbg !663
  %37 = icmp ult i64 %31, 17, !dbg !665
  br i1 %37, label %55, label %38, !dbg !667

38:                                               ; preds = %36
  %39 = icmp ult i64 %31, 33, !dbg !668
  br i1 %39, label %55, label %40, !dbg !670

40:                                               ; preds = %38
  %41 = icmp ult i64 %31, 65, !dbg !671
  br i1 %41, label %55, label %42, !dbg !673

42:                                               ; preds = %40
  %43 = icmp ult i64 %31, 129, !dbg !674
  br i1 %43, label %55, label %44, !dbg !676

44:                                               ; preds = %42
  %45 = icmp ult i64 %31, 257, !dbg !677
  br i1 %45, label %55, label %46, !dbg !679

46:                                               ; preds = %44
  %47 = icmp ult i64 %31, 513, !dbg !680
  br i1 %47, label %55, label %48, !dbg !682

48:                                               ; preds = %46
  %49 = icmp ult i64 %31, 1025, !dbg !683
  br i1 %49, label %55, label %50, !dbg !685

50:                                               ; preds = %48
  %51 = icmp ult i64 %31, 2049, !dbg !686
  br i1 %51, label %55, label %52, !dbg !688

52:                                               ; preds = %50
  %53 = icmp ult i64 %31, 4097, !dbg !689
  %54 = select i1 %53, i64 8, i64 9, !dbg !691
  br label %55, !dbg !691

55:                                               ; preds = %52, %50, %48, %46, %44, %42, %40, %38, %36, %33
  %56 = phi i64 [ 0, %33 ], [ %54, %52 ], [ 7, %50 ], [ 6, %48 ], [ 5, %46 ], [ 4, %44 ], [ 3, %42 ], [ 2, %40 ], [ 1, %38 ], [ 0, %36 ]
  br label %57, !dbg !692

57:                                               ; preds = %55, %309
  %58 = phi i64 [ %310, %309 ], [ %56, %55 ]
  call void @llvm.dbg.value(metadata i64 %58, metadata !623, metadata !DIExpression()), !dbg !693
  %59 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %58, !dbg !694
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !625, metadata !DIExpression()), !dbg !695
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !628, metadata !DIExpression()), !dbg !696
  %60 = load %struct.block*, %struct.block** %59, align 8, !dbg !696, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %60, metadata !628, metadata !DIExpression()), !dbg !696
  %61 = icmp eq %struct.block* %60, null, !dbg !697
  br i1 %61, label %309, label %62, !dbg !698

62:                                               ; preds = %57, %308
  %63 = phi %struct.block* [ %69, %308 ], [ %60, %57 ]
  %64 = getelementptr %struct.block, %struct.block* %63, i64 0, i32 0, !dbg !699
  %65 = load i64, i64* %64, align 8, !dbg !699, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !700
  call void @llvm.dbg.value(metadata i64 %65, metadata !123, metadata !DIExpression()), !dbg !702
  %66 = and i64 %65, -16, !dbg !704
  call void @llvm.dbg.value(metadata i64 %66, metadata !630, metadata !DIExpression()), !dbg !705
  %67 = icmp ult i64 %66, %31, !dbg !706
  %68 = getelementptr inbounds %struct.block, %struct.block* %63, i64 0, i32 1, i32 0, i32 0, !dbg !707
  %69 = load %struct.block*, %struct.block** %68, align 8, !dbg !696, !tbaa !297
  %70 = icmp eq %struct.block* %69, null, !dbg !707
  br i1 %67, label %308, label %71, !dbg !708

71:                                               ; preds = %62
  call void @llvm.dbg.value(metadata %struct.block* %63, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %65, metadata !123, metadata !DIExpression()), !dbg !712
  call void @llvm.dbg.value(metadata i64 %66, metadata !640, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.value(metadata %struct.block* %63, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %66, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata %struct.block* %69, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 1, metadata !633, metadata !DIExpression()), !dbg !715
  br i1 %70, label %341, label %72, !dbg !716, !llvm.loop !717

72:                                               ; preds = %71
  call void @llvm.dbg.value(metadata %struct.block* %69, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %63, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %66, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 1, metadata !633, metadata !DIExpression()), !dbg !715
  %73 = getelementptr %struct.block, %struct.block* %69, i64 0, i32 0, !dbg !719
  %74 = load i64, i64* %73, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %74, metadata !123, metadata !DIExpression()), !dbg !712
  %75 = and i64 %74, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %75, metadata !640, metadata !DIExpression()), !dbg !714
  %76 = icmp uge i64 %75, %66, !dbg !721
  %77 = icmp ult i64 %75, %31
  %78 = or i1 %76, %77, !dbg !723
  %79 = select i1 %78, %struct.block* %63, %struct.block* %69, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %80 = select i1 %78, i64 %66, i64 %75, !dbg !723
  call void @llvm.dbg.value(metadata i64 %80, metadata !636, metadata !DIExpression()), !dbg !715
  %81 = getelementptr inbounds %struct.block, %struct.block* %69, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %82 = load %struct.block*, %struct.block** %81, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %82, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 2, metadata !633, metadata !DIExpression()), !dbg !715
  %83 = icmp eq %struct.block* %82, null, !dbg !725
  br i1 %83, label %341, label %84, !dbg !716, !llvm.loop !726

84:                                               ; preds = %72
  call void @llvm.dbg.value(metadata %struct.block* %82, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %80, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 2, metadata !633, metadata !DIExpression()), !dbg !715
  %85 = getelementptr %struct.block, %struct.block* %82, i64 0, i32 0, !dbg !719
  %86 = load i64, i64* %85, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %86, metadata !123, metadata !DIExpression()), !dbg !712
  %87 = and i64 %86, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %87, metadata !640, metadata !DIExpression()), !dbg !714
  %88 = icmp uge i64 %87, %80, !dbg !721
  %89 = icmp ult i64 %87, %31
  %90 = or i1 %88, %89, !dbg !723
  %91 = select i1 %90, %struct.block* %79, %struct.block* %82, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %91, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %92 = select i1 %90, i64 %80, i64 %87, !dbg !723
  call void @llvm.dbg.value(metadata i64 %92, metadata !636, metadata !DIExpression()), !dbg !715
  %93 = getelementptr inbounds %struct.block, %struct.block* %82, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %94 = load %struct.block*, %struct.block** %93, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %94, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 3, metadata !633, metadata !DIExpression()), !dbg !715
  %95 = icmp eq %struct.block* %94, null, !dbg !725
  br i1 %95, label %341, label %96, !dbg !716, !llvm.loop !727

96:                                               ; preds = %84
  call void @llvm.dbg.value(metadata %struct.block* %94, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %91, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %92, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 3, metadata !633, metadata !DIExpression()), !dbg !715
  %97 = getelementptr %struct.block, %struct.block* %94, i64 0, i32 0, !dbg !719
  %98 = load i64, i64* %97, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %98, metadata !123, metadata !DIExpression()), !dbg !712
  %99 = and i64 %98, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %99, metadata !640, metadata !DIExpression()), !dbg !714
  %100 = icmp uge i64 %99, %92, !dbg !721
  %101 = icmp ult i64 %99, %31
  %102 = or i1 %100, %101, !dbg !723
  %103 = select i1 %102, %struct.block* %91, %struct.block* %94, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %103, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %104 = select i1 %102, i64 %92, i64 %99, !dbg !723
  call void @llvm.dbg.value(metadata i64 %104, metadata !636, metadata !DIExpression()), !dbg !715
  %105 = getelementptr inbounds %struct.block, %struct.block* %94, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %106 = load %struct.block*, %struct.block** %105, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %106, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 4, metadata !633, metadata !DIExpression()), !dbg !715
  %107 = icmp eq %struct.block* %106, null, !dbg !725
  br i1 %107, label %341, label %108, !dbg !716, !llvm.loop !728

108:                                              ; preds = %96
  call void @llvm.dbg.value(metadata %struct.block* %106, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %103, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %104, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 4, metadata !633, metadata !DIExpression()), !dbg !715
  %109 = getelementptr %struct.block, %struct.block* %106, i64 0, i32 0, !dbg !719
  %110 = load i64, i64* %109, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %110, metadata !123, metadata !DIExpression()), !dbg !712
  %111 = and i64 %110, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %111, metadata !640, metadata !DIExpression()), !dbg !714
  %112 = icmp uge i64 %111, %104, !dbg !721
  %113 = icmp ult i64 %111, %31
  %114 = or i1 %112, %113, !dbg !723
  %115 = select i1 %114, %struct.block* %103, %struct.block* %106, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %115, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %116 = select i1 %114, i64 %104, i64 %111, !dbg !723
  call void @llvm.dbg.value(metadata i64 %116, metadata !636, metadata !DIExpression()), !dbg !715
  %117 = getelementptr inbounds %struct.block, %struct.block* %106, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %118 = load %struct.block*, %struct.block** %117, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %118, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 5, metadata !633, metadata !DIExpression()), !dbg !715
  %119 = icmp eq %struct.block* %118, null, !dbg !725
  br i1 %119, label %341, label %120, !dbg !716, !llvm.loop !729

120:                                              ; preds = %108
  call void @llvm.dbg.value(metadata %struct.block* %118, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %115, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %116, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 5, metadata !633, metadata !DIExpression()), !dbg !715
  %121 = getelementptr %struct.block, %struct.block* %118, i64 0, i32 0, !dbg !719
  %122 = load i64, i64* %121, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %122, metadata !123, metadata !DIExpression()), !dbg !712
  %123 = and i64 %122, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %123, metadata !640, metadata !DIExpression()), !dbg !714
  %124 = icmp uge i64 %123, %116, !dbg !721
  %125 = icmp ult i64 %123, %31
  %126 = or i1 %124, %125, !dbg !723
  %127 = select i1 %126, %struct.block* %115, %struct.block* %118, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %127, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %128 = select i1 %126, i64 %116, i64 %123, !dbg !723
  call void @llvm.dbg.value(metadata i64 %128, metadata !636, metadata !DIExpression()), !dbg !715
  %129 = getelementptr inbounds %struct.block, %struct.block* %118, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %130 = load %struct.block*, %struct.block** %129, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %130, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 6, metadata !633, metadata !DIExpression()), !dbg !715
  %131 = icmp eq %struct.block* %130, null, !dbg !725
  br i1 %131, label %341, label %132, !dbg !716, !llvm.loop !730

132:                                              ; preds = %120
  call void @llvm.dbg.value(metadata %struct.block* %130, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %127, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %128, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 6, metadata !633, metadata !DIExpression()), !dbg !715
  %133 = getelementptr %struct.block, %struct.block* %130, i64 0, i32 0, !dbg !719
  %134 = load i64, i64* %133, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %134, metadata !123, metadata !DIExpression()), !dbg !712
  %135 = and i64 %134, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %135, metadata !640, metadata !DIExpression()), !dbg !714
  %136 = icmp uge i64 %135, %128, !dbg !721
  %137 = icmp ult i64 %135, %31
  %138 = or i1 %136, %137, !dbg !723
  %139 = select i1 %138, %struct.block* %127, %struct.block* %130, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %139, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %140 = select i1 %138, i64 %128, i64 %135, !dbg !723
  call void @llvm.dbg.value(metadata i64 %140, metadata !636, metadata !DIExpression()), !dbg !715
  %141 = getelementptr inbounds %struct.block, %struct.block* %130, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %142 = load %struct.block*, %struct.block** %141, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %142, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 7, metadata !633, metadata !DIExpression()), !dbg !715
  %143 = icmp eq %struct.block* %142, null, !dbg !725
  br i1 %143, label %341, label %144, !dbg !716, !llvm.loop !731

144:                                              ; preds = %132
  call void @llvm.dbg.value(metadata %struct.block* %142, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %139, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %140, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 7, metadata !633, metadata !DIExpression()), !dbg !715
  %145 = getelementptr %struct.block, %struct.block* %142, i64 0, i32 0, !dbg !719
  %146 = load i64, i64* %145, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %146, metadata !123, metadata !DIExpression()), !dbg !712
  %147 = and i64 %146, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %147, metadata !640, metadata !DIExpression()), !dbg !714
  %148 = icmp uge i64 %147, %140, !dbg !721
  %149 = icmp ult i64 %147, %31
  %150 = or i1 %148, %149, !dbg !723
  %151 = select i1 %150, %struct.block* %139, %struct.block* %142, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %151, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %152 = select i1 %150, i64 %140, i64 %147, !dbg !723
  call void @llvm.dbg.value(metadata i64 %152, metadata !636, metadata !DIExpression()), !dbg !715
  %153 = getelementptr inbounds %struct.block, %struct.block* %142, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %154 = load %struct.block*, %struct.block** %153, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %154, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 8, metadata !633, metadata !DIExpression()), !dbg !715
  %155 = icmp eq %struct.block* %154, null, !dbg !725
  br i1 %155, label %341, label %156, !dbg !716, !llvm.loop !732

156:                                              ; preds = %144
  call void @llvm.dbg.value(metadata %struct.block* %154, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %151, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %152, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 8, metadata !633, metadata !DIExpression()), !dbg !715
  %157 = getelementptr %struct.block, %struct.block* %154, i64 0, i32 0, !dbg !719
  %158 = load i64, i64* %157, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %158, metadata !123, metadata !DIExpression()), !dbg !712
  %159 = and i64 %158, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %159, metadata !640, metadata !DIExpression()), !dbg !714
  %160 = icmp uge i64 %159, %152, !dbg !721
  %161 = icmp ult i64 %159, %31
  %162 = or i1 %160, %161, !dbg !723
  %163 = select i1 %162, %struct.block* %151, %struct.block* %154, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %163, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %164 = select i1 %162, i64 %152, i64 %159, !dbg !723
  call void @llvm.dbg.value(metadata i64 %164, metadata !636, metadata !DIExpression()), !dbg !715
  %165 = getelementptr inbounds %struct.block, %struct.block* %154, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %166 = load %struct.block*, %struct.block** %165, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %166, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 9, metadata !633, metadata !DIExpression()), !dbg !715
  %167 = icmp eq %struct.block* %166, null, !dbg !725
  br i1 %167, label %341, label %168, !dbg !716, !llvm.loop !733

168:                                              ; preds = %156
  call void @llvm.dbg.value(metadata %struct.block* %166, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %163, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %164, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 9, metadata !633, metadata !DIExpression()), !dbg !715
  %169 = getelementptr %struct.block, %struct.block* %166, i64 0, i32 0, !dbg !719
  %170 = load i64, i64* %169, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %170, metadata !123, metadata !DIExpression()), !dbg !712
  %171 = and i64 %170, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %171, metadata !640, metadata !DIExpression()), !dbg !714
  %172 = icmp uge i64 %171, %164, !dbg !721
  %173 = icmp ult i64 %171, %31
  %174 = or i1 %172, %173, !dbg !723
  %175 = select i1 %174, %struct.block* %163, %struct.block* %166, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %175, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %176 = select i1 %174, i64 %164, i64 %171, !dbg !723
  call void @llvm.dbg.value(metadata i64 %176, metadata !636, metadata !DIExpression()), !dbg !715
  %177 = getelementptr inbounds %struct.block, %struct.block* %166, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %178 = load %struct.block*, %struct.block** %177, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %178, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 10, metadata !633, metadata !DIExpression()), !dbg !715
  %179 = icmp eq %struct.block* %178, null, !dbg !725
  br i1 %179, label %341, label %180, !dbg !716, !llvm.loop !734

180:                                              ; preds = %168
  call void @llvm.dbg.value(metadata %struct.block* %178, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %175, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %176, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 10, metadata !633, metadata !DIExpression()), !dbg !715
  %181 = getelementptr %struct.block, %struct.block* %178, i64 0, i32 0, !dbg !719
  %182 = load i64, i64* %181, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %182, metadata !123, metadata !DIExpression()), !dbg !712
  %183 = and i64 %182, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %183, metadata !640, metadata !DIExpression()), !dbg !714
  %184 = icmp uge i64 %183, %176, !dbg !721
  %185 = icmp ult i64 %183, %31
  %186 = or i1 %184, %185, !dbg !723
  %187 = select i1 %186, %struct.block* %175, %struct.block* %178, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %187, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %188 = select i1 %186, i64 %176, i64 %183, !dbg !723
  call void @llvm.dbg.value(metadata i64 %188, metadata !636, metadata !DIExpression()), !dbg !715
  %189 = getelementptr inbounds %struct.block, %struct.block* %178, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %190 = load %struct.block*, %struct.block** %189, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %190, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 11, metadata !633, metadata !DIExpression()), !dbg !715
  %191 = icmp eq %struct.block* %190, null, !dbg !725
  br i1 %191, label %341, label %192, !dbg !716, !llvm.loop !735

192:                                              ; preds = %180
  call void @llvm.dbg.value(metadata %struct.block* %190, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %187, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %188, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 11, metadata !633, metadata !DIExpression()), !dbg !715
  %193 = getelementptr %struct.block, %struct.block* %190, i64 0, i32 0, !dbg !719
  %194 = load i64, i64* %193, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %194, metadata !123, metadata !DIExpression()), !dbg !712
  %195 = and i64 %194, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %195, metadata !640, metadata !DIExpression()), !dbg !714
  %196 = icmp uge i64 %195, %188, !dbg !721
  %197 = icmp ult i64 %195, %31
  %198 = or i1 %196, %197, !dbg !723
  %199 = select i1 %198, %struct.block* %187, %struct.block* %190, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %199, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %200 = select i1 %198, i64 %188, i64 %195, !dbg !723
  call void @llvm.dbg.value(metadata i64 %200, metadata !636, metadata !DIExpression()), !dbg !715
  %201 = getelementptr inbounds %struct.block, %struct.block* %190, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %202 = load %struct.block*, %struct.block** %201, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %202, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 12, metadata !633, metadata !DIExpression()), !dbg !715
  %203 = icmp eq %struct.block* %202, null, !dbg !725
  br i1 %203, label %341, label %204, !dbg !716, !llvm.loop !736

204:                                              ; preds = %192
  call void @llvm.dbg.value(metadata %struct.block* %202, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %199, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %200, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 12, metadata !633, metadata !DIExpression()), !dbg !715
  %205 = getelementptr %struct.block, %struct.block* %202, i64 0, i32 0, !dbg !719
  %206 = load i64, i64* %205, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %206, metadata !123, metadata !DIExpression()), !dbg !712
  %207 = and i64 %206, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %207, metadata !640, metadata !DIExpression()), !dbg !714
  %208 = icmp uge i64 %207, %200, !dbg !721
  %209 = icmp ult i64 %207, %31
  %210 = or i1 %208, %209, !dbg !723
  %211 = select i1 %210, %struct.block* %199, %struct.block* %202, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %211, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %212 = select i1 %210, i64 %200, i64 %207, !dbg !723
  call void @llvm.dbg.value(metadata i64 %212, metadata !636, metadata !DIExpression()), !dbg !715
  %213 = getelementptr inbounds %struct.block, %struct.block* %202, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %214 = load %struct.block*, %struct.block** %213, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %214, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 13, metadata !633, metadata !DIExpression()), !dbg !715
  %215 = icmp eq %struct.block* %214, null, !dbg !725
  br i1 %215, label %341, label %216, !dbg !716, !llvm.loop !737

216:                                              ; preds = %204
  call void @llvm.dbg.value(metadata %struct.block* %214, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %211, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %212, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 13, metadata !633, metadata !DIExpression()), !dbg !715
  %217 = getelementptr %struct.block, %struct.block* %214, i64 0, i32 0, !dbg !719
  %218 = load i64, i64* %217, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %218, metadata !123, metadata !DIExpression()), !dbg !712
  %219 = and i64 %218, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %219, metadata !640, metadata !DIExpression()), !dbg !714
  %220 = icmp uge i64 %219, %212, !dbg !721
  %221 = icmp ult i64 %219, %31
  %222 = or i1 %220, %221, !dbg !723
  %223 = select i1 %222, %struct.block* %211, %struct.block* %214, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %223, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %224 = select i1 %222, i64 %212, i64 %219, !dbg !723
  call void @llvm.dbg.value(metadata i64 %224, metadata !636, metadata !DIExpression()), !dbg !715
  %225 = getelementptr inbounds %struct.block, %struct.block* %214, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %226 = load %struct.block*, %struct.block** %225, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %226, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 14, metadata !633, metadata !DIExpression()), !dbg !715
  %227 = icmp eq %struct.block* %226, null, !dbg !725
  br i1 %227, label %341, label %228, !dbg !716, !llvm.loop !738

228:                                              ; preds = %216
  call void @llvm.dbg.value(metadata %struct.block* %226, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %223, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %224, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 14, metadata !633, metadata !DIExpression()), !dbg !715
  %229 = getelementptr %struct.block, %struct.block* %226, i64 0, i32 0, !dbg !719
  %230 = load i64, i64* %229, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %230, metadata !123, metadata !DIExpression()), !dbg !712
  %231 = and i64 %230, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %231, metadata !640, metadata !DIExpression()), !dbg !714
  %232 = icmp uge i64 %231, %224, !dbg !721
  %233 = icmp ult i64 %231, %31
  %234 = or i1 %232, %233, !dbg !723
  %235 = select i1 %234, %struct.block* %223, %struct.block* %226, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %235, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %236 = select i1 %234, i64 %224, i64 %231, !dbg !723
  call void @llvm.dbg.value(metadata i64 %236, metadata !636, metadata !DIExpression()), !dbg !715
  %237 = getelementptr inbounds %struct.block, %struct.block* %226, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %238 = load %struct.block*, %struct.block** %237, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %238, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 15, metadata !633, metadata !DIExpression()), !dbg !715
  %239 = icmp eq %struct.block* %238, null, !dbg !725
  br i1 %239, label %341, label %240, !dbg !716, !llvm.loop !739

240:                                              ; preds = %228
  call void @llvm.dbg.value(metadata %struct.block* %238, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %235, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %236, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 15, metadata !633, metadata !DIExpression()), !dbg !715
  %241 = getelementptr %struct.block, %struct.block* %238, i64 0, i32 0, !dbg !719
  %242 = load i64, i64* %241, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %242, metadata !123, metadata !DIExpression()), !dbg !712
  %243 = and i64 %242, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %243, metadata !640, metadata !DIExpression()), !dbg !714
  %244 = icmp uge i64 %243, %236, !dbg !721
  %245 = icmp ult i64 %243, %31
  %246 = or i1 %244, %245, !dbg !723
  %247 = select i1 %246, %struct.block* %235, %struct.block* %238, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %247, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %248 = select i1 %246, i64 %236, i64 %243, !dbg !723
  call void @llvm.dbg.value(metadata i64 %248, metadata !636, metadata !DIExpression()), !dbg !715
  %249 = getelementptr inbounds %struct.block, %struct.block* %238, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %250 = load %struct.block*, %struct.block** %249, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %250, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 16, metadata !633, metadata !DIExpression()), !dbg !715
  %251 = icmp eq %struct.block* %250, null, !dbg !725
  br i1 %251, label %341, label %252, !dbg !716, !llvm.loop !740

252:                                              ; preds = %240
  call void @llvm.dbg.value(metadata %struct.block* %250, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %247, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %248, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 16, metadata !633, metadata !DIExpression()), !dbg !715
  %253 = getelementptr %struct.block, %struct.block* %250, i64 0, i32 0, !dbg !719
  %254 = load i64, i64* %253, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %254, metadata !123, metadata !DIExpression()), !dbg !712
  %255 = and i64 %254, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %255, metadata !640, metadata !DIExpression()), !dbg !714
  %256 = icmp uge i64 %255, %248, !dbg !721
  %257 = icmp ult i64 %255, %31
  %258 = or i1 %256, %257, !dbg !723
  %259 = select i1 %258, %struct.block* %247, %struct.block* %250, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %259, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %260 = select i1 %258, i64 %248, i64 %255, !dbg !723
  call void @llvm.dbg.value(metadata i64 %260, metadata !636, metadata !DIExpression()), !dbg !715
  %261 = getelementptr inbounds %struct.block, %struct.block* %250, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %262 = load %struct.block*, %struct.block** %261, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %262, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 17, metadata !633, metadata !DIExpression()), !dbg !715
  %263 = icmp eq %struct.block* %262, null, !dbg !725
  br i1 %263, label %341, label %264, !dbg !716, !llvm.loop !741

264:                                              ; preds = %252
  call void @llvm.dbg.value(metadata %struct.block* %262, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %259, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %260, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 17, metadata !633, metadata !DIExpression()), !dbg !715
  %265 = getelementptr %struct.block, %struct.block* %262, i64 0, i32 0, !dbg !719
  %266 = load i64, i64* %265, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %266, metadata !123, metadata !DIExpression()), !dbg !712
  %267 = and i64 %266, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %267, metadata !640, metadata !DIExpression()), !dbg !714
  %268 = icmp uge i64 %267, %260, !dbg !721
  %269 = icmp ult i64 %267, %31
  %270 = or i1 %268, %269, !dbg !723
  %271 = select i1 %270, %struct.block* %259, %struct.block* %262, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %271, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %272 = select i1 %270, i64 %260, i64 %267, !dbg !723
  call void @llvm.dbg.value(metadata i64 %272, metadata !636, metadata !DIExpression()), !dbg !715
  %273 = getelementptr inbounds %struct.block, %struct.block* %262, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %274 = load %struct.block*, %struct.block** %273, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %274, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 18, metadata !633, metadata !DIExpression()), !dbg !715
  %275 = icmp eq %struct.block* %274, null, !dbg !725
  br i1 %275, label %341, label %276, !dbg !716, !llvm.loop !742

276:                                              ; preds = %264
  call void @llvm.dbg.value(metadata %struct.block* %274, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %271, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %272, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 18, metadata !633, metadata !DIExpression()), !dbg !715
  %277 = getelementptr %struct.block, %struct.block* %274, i64 0, i32 0, !dbg !719
  %278 = load i64, i64* %277, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %278, metadata !123, metadata !DIExpression()), !dbg !712
  %279 = and i64 %278, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %279, metadata !640, metadata !DIExpression()), !dbg !714
  %280 = icmp uge i64 %279, %272, !dbg !721
  %281 = icmp ult i64 %279, %31
  %282 = or i1 %280, %281, !dbg !723
  %283 = select i1 %282, %struct.block* %271, %struct.block* %274, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %283, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  %284 = select i1 %282, i64 %272, i64 %279, !dbg !723
  call void @llvm.dbg.value(metadata i64 %284, metadata !636, metadata !DIExpression()), !dbg !715
  %285 = getelementptr inbounds %struct.block, %struct.block* %274, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %286 = load %struct.block*, %struct.block** %285, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %286, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 19, metadata !633, metadata !DIExpression()), !dbg !715
  %287 = icmp eq %struct.block* %286, null, !dbg !725
  br i1 %287, label %341, label %288, !dbg !716, !llvm.loop !743

288:                                              ; preds = %276
  call void @llvm.dbg.value(metadata %struct.block* %286, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %283, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 %284, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 19, metadata !633, metadata !DIExpression()), !dbg !715
  %289 = getelementptr %struct.block, %struct.block* %286, i64 0, i32 0, !dbg !719
  %290 = load i64, i64* %289, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %290, metadata !123, metadata !DIExpression()), !dbg !712
  %291 = and i64 %290, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %291, metadata !640, metadata !DIExpression()), !dbg !714
  %292 = icmp uge i64 %291, %284, !dbg !721
  %293 = icmp ult i64 %291, %31
  %294 = or i1 %292, %293, !dbg !723
  %295 = select i1 %294, %struct.block* %283, %struct.block* %286, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %295, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  %296 = getelementptr inbounds %struct.block, %struct.block* %286, i64 0, i32 1, i32 0, i32 0, !dbg !724
  %297 = load %struct.block*, %struct.block** %296, align 8, !dbg !724, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %297, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata i64 20, metadata !633, metadata !DIExpression()), !dbg !715
  %298 = icmp eq %struct.block* %297, null, !dbg !725
  br i1 %298, label %341, label %299, !dbg !716, !llvm.loop !744

299:                                              ; preds = %288
  %300 = select i1 %294, i64 %284, i64 %291, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %297, metadata !638, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.value(metadata %struct.block* %295, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !636, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 20, metadata !633, metadata !DIExpression()), !dbg !715
  %301 = getelementptr %struct.block, %struct.block* %297, i64 0, i32 0, !dbg !719
  %302 = load i64, i64* %301, align 8, !dbg !719, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !710
  call void @llvm.dbg.value(metadata i64 %302, metadata !123, metadata !DIExpression()), !dbg !712
  %303 = and i64 %302, -16, !dbg !720
  call void @llvm.dbg.value(metadata i64 %303, metadata !640, metadata !DIExpression()), !dbg !714
  %304 = icmp uge i64 %303, %300, !dbg !721
  %305 = icmp ult i64 %303, %31
  %306 = or i1 %304, %305, !dbg !723
  %307 = select i1 %306, %struct.block* %295, %struct.block* %297, !dbg !723
  call void @llvm.dbg.value(metadata %struct.block* %307, metadata !637, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.value(metadata i64 undef, metadata !633, metadata !DIExpression()), !dbg !715
  br label %341

308:                                              ; preds = %62
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !628, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata %struct.block* %69, metadata !628, metadata !DIExpression()), !dbg !696
  br i1 %70, label %309, label %62, !dbg !698, !llvm.loop !745

309:                                              ; preds = %308, %57
  %310 = add nuw nsw i64 %58, 1, !dbg !747
  call void @llvm.dbg.value(metadata i64 %310, metadata !623, metadata !DIExpression()), !dbg !693
  %311 = icmp eq i64 %310, 10, !dbg !748
  br i1 %311, label %312, label %57, !dbg !692, !llvm.loop !749

312:                                              ; preds = %309
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !533, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.value(metadata i64 %31, metadata !751, metadata !DIExpression()), !dbg !755
  call void @llvm.dbg.value(metadata i64 4096, metadata !754, metadata !DIExpression()), !dbg !755
  %313 = icmp ugt i64 %31, 4096, !dbg !759
  %314 = select i1 %313, i64 %31, i64 4096, !dbg !760
  call void @llvm.dbg.value(metadata i64 %314, metadata !532, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.value(metadata i64 %314, metadata !606, metadata !DIExpression()) #6, !dbg !761
  call void @llvm.dbg.value(metadata i64 16, metadata !611, metadata !DIExpression()) #6, !dbg !761
  call void @llvm.dbg.value(metadata i64 %314, metadata !431, metadata !DIExpression()) #6, !dbg !764
  %315 = tail call i8* @mem_sbrk(i64 noundef %314) #6, !dbg !765
  call void @llvm.dbg.value(metadata i8* %315, metadata !436, metadata !DIExpression()) #6, !dbg !764
  %316 = icmp eq i8* %315, inttoptr (i64 -1 to i8*), !dbg !766
  br i1 %316, label %539, label %317, !dbg !767

317:                                              ; preds = %312
  call void @llvm.dbg.value(metadata i8* %315, metadata !446, metadata !DIExpression()) #6, !dbg !768
  %318 = getelementptr inbounds i8, i8* %315, i64 -8, !dbg !770
  %319 = bitcast i8* %318 to %struct.block*, !dbg !771
  call void @llvm.dbg.value(metadata %struct.block* %319, metadata !437, metadata !DIExpression()) #6, !dbg !764
  %320 = bitcast i8* %318 to i64*, !dbg !772
  call void @llvm.dbg.value(metadata %struct.block* %319, metadata !456, metadata !DIExpression()) #6, !dbg !773
  call void @llvm.dbg.value(metadata i64 %314, metadata !461, metadata !DIExpression()) #6, !dbg !773
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !773
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !773
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !773
  %321 = load i64, i64* %320, align 8, !dbg !772, !tbaa !137
  %322 = and i64 %321, 6, !dbg !775
  call void @llvm.dbg.value(metadata i64 %314, metadata !415, metadata !DIExpression()) #6, !dbg !776
  call void @llvm.dbg.value(metadata i64 %314, metadata !415, metadata !DIExpression()) #6, !dbg !778
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !778
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !778
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !778
  call void @llvm.dbg.value(metadata i64 undef, metadata !423, metadata !DIExpression()) #6, !dbg !778
  %323 = or i64 %322, %314, !dbg !780
  call void @llvm.dbg.value(metadata i64 %323, metadata !423, metadata !DIExpression()) #6, !dbg !778
  store i64 %323, i64* %320, align 8, !dbg !781, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %319, metadata !483, metadata !DIExpression()) #6, !dbg !782
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !784
  call void @llvm.dbg.value(metadata i64 %323, metadata !123, metadata !DIExpression()) #6, !dbg !786
  %324 = getelementptr inbounds i8, i8* %315, i64 %314, !dbg !788
  %325 = getelementptr inbounds i8, i8* %324, i64 -16, !dbg !789
  %326 = bitcast i8* %325 to i64*, !dbg !790
  call void @llvm.dbg.value(metadata i64* %326, metadata !465, metadata !DIExpression()) #6, !dbg !791
  call void @llvm.dbg.value(metadata i64 %314, metadata !415, metadata !DIExpression()) #6, !dbg !792
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !792
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !792
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !792
  call void @llvm.dbg.value(metadata i64 %323, metadata !423, metadata !DIExpression()) #6, !dbg !792
  store i64 %323, i64* %326, align 8, !dbg !794, !tbaa !121
  %327 = load i64, i64* %320, align 8, !dbg !795, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %319, metadata !171, metadata !DIExpression()) #6, !dbg !797
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !798
  call void @llvm.dbg.value(metadata i64 %327, metadata !123, metadata !DIExpression()) #6, !dbg !800
  %328 = and i64 %327, -16, !dbg !802
  %329 = getelementptr inbounds i8, i8* %318, i64 %328, !dbg !803
  call void @llvm.dbg.value(metadata i8* %329, metadata !470, metadata !DIExpression()) #6, !dbg !804
  %330 = bitcast i8* %329 to i64*, !dbg !805
  %331 = load i64, i64* %330, align 8, !dbg !805, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !806
  call void @llvm.dbg.value(metadata i64 %331, metadata !213, metadata !DIExpression()) #6, !dbg !808
  call void @llvm.dbg.value(metadata i1 undef, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !804
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !810
  call void @llvm.dbg.value(metadata i64 %331, metadata !123, metadata !DIExpression()) #6, !dbg !812
  call void @llvm.dbg.value(metadata i64 %331, metadata !472, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !804
  call void @llvm.dbg.value(metadata i64 %331, metadata !415, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !814
  call void @llvm.dbg.value(metadata i64 %331, metadata !415, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !816
  %332 = and i64 %331, -15, !dbg !818
  store i64 %332, i64* %330, align 8, !dbg !819, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %319, metadata !171, metadata !DIExpression()) #6, !dbg !820
  %333 = load i64, i64* %320, align 8, !dbg !822, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !823
  call void @llvm.dbg.value(metadata i64 %333, metadata !123, metadata !DIExpression()) #6, !dbg !825
  %334 = and i64 %333, -16, !dbg !827
  %335 = getelementptr inbounds i8, i8* %318, i64 %334, !dbg !828
  call void @llvm.dbg.value(metadata i8* %335, metadata !438, metadata !DIExpression()) #6, !dbg !764
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !829
  call void @llvm.dbg.value(metadata i64 %333, metadata !123, metadata !DIExpression()) #6, !dbg !831
  %336 = icmp eq i64 %334, 16, !dbg !833
  call void @llvm.dbg.value(metadata i8* %335, metadata !507, metadata !DIExpression()) #6, !dbg !834
  call void @llvm.dbg.value(metadata i1 %336, metadata !512, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !834
  call void @llvm.dbg.value(metadata i64 0, metadata !415, metadata !DIExpression()) #6, !dbg !836
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !836
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !836
  call void @llvm.dbg.value(metadata i1 %336, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !836
  call void @llvm.dbg.value(metadata i64 1, metadata !423, metadata !DIExpression()) #6, !dbg !836
  %337 = select i1 %336, i64 5, i64 1, !dbg !838
  call void @llvm.dbg.value(metadata i64 %337, metadata !423, metadata !DIExpression()) #6, !dbg !836
  %338 = bitcast i8* %335 to i64*, !dbg !839
  store i64 %337, i64* %338, align 8, !dbg !840, !tbaa !137
  %339 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %319) #6, !dbg !841
  call void @llvm.dbg.value(metadata %struct.block* %339, metadata !437, metadata !DIExpression()) #6, !dbg !764
  call void @llvm.dbg.value(metadata %struct.block* %339, metadata !533, metadata !DIExpression()), !dbg !536
  %340 = icmp eq %struct.block* %339, null, !dbg !842
  br i1 %340, label %539, label %341, !dbg !844

341:                                              ; preds = %299, %288, %276, %264, %252, %240, %228, %216, %204, %192, %180, %168, %156, %144, %132, %120, %108, %96, %84, %72, %71, %33, %317
  %342 = phi %struct.block* [ %339, %317 ], [ %307, %299 ], [ %295, %288 ], [ %283, %276 ], [ %271, %264 ], [ %259, %252 ], [ %247, %240 ], [ %235, %228 ], [ %223, %216 ], [ %211, %204 ], [ %199, %192 ], [ %187, %180 ], [ %175, %168 ], [ %163, %156 ], [ %151, %144 ], [ %139, %132 ], [ %127, %120 ], [ %115, %108 ], [ %103, %96 ], [ %91, %84 ], [ %79, %72 ], [ %63, %71 ], [ %34, %33 ], !dbg !536
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !533, metadata !DIExpression()), !dbg !536
  %343 = getelementptr %struct.block, %struct.block* %342, i64 0, i32 0, !dbg !845
  %344 = load i64, i64* %343, align 8, !dbg !845, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !846
  call void @llvm.dbg.value(metadata i64 %344, metadata !123, metadata !DIExpression()), !dbg !848
  %345 = and i64 %344, -16, !dbg !850
  call void @llvm.dbg.value(metadata i64 %345, metadata !535, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !456, metadata !DIExpression()), !dbg !851
  call void @llvm.dbg.value(metadata i64 %345, metadata !461, metadata !DIExpression()), !dbg !851
  call void @llvm.dbg.value(metadata i1 true, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !851
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !851
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !851
  %346 = icmp eq i64 %345, 16, !dbg !853
  br i1 %346, label %347, label %355, !dbg !854

347:                                              ; preds = %341
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !851
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !851
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !855, metadata !DIExpression()), !dbg !865
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()), !dbg !865
  call void @llvm.dbg.value(metadata i1 true, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !865
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !865
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !865
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !868
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !872
  %348 = and i64 %344, 6, !dbg !875
  %349 = or i64 %348, 17, !dbg !875
  store i64 %349, i64* %343, align 8, !dbg !876
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !171, metadata !DIExpression()), !dbg !877
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !879
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !881
  %350 = getelementptr inbounds %struct.block, %struct.block* %342, i64 0, i32 1, i32 0, i32 1, !dbg !883
  %351 = bitcast %struct.block** %350 to i64*, !dbg !884
  call void @llvm.dbg.value(metadata i64* %351, metadata !862, metadata !DIExpression()), !dbg !865
  %352 = load i64, i64* %351, align 8, !dbg !884, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !885
  call void @llvm.dbg.value(metadata i64 %352, metadata !213, metadata !DIExpression()), !dbg !887
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !865
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !889
  call void @llvm.dbg.value(metadata i64 %352, metadata !123, metadata !DIExpression()), !dbg !891
  call void @llvm.dbg.value(metadata i64 %352, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !865
  %353 = and i64 %352, -15, !dbg !893
  %354 = or i64 %353, 6, !dbg !893
  store i64 %354, i64* %351, align 8, !dbg !893, !tbaa !137
  br label %369, !dbg !895

355:                                              ; preds = %341
  call void @llvm.dbg.value(metadata i64 %345, metadata !415, metadata !DIExpression()), !dbg !896
  call void @llvm.dbg.value(metadata i64 %345, metadata !415, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !896
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !896
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !896
  call void @llvm.dbg.value(metadata i64 %344, metadata !423, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !896
  %356 = and i64 %344, -10, !dbg !900
  %357 = or i64 %356, 1, !dbg !900
  call void @llvm.dbg.value(metadata !DIArgList(i64 %344, i64 %344), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 4, DW_OP_and, DW_OP_constu, 1, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !896
  store i64 %357, i64* %343, align 8, !dbg !901, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !171, metadata !DIExpression()), !dbg !902
  %358 = bitcast %struct.block* %342 to i8*, !dbg !904
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !905
  call void @llvm.dbg.value(metadata !DIArgList(i64 %344, i64 %344), metadata !123, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 4, DW_OP_and, DW_OP_constu, 1, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !907
  %359 = getelementptr inbounds i8, i8* %358, i64 %345, !dbg !909
  call void @llvm.dbg.value(metadata i8* %359, metadata !470, metadata !DIExpression()), !dbg !910
  %360 = bitcast i8* %359 to i64*, !dbg !911
  %361 = load i64, i64* %360, align 8, !dbg !911, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !912
  call void @llvm.dbg.value(metadata i64 %361, metadata !213, metadata !DIExpression()), !dbg !914
  %362 = and i64 %361, 1, !dbg !916
  %363 = icmp eq i64 %362, 0, !dbg !917
  call void @llvm.dbg.value(metadata i1 %363, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !910
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !918
  call void @llvm.dbg.value(metadata i64 %361, metadata !123, metadata !DIExpression()), !dbg !920
  %364 = and i64 %361, -16, !dbg !922
  call void @llvm.dbg.value(metadata i64 %364, metadata !472, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.value(metadata i64 %364, metadata !415, metadata !DIExpression()), !dbg !923
  call void @llvm.dbg.value(metadata i64 %364, metadata !415, metadata !DIExpression()), !dbg !925
  br i1 %363, label %367, label %365, !dbg !927

365:                                              ; preds = %355
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !925
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !925
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !925
  call void @llvm.dbg.value(metadata i64 %364, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !925
  %366 = or i64 %364, 3, !dbg !928
  call void @llvm.dbg.value(metadata i64 %366, metadata !423, metadata !DIExpression()), !dbg !925
  store i64 %366, i64* %360, align 8, !dbg !929, !tbaa !137
  br label %369, !dbg !930

367:                                              ; preds = %355
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !923
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !923
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !923
  call void @llvm.dbg.value(metadata i64 %364, metadata !423, metadata !DIExpression()), !dbg !923
  %368 = or i64 %364, 2, !dbg !931
  call void @llvm.dbg.value(metadata i64 %368, metadata !423, metadata !DIExpression()), !dbg !923
  store i64 %368, i64* %360, align 8, !dbg !932, !tbaa !137
  br label %369

369:                                              ; preds = %347, %365, %367
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !933, metadata !DIExpression()) #6, !dbg !944
  %370 = load i64, i64* %343, align 8, !dbg !946, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !947
  call void @llvm.dbg.value(metadata i64 %370, metadata !123, metadata !DIExpression()) #6, !dbg !949
  %371 = and i64 %370, -16, !dbg !951
  call void @llvm.dbg.value(metadata i64 %371, metadata !938, metadata !DIExpression()) #6, !dbg !944
  %372 = icmp eq i64 %371, 16, !dbg !952
  br i1 %372, label %373, label %388, !dbg !953

373:                                              ; preds = %369, %373
  %374 = phi %struct.block** [ %380, %373 ], [ @mini_list_start, %369 ]
  %375 = phi %struct.block* [ %376, %373 ], [ null, %369 ], !dbg !954
  %376 = load %struct.block*, %struct.block** %374, align 8, !dbg !954, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %375, metadata !959, metadata !DIExpression()) #6, !dbg !954
  call void @llvm.dbg.value(metadata %struct.block* %376, metadata !958, metadata !DIExpression()) #6, !dbg !954
  %377 = icmp ne %struct.block* %376, null, !dbg !962
  %378 = icmp ne %struct.block* %376, %342, !dbg !963
  %379 = and i1 %377, %378, !dbg !963
  call void @llvm.dbg.value(metadata %struct.block* %376, metadata !959, metadata !DIExpression()) #6, !dbg !954
  %380 = getelementptr inbounds %struct.block, %struct.block* %376, i64 0, i32 1, i32 0, i32 0, !dbg !964
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !958, metadata !DIExpression()) #6, !dbg !954
  br i1 %379, label %373, label %381, !dbg !966, !llvm.loop !967

381:                                              ; preds = %373
  %382 = icmp eq %struct.block* %376, null, !dbg !969
  br i1 %382, label %422, label %383, !dbg !971

383:                                              ; preds = %381
  %384 = icmp eq %struct.block* %375, null, !dbg !972
  %385 = load %struct.block*, %struct.block** %380, align 8, !dbg !974, !tbaa !297
  %386 = getelementptr inbounds %struct.block, %struct.block* %375, i64 0, i32 1, i32 0, i32 0, !dbg !975
  %387 = select i1 %384, %struct.block** @mini_list_start, %struct.block** %386, !dbg !975
  store %struct.block* %385, %struct.block** %387, align 8, !dbg !974, !tbaa !297
  br label %422, !dbg !976

388:                                              ; preds = %369
  call void @llvm.dbg.value(metadata i64 %371, metadata !658, metadata !DIExpression()) #6, !dbg !977
  %389 = icmp ult i64 %371, 17, !dbg !979
  br i1 %389, label %407, label %390, !dbg !980

390:                                              ; preds = %388
  %391 = icmp ult i64 %371, 33, !dbg !981
  br i1 %391, label %407, label %392, !dbg !982

392:                                              ; preds = %390
  %393 = icmp ult i64 %371, 65, !dbg !983
  br i1 %393, label %407, label %394, !dbg !984

394:                                              ; preds = %392
  %395 = icmp ult i64 %371, 129, !dbg !985
  br i1 %395, label %407, label %396, !dbg !986

396:                                              ; preds = %394
  %397 = icmp ult i64 %371, 257, !dbg !987
  br i1 %397, label %407, label %398, !dbg !988

398:                                              ; preds = %396
  %399 = icmp ult i64 %371, 513, !dbg !989
  br i1 %399, label %407, label %400, !dbg !990

400:                                              ; preds = %398
  %401 = icmp ult i64 %371, 1025, !dbg !991
  br i1 %401, label %407, label %402, !dbg !992

402:                                              ; preds = %400
  %403 = icmp ult i64 %371, 2049, !dbg !993
  br i1 %403, label %407, label %404, !dbg !994

404:                                              ; preds = %402
  %405 = icmp ult i64 %371, 4097, !dbg !995
  %406 = select i1 %405, i64 8, i64 9, !dbg !996
  br label %407, !dbg !996

407:                                              ; preds = %404, %402, %400, %398, %396, %394, %392, %390, %388
  %408 = phi i64 [ 0, %388 ], [ 1, %390 ], [ 2, %392 ], [ 3, %394 ], [ 4, %396 ], [ 5, %398 ], [ 6, %400 ], [ 7, %402 ], [ %406, %404 ], !dbg !997
  call void @llvm.dbg.value(metadata i64 %408, metadata !939, metadata !DIExpression()) #6, !dbg !998
  %409 = getelementptr inbounds %struct.block, %struct.block* %342, i64 0, i32 1, i32 0, i32 0, !dbg !999
  %410 = load %struct.block*, %struct.block** %409, align 8, !dbg !999, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %410, metadata !942, metadata !DIExpression()) #6, !dbg !998
  %411 = getelementptr inbounds %struct.block, %struct.block* %342, i64 0, i32 1, i32 0, i32 1, !dbg !1000
  %412 = load %struct.block*, %struct.block** %411, align 8, !dbg !1000, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %412, metadata !943, metadata !DIExpression()) #6, !dbg !998
  %413 = icmp eq %struct.block* %412, null, !dbg !1001
  %414 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %408, !dbg !1003
  %415 = getelementptr inbounds %struct.block, %struct.block* %412, i64 0, i32 1, i32 0, i32 0, !dbg !1003
  %416 = select i1 %413, %struct.block** %414, %struct.block** %415, !dbg !1003
  store %struct.block* %410, %struct.block** %416, align 8, !dbg !1004, !tbaa !297
  %417 = icmp eq %struct.block* %410, null, !dbg !1005
  br i1 %417, label %420, label %418, !dbg !1007

418:                                              ; preds = %407
  %419 = getelementptr inbounds %struct.block, %struct.block* %410, i64 0, i32 1, i32 0, i32 1, !dbg !1008
  store %struct.block* %412, %struct.block** %419, align 8, !dbg !1010, !tbaa !297
  br label %420, !dbg !1011

420:                                              ; preds = %418, %407
  %421 = bitcast %struct.block** %409 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %421, i8 0, i64 16, i1 false) #6, !dbg !1012
  br label %422

422:                                              ; preds = %381, %383, %420
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !1013, metadata !DIExpression()) #6, !dbg !1026
  call void @llvm.dbg.value(metadata i64 %31, metadata !1018, metadata !DIExpression()) #6, !dbg !1026
  %423 = load i64, i64* %343, align 8, !dbg !1028, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1029
  call void @llvm.dbg.value(metadata i64 %423, metadata !123, metadata !DIExpression()) #6, !dbg !1031
  %424 = and i64 %423, -16, !dbg !1033
  call void @llvm.dbg.value(metadata i64 %424, metadata !1019, metadata !DIExpression()) #6, !dbg !1026
  %425 = sub i64 %424, %31, !dbg !1034
  %426 = icmp eq i64 %425, 0, !dbg !1035
  br i1 %426, label %536, label %427, !dbg !1036

427:                                              ; preds = %422
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !456, metadata !DIExpression()) #6, !dbg !1037
  call void @llvm.dbg.value(metadata i64 %31, metadata !461, metadata !DIExpression()) #6, !dbg !1037
  call void @llvm.dbg.value(metadata i1 true, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1037
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1037
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1037
  %428 = and i64 %423, 6, !dbg !1039
  br i1 %32, label %429, label %436, !dbg !1040

429:                                              ; preds = %427
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1037
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1037
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !855, metadata !DIExpression()) #6, !dbg !1041
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()) #6, !dbg !1041
  call void @llvm.dbg.value(metadata i1 true, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1041
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1041
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1041
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !1043
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !1045
  %430 = or i64 %428, 17, !dbg !1047
  store i64 %430, i64* %343, align 8, !dbg !1048
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !171, metadata !DIExpression()) #6, !dbg !1049
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1051
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()) #6, !dbg !1053
  %431 = getelementptr inbounds %struct.block, %struct.block* %342, i64 0, i32 1, i32 0, i32 1, !dbg !1055
  %432 = bitcast %struct.block** %431 to i64*, !dbg !1056
  call void @llvm.dbg.value(metadata i64* %432, metadata !862, metadata !DIExpression()) #6, !dbg !1041
  %433 = load i64, i64* %432, align 8, !dbg !1056, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !1057
  call void @llvm.dbg.value(metadata i64 %433, metadata !213, metadata !DIExpression()) #6, !dbg !1059
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1041
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1061
  call void @llvm.dbg.value(metadata i64 %433, metadata !123, metadata !DIExpression()) #6, !dbg !1063
  call void @llvm.dbg.value(metadata i64 %433, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !1041
  %434 = and i64 %433, -15, !dbg !1065
  %435 = or i64 %434, 6, !dbg !1065
  store i64 %435, i64* %432, align 8, !dbg !1065, !tbaa !137
  br label %450, !dbg !1066

436:                                              ; preds = %427
  call void @llvm.dbg.value(metadata i64 %31, metadata !415, metadata !DIExpression()) #6, !dbg !1067
  call void @llvm.dbg.value(metadata i64 %31, metadata !415, metadata !DIExpression()) #6, !dbg !1069
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1067
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1067
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1067
  call void @llvm.dbg.value(metadata !DIArgList(i64 %423, i64 %31), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1067
  %437 = or i64 %31, %428, !dbg !1071
  %438 = or i64 %437, 1, !dbg !1071
  call void @llvm.dbg.value(metadata !DIArgList(i64 %423, i64 undef, i64 %31), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1067
  store i64 %438, i64* %343, align 8, !dbg !1072, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !171, metadata !DIExpression()) #6, !dbg !1073
  %439 = bitcast %struct.block* %342 to i8*, !dbg !1075
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1076
  call void @llvm.dbg.value(metadata !DIArgList(i64 %423, i64 undef, i64 %31), metadata !123, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1078
  %440 = getelementptr inbounds i8, i8* %439, i64 %31, !dbg !1080
  call void @llvm.dbg.value(metadata i8* %440, metadata !470, metadata !DIExpression()) #6, !dbg !1081
  %441 = bitcast i8* %440 to i64*, !dbg !1082
  %442 = load i64, i64* %441, align 8, !dbg !1082, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !1083
  call void @llvm.dbg.value(metadata i64 %442, metadata !213, metadata !DIExpression()) #6, !dbg !1085
  %443 = and i64 %442, 1, !dbg !1087
  %444 = icmp eq i64 %443, 0, !dbg !1088
  call void @llvm.dbg.value(metadata i1 %444, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1081
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1089
  call void @llvm.dbg.value(metadata i64 %442, metadata !123, metadata !DIExpression()) #6, !dbg !1091
  %445 = and i64 %442, -16, !dbg !1093
  call void @llvm.dbg.value(metadata i64 %445, metadata !472, metadata !DIExpression()) #6, !dbg !1081
  call void @llvm.dbg.value(metadata i64 %445, metadata !415, metadata !DIExpression()) #6, !dbg !1094
  call void @llvm.dbg.value(metadata i64 %445, metadata !415, metadata !DIExpression()) #6, !dbg !1096
  br i1 %444, label %448, label %446, !dbg !1098

446:                                              ; preds = %436
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1096
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1096
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1096
  call void @llvm.dbg.value(metadata i64 %445, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1096
  %447 = or i64 %445, 3, !dbg !1099
  call void @llvm.dbg.value(metadata i64 %447, metadata !423, metadata !DIExpression()) #6, !dbg !1096
  store i64 %447, i64* %441, align 8, !dbg !1100, !tbaa !137
  br label %450, !dbg !1101

448:                                              ; preds = %436
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1094
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1094
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1094
  call void @llvm.dbg.value(metadata i64 %445, metadata !423, metadata !DIExpression()) #6, !dbg !1094
  %449 = or i64 %445, 2, !dbg !1102
  call void @llvm.dbg.value(metadata i64 %449, metadata !423, metadata !DIExpression()) #6, !dbg !1094
  store i64 %449, i64* %441, align 8, !dbg !1103, !tbaa !137
  br label %450

450:                                              ; preds = %448, %446, %429
  %451 = bitcast %struct.block* %342 to i8*, !dbg !1104
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !171, metadata !DIExpression()) #6, !dbg !1106
  %452 = load i64, i64* %343, align 8, !dbg !1107, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1108
  call void @llvm.dbg.value(metadata i64 %452, metadata !123, metadata !DIExpression()) #6, !dbg !1110
  %453 = and i64 %452, -16, !dbg !1112
  %454 = getelementptr inbounds i8, i8* %451, i64 %453, !dbg !1113
  call void @llvm.dbg.value(metadata i8* %454, metadata !1020, metadata !DIExpression()) #6, !dbg !1114
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i64 %452, metadata !123, metadata !DIExpression()) #6, !dbg !1117
  %455 = icmp eq i64 %453, 16, !dbg !1119
  call void @llvm.dbg.value(metadata i8* %454, metadata !456, metadata !DIExpression()) #6, !dbg !1120
  call void @llvm.dbg.value(metadata i64 %425, metadata !461, metadata !DIExpression()) #6, !dbg !1120
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1120
  call void @llvm.dbg.value(metadata i1 true, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1120
  call void @llvm.dbg.value(metadata i1 %455, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1120
  %456 = icmp eq i64 %425, 16, !dbg !1122
  br i1 %456, label %457, label %465, !dbg !1123

457:                                              ; preds = %450
  call void @llvm.dbg.value(metadata i8* %454, metadata !1020, metadata !DIExpression()) #6, !dbg !1114
  call void @llvm.dbg.value(metadata i8* %454, metadata !456, metadata !DIExpression()) #6, !dbg !1120
  call void @llvm.dbg.value(metadata i8* %454, metadata !855, metadata !DIExpression()) #6, !dbg !1124
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()) #6, !dbg !1124
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1124
  call void @llvm.dbg.value(metadata i1 true, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1124
  call void @llvm.dbg.value(metadata i1 %455, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1124
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !1126
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !1128
  %458 = select i1 %455, i64 22, i64 18, !dbg !1130
  %459 = bitcast i8* %454 to i64*, !dbg !1131
  store i64 %458, i64* %459, align 8, !dbg !1132
  call void @llvm.dbg.value(metadata i8* %454, metadata !171, metadata !DIExpression()) #6, !dbg !1133
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1135
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()) #6, !dbg !1137
  %460 = getelementptr inbounds i8, i8* %454, i64 16, !dbg !1139
  %461 = bitcast i8* %460 to i64*, !dbg !1140
  call void @llvm.dbg.value(metadata i64* %461, metadata !862, metadata !DIExpression()) #6, !dbg !1124
  %462 = load i64, i64* %461, align 8, !dbg !1140, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !1141
  call void @llvm.dbg.value(metadata i64 %462, metadata !213, metadata !DIExpression()) #6, !dbg !1143
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1124
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1145
  call void @llvm.dbg.value(metadata i64 %462, metadata !123, metadata !DIExpression()) #6, !dbg !1147
  call void @llvm.dbg.value(metadata i64 %462, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !1124
  %463 = and i64 %462, -15, !dbg !1149
  %464 = or i64 %463, 4, !dbg !1150
  store i64 %464, i64* %461, align 8, !dbg !1150, !tbaa !137
  br label %484, !dbg !1151

465:                                              ; preds = %450
  call void @llvm.dbg.value(metadata i64 %425, metadata !415, metadata !DIExpression()) #6, !dbg !1152
  call void @llvm.dbg.value(metadata i64 %425, metadata !415, metadata !DIExpression()) #6, !dbg !1154
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1154
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1154
  call void @llvm.dbg.value(metadata i1 %455, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1154
  call void @llvm.dbg.value(metadata i64 %425, metadata !423, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1154
  %466 = select i1 %455, i64 6, i64 2, !dbg !1156
  %467 = or i64 %466, %425, !dbg !1156
  call void @llvm.dbg.value(metadata !DIArgList(i64 %425, i64 %466), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1154
  %468 = bitcast i8* %454 to i64*, !dbg !1157
  store i64 %467, i64* %468, align 8, !dbg !1158, !tbaa !137
  call void @llvm.dbg.value(metadata i8* %454, metadata !483, metadata !DIExpression()) #6, !dbg !1159
  %469 = getelementptr inbounds i8, i8* %454, i64 8, !dbg !1161
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1162
  call void @llvm.dbg.value(metadata !DIArgList(i64 %425, i64 %466), metadata !123, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1164
  %470 = getelementptr inbounds i8, i8* %469, i64 %425, !dbg !1166
  %471 = getelementptr inbounds i8, i8* %470, i64 -16, !dbg !1167
  %472 = bitcast i8* %471 to i64*, !dbg !1168
  call void @llvm.dbg.value(metadata i64* %472, metadata !465, metadata !DIExpression()) #6, !dbg !1169
  call void @llvm.dbg.value(metadata i64 %425, metadata !415, metadata !DIExpression()) #6, !dbg !1170
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1170
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1170
  call void @llvm.dbg.value(metadata i1 %455, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1170
  call void @llvm.dbg.value(metadata !DIArgList(i64 %425, i64 %466), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1170
  store i64 %467, i64* %472, align 8, !dbg !1172, !tbaa !121
  %473 = load i64, i64* %468, align 8, !dbg !1173, !tbaa !137
  call void @llvm.dbg.value(metadata i8* %454, metadata !171, metadata !DIExpression()) #6, !dbg !1175
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1176
  call void @llvm.dbg.value(metadata i64 %473, metadata !123, metadata !DIExpression()) #6, !dbg !1178
  %474 = and i64 %473, -16, !dbg !1180
  %475 = getelementptr inbounds i8, i8* %454, i64 %474, !dbg !1181
  call void @llvm.dbg.value(metadata i8* %475, metadata !470, metadata !DIExpression()) #6, !dbg !1182
  %476 = bitcast i8* %475 to i64*, !dbg !1183
  %477 = load i64, i64* %476, align 8, !dbg !1183, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !1184
  call void @llvm.dbg.value(metadata i64 %477, metadata !213, metadata !DIExpression()) #6, !dbg !1186
  %478 = and i64 %477, 1, !dbg !1188
  %479 = icmp eq i64 %478, 0, !dbg !1189
  call void @llvm.dbg.value(metadata i1 %479, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1182
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1190
  call void @llvm.dbg.value(metadata i64 %477, metadata !123, metadata !DIExpression()) #6, !dbg !1192
  %480 = and i64 %477, -16, !dbg !1194
  call void @llvm.dbg.value(metadata i64 %480, metadata !472, metadata !DIExpression()) #6, !dbg !1182
  call void @llvm.dbg.value(metadata i64 %480, metadata !415, metadata !DIExpression()) #6, !dbg !1195
  call void @llvm.dbg.value(metadata i64 %480, metadata !415, metadata !DIExpression()) #6, !dbg !1197
  br i1 %479, label %483, label %481, !dbg !1199

481:                                              ; preds = %465
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1197
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1197
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1197
  call void @llvm.dbg.value(metadata i64 %480, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1197
  %482 = or i64 %480, 1, !dbg !1200
  call void @llvm.dbg.value(metadata i64 %482, metadata !423, metadata !DIExpression()) #6, !dbg !1197
  store i64 %482, i64* %476, align 8, !dbg !1201, !tbaa !137
  br label %484, !dbg !1202

483:                                              ; preds = %465
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1195
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1195
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1195
  call void @llvm.dbg.value(metadata i64 %480, metadata !423, metadata !DIExpression()) #6, !dbg !1195
  store i64 %480, i64* %476, align 8, !dbg !1203, !tbaa !137
  br label %484

484:                                              ; preds = %483, %481, %457
  %485 = bitcast i8* %454 to i64*, !dbg !1204
  call void @llvm.dbg.value(metadata i8* %454, metadata !1207, metadata !DIExpression()) #6, !dbg !1213
  %486 = load i64, i64* %485, align 8, !dbg !1204, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1214
  call void @llvm.dbg.value(metadata i64 %486, metadata !123, metadata !DIExpression()) #6, !dbg !1216
  %487 = and i64 %486, -16, !dbg !1218
  call void @llvm.dbg.value(metadata i64 %487, metadata !1208, metadata !DIExpression()) #6, !dbg !1213
  %488 = icmp eq i64 %487, 16, !dbg !1219
  br i1 %488, label %489, label %493, !dbg !1220

489:                                              ; preds = %484
  call void @llvm.dbg.value(metadata i8* %454, metadata !1221, metadata !DIExpression()) #6, !dbg !1224
  %490 = load %struct.block*, %struct.block** @mini_list_start, align 8, !dbg !1227, !tbaa !89
  store i8* %454, i8** bitcast (%struct.block** @mini_list_start to i8**), align 8, !dbg !1229, !tbaa !89
  %491 = getelementptr inbounds i8, i8* %454, i64 8, !dbg !1230
  %492 = bitcast i8* %491 to %struct.block**, !dbg !1230
  store %struct.block* %490, %struct.block** %492, align 8, !dbg !1232
  br label %530, !dbg !1233

493:                                              ; preds = %484
  call void @llvm.dbg.value(metadata i64 %487, metadata !658, metadata !DIExpression()) #6, !dbg !1234
  %494 = icmp ult i64 %487, 17, !dbg !1236
  br i1 %494, label %512, label %495, !dbg !1237

495:                                              ; preds = %493
  %496 = icmp ult i64 %487, 33, !dbg !1238
  br i1 %496, label %512, label %497, !dbg !1239

497:                                              ; preds = %495
  %498 = icmp ult i64 %487, 65, !dbg !1240
  br i1 %498, label %512, label %499, !dbg !1241

499:                                              ; preds = %497
  %500 = icmp ult i64 %487, 129, !dbg !1242
  br i1 %500, label %512, label %501, !dbg !1243

501:                                              ; preds = %499
  %502 = icmp ult i64 %487, 257, !dbg !1244
  br i1 %502, label %512, label %503, !dbg !1245

503:                                              ; preds = %501
  %504 = icmp ult i64 %487, 513, !dbg !1246
  br i1 %504, label %512, label %505, !dbg !1247

505:                                              ; preds = %503
  %506 = icmp ult i64 %487, 1025, !dbg !1248
  br i1 %506, label %512, label %507, !dbg !1249

507:                                              ; preds = %505
  %508 = icmp ult i64 %487, 2049, !dbg !1250
  br i1 %508, label %512, label %509, !dbg !1251

509:                                              ; preds = %507
  %510 = icmp ult i64 %487, 4097, !dbg !1252
  %511 = select i1 %510, i64 8, i64 9, !dbg !1253
  br label %512, !dbg !1253

512:                                              ; preds = %509, %507, %505, %503, %501, %499, %497, %495, %493
  %513 = phi i64 [ 0, %493 ], [ 1, %495 ], [ 2, %497 ], [ 3, %499 ], [ 4, %501 ], [ 5, %503 ], [ 6, %505 ], [ 7, %507 ], [ %511, %509 ], !dbg !1254
  call void @llvm.dbg.value(metadata i64 %513, metadata !1209, metadata !DIExpression()) #6, !dbg !1255
  %514 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %513, !dbg !1256
  %515 = load %struct.block*, %struct.block** %514, align 8, !dbg !1256, !tbaa !89
  %516 = icmp eq %struct.block* %515, null, !dbg !1258
  br i1 %516, label %517, label %520, !dbg !1259

517:                                              ; preds = %512
  %518 = bitcast %struct.block** %514 to i8**, !dbg !1260
  store i8* %454, i8** %518, align 8, !dbg !1260, !tbaa !89
  %519 = getelementptr inbounds i8, i8* %454, i64 8, !dbg !1262
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %519, i8 0, i64 16, i1 false) #6, !dbg !1263
  br label %530, !dbg !1264

520:                                              ; preds = %512
  %521 = getelementptr inbounds i8, i8* %454, i64 8, !dbg !1265
  %522 = bitcast i8* %521 to %struct.block**, !dbg !1265
  store %struct.block* %515, %struct.block** %522, align 8, !dbg !1267, !tbaa !297
  %523 = load %struct.block*, %struct.block** %514, align 8, !dbg !1268, !tbaa !89
  %524 = getelementptr inbounds %struct.block, %struct.block* %523, i64 0, i32 1, i32 0, i32 1, !dbg !1269
  %525 = bitcast %struct.block** %524 to i8**, !dbg !1270
  store i8* %454, i8** %525, align 8, !dbg !1270, !tbaa !297
  %526 = getelementptr inbounds i8, i8* %454, i64 16, !dbg !1271
  %527 = bitcast i8* %526 to %struct.block**, !dbg !1271
  store %struct.block* null, %struct.block** %527, align 8, !dbg !1272, !tbaa !297
  %528 = bitcast %struct.block** %514 to i8**, !dbg !1273
  store i8* %454, i8** %528, align 8, !dbg !1273, !tbaa !89
  %529 = load i64, i64* %485, align 8, !dbg !1274, !tbaa !137
  br label %530

530:                                              ; preds = %520, %517, %489
  %531 = phi i64 [ %486, %489 ], [ %486, %517 ], [ %529, %520 ], !dbg !1274
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1275
  call void @llvm.dbg.value(metadata i64 %531, metadata !123, metadata !DIExpression()) #6, !dbg !1277
  %532 = and i64 %531, -16, !dbg !1279
  %533 = icmp eq i64 %532, 16, !dbg !1280
  br i1 %533, label %534, label %536, !dbg !1281

534:                                              ; preds = %530
  %535 = tail call i8* @mem_heap_hi() #6, !dbg !1282
  call void @llvm.dbg.value(metadata i8* %535, metadata !1023, metadata !DIExpression(DW_OP_constu, 7, DW_OP_minus, DW_OP_stack_value)) #6, !dbg !1283
  br label %536, !dbg !1284

536:                                              ; preds = %422, %530, %534
  call void @llvm.dbg.value(metadata %struct.block* %342, metadata !1285, metadata !DIExpression()), !dbg !1290
  %537 = getelementptr inbounds %struct.block, %struct.block* %342, i64 0, i32 1, !dbg !1292
  %538 = bitcast %union.anon* %537 to i8*, !dbg !1293
  call void @llvm.dbg.value(metadata i8* %538, metadata !534, metadata !DIExpression()), !dbg !536
  br label %539

539:                                              ; preds = %312, %7, %4, %317, %27, %12, %536
  %540 = phi i8* [ %538, %536 ], [ null, %12 ], [ null, %27 ], [ null, %317 ], [ null, %4 ], [ null, %7 ], [ null, %312 ], !dbg !536
  ret i8* %540, !dbg !1294
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @mm_free(i8* noundef %0) local_unnamed_addr #2 !dbg !1295 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1299, metadata !DIExpression()), !dbg !1302
  %2 = icmp eq i8* %0, null, !dbg !1303
  br i1 %2, label %36, label %3, !dbg !1305

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8* %0, metadata !446, metadata !DIExpression()), !dbg !1306
  %4 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !1308
  %5 = bitcast i8* %4 to %struct.block*, !dbg !1309
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !1300, metadata !DIExpression()), !dbg !1302
  %6 = bitcast i8* %4 to i64*, !dbg !1310
  %7 = load i64, i64* %6, align 8, !dbg !1310, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.value(metadata i64 %7, metadata !123, metadata !DIExpression()), !dbg !1313
  %8 = and i64 %7, -16, !dbg !1315
  call void @llvm.dbg.value(metadata i64 %8, metadata !1301, metadata !DIExpression()), !dbg !1302
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !456, metadata !DIExpression()), !dbg !1316
  call void @llvm.dbg.value(metadata i64 %8, metadata !461, metadata !DIExpression()), !dbg !1316
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1316
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1316
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1316
  %9 = icmp eq i64 %8, 16, !dbg !1318
  br i1 %9, label %10, label %18, !dbg !1319

10:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1316
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1316
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !855, metadata !DIExpression()), !dbg !1320
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()), !dbg !1320
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1320
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1320
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1320
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1322
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1324
  %11 = and i64 %7, 6, !dbg !1326
  %12 = or i64 %11, 16, !dbg !1326
  store i64 %12, i64* %6, align 8, !dbg !1327
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !171, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !1332
  %13 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !1334
  %14 = bitcast i8* %13 to i64*, !dbg !1335
  call void @llvm.dbg.value(metadata i64* %14, metadata !862, metadata !DIExpression()), !dbg !1320
  %15 = load i64, i64* %14, align 8, !dbg !1335, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1336
  call void @llvm.dbg.value(metadata i64 %15, metadata !213, metadata !DIExpression()), !dbg !1338
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1320
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1340
  call void @llvm.dbg.value(metadata i64 %15, metadata !123, metadata !DIExpression()), !dbg !1342
  call void @llvm.dbg.value(metadata i64 %15, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1320
  %16 = and i64 %15, -15, !dbg !1344
  %17 = or i64 %16, 4, !dbg !1345
  store i64 %17, i64* %14, align 8, !dbg !1345, !tbaa !137
  br label %34, !dbg !1346

18:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i64 %8, metadata !415, metadata !DIExpression()), !dbg !1347
  call void @llvm.dbg.value(metadata i64 %8, metadata !415, metadata !DIExpression()), !dbg !1349
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1349
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1349
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1349
  call void @llvm.dbg.value(metadata i64 %8, metadata !423, metadata !DIExpression()), !dbg !1349
  call void @llvm.dbg.value(metadata i64 %8, metadata !423, metadata !DIExpression()), !dbg !1349
  call void @llvm.dbg.value(metadata i64 %7, metadata !423, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)), !dbg !1349
  %19 = and i64 %7, -10, !dbg !1351
  call void @llvm.dbg.value(metadata i64 %19, metadata !423, metadata !DIExpression()), !dbg !1349
  store i64 %19, i64* %6, align 8, !dbg !1352, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !483, metadata !DIExpression()), !dbg !1353
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1355
  call void @llvm.dbg.value(metadata i64 %19, metadata !123, metadata !DIExpression()), !dbg !1357
  %20 = getelementptr inbounds i8, i8* %0, i64 %8, !dbg !1359
  %21 = getelementptr inbounds i8, i8* %20, i64 -16, !dbg !1360
  %22 = bitcast i8* %21 to i64*, !dbg !1361
  call void @llvm.dbg.value(metadata i64* %22, metadata !465, metadata !DIExpression()), !dbg !1362
  call void @llvm.dbg.value(metadata i64 %8, metadata !415, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1363
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1363
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1363
  call void @llvm.dbg.value(metadata i64 %8, metadata !423, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.value(metadata i64 %8, metadata !423, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.value(metadata i64 %7, metadata !423, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)), !dbg !1363
  call void @llvm.dbg.value(metadata i64 %19, metadata !423, metadata !DIExpression()), !dbg !1363
  store i64 %19, i64* %22, align 8, !dbg !1365, !tbaa !121
  %23 = load i64, i64* %6, align 8, !dbg !1366, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !171, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1369
  call void @llvm.dbg.value(metadata i64 %23, metadata !123, metadata !DIExpression()), !dbg !1371
  %24 = and i64 %23, -16, !dbg !1373
  %25 = getelementptr inbounds i8, i8* %4, i64 %24, !dbg !1374
  call void @llvm.dbg.value(metadata i8* %25, metadata !470, metadata !DIExpression()), !dbg !1375
  %26 = bitcast i8* %25 to i64*, !dbg !1376
  %27 = load i64, i64* %26, align 8, !dbg !1376, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1377
  call void @llvm.dbg.value(metadata i64 %27, metadata !213, metadata !DIExpression()), !dbg !1379
  %28 = and i64 %27, 1, !dbg !1381
  %29 = icmp eq i64 %28, 0, !dbg !1382
  call void @llvm.dbg.value(metadata i1 %29, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1375
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1383
  call void @llvm.dbg.value(metadata i64 %27, metadata !123, metadata !DIExpression()), !dbg !1385
  %30 = and i64 %27, -16, !dbg !1387
  call void @llvm.dbg.value(metadata i64 %30, metadata !472, metadata !DIExpression()), !dbg !1375
  call void @llvm.dbg.value(metadata i64 %30, metadata !415, metadata !DIExpression()), !dbg !1388
  call void @llvm.dbg.value(metadata i64 %30, metadata !415, metadata !DIExpression()), !dbg !1390
  br i1 %29, label %33, label %31, !dbg !1392

31:                                               ; preds = %18
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1390
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1390
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1390
  call void @llvm.dbg.value(metadata i64 %30, metadata !423, metadata !DIExpression()), !dbg !1390
  call void @llvm.dbg.value(metadata i64 %30, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1390
  %32 = or i64 %30, 1, !dbg !1393
  call void @llvm.dbg.value(metadata i64 %32, metadata !423, metadata !DIExpression()), !dbg !1390
  call void @llvm.dbg.value(metadata i64 %32, metadata !423, metadata !DIExpression()), !dbg !1390
  store i64 %32, i64* %26, align 8, !dbg !1394, !tbaa !137
  br label %34, !dbg !1395

33:                                               ; preds = %18
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1388
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1388
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1388
  call void @llvm.dbg.value(metadata i64 %30, metadata !423, metadata !DIExpression()), !dbg !1388
  call void @llvm.dbg.value(metadata i64 %30, metadata !423, metadata !DIExpression()), !dbg !1388
  call void @llvm.dbg.value(metadata i64 %30, metadata !423, metadata !DIExpression()), !dbg !1388
  call void @llvm.dbg.value(metadata i64 %30, metadata !423, metadata !DIExpression()), !dbg !1388
  store i64 %30, i64* %26, align 8, !dbg !1396, !tbaa !137
  br label %34

34:                                               ; preds = %10, %31, %33
  %35 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %5), !dbg !1397
  br label %36

36:                                               ; preds = %1, %34
  ret void, !dbg !1398
}

; Function Attrs: nofree nosync nounwind uwtable
define internal fastcc %struct.block* @coalesce_block(%struct.block* noundef %0) unnamed_addr #2 !dbg !1399 {
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1401, metadata !DIExpression()), !dbg !1419
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1402, metadata !DIExpression()), !dbg !1419
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !171, metadata !DIExpression()), !dbg !1420
  %2 = bitcast %struct.block* %0 to i8*, !dbg !1422
  %3 = getelementptr %struct.block, %struct.block* %0, i64 0, i32 0, !dbg !1423
  %4 = load i64, i64* %3, align 8, !dbg !1423, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1424
  call void @llvm.dbg.value(metadata i64 %4, metadata !123, metadata !DIExpression()), !dbg !1426
  %5 = and i64 %4, -16, !dbg !1428
  %6 = getelementptr inbounds i8, i8* %2, i64 %5, !dbg !1429
  %7 = bitcast i8* %6 to %struct.block*, !dbg !1430
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !1403, metadata !DIExpression()), !dbg !1419
  %8 = bitcast i8* %6 to i64*, !dbg !1431
  %9 = load i64, i64* %8, align 8, !dbg !1431, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1432
  call void @llvm.dbg.value(metadata i64 %9, metadata !213, metadata !DIExpression()), !dbg !1434
  %10 = and i64 %9, 1, !dbg !1436
  %11 = icmp ne i64 %10, 0, !dbg !1437
  call void @llvm.dbg.value(metadata i1 %11, metadata !1404, metadata !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1419
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1438, metadata !DIExpression()), !dbg !1441
  call void @llvm.dbg.value(metadata i64 %4, metadata !1443, metadata !DIExpression()), !dbg !1447
  call void @llvm.dbg.value(metadata i64 %4, metadata !1446, metadata !DIExpression(DW_OP_constu, 2, DW_OP_and, DW_OP_stack_value)), !dbg !1447
  %12 = and i64 %4, 2, !dbg !1449
  %13 = icmp ne i64 %12, 0, !dbg !1449
  call void @llvm.dbg.value(metadata i1 %13, metadata !1405, metadata !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1419
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1450, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i64 %4, metadata !1455, metadata !DIExpression()), !dbg !1459
  call void @llvm.dbg.value(metadata i64 %4, metadata !1458, metadata !DIExpression(DW_OP_constu, 4, DW_OP_and, DW_OP_stack_value)), !dbg !1459
  %14 = and i64 %4, 4, !dbg !1461
  %15 = icmp eq i64 %14, 0, !dbg !1461
  call void @llvm.dbg.value(metadata i1 %15, metadata !1406, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1419
  %16 = xor i1 %13, true, !dbg !1462
  %17 = xor i1 %11, true, !dbg !1462
  %18 = select i1 %16, i1 true, i1 %17, !dbg !1462
  br i1 %18, label %19, label %374, !dbg !1462

19:                                               ; preds = %1
  %20 = select i1 %16, i1 true, i1 %11, !dbg !1463
  br i1 %20, label %107, label %21, !dbg !1463

21:                                               ; preds = %19
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !933, metadata !DIExpression()) #6, !dbg !1464
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1466
  call void @llvm.dbg.value(metadata i64 %9, metadata !123, metadata !DIExpression()) #6, !dbg !1468
  %22 = and i64 %9, -16, !dbg !1470
  call void @llvm.dbg.value(metadata i64 %22, metadata !938, metadata !DIExpression()) #6, !dbg !1464
  %23 = icmp eq i64 %22, 16, !dbg !1471
  br i1 %23, label %24, label %39, !dbg !1472

24:                                               ; preds = %21, %24
  %25 = phi %struct.block** [ %31, %24 ], [ @mini_list_start, %21 ]
  %26 = phi %struct.block* [ %27, %24 ], [ null, %21 ], !dbg !1473
  %27 = load %struct.block*, %struct.block** %25, align 8, !dbg !1473, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %26, metadata !959, metadata !DIExpression()) #6, !dbg !1473
  call void @llvm.dbg.value(metadata %struct.block* %27, metadata !958, metadata !DIExpression()) #6, !dbg !1473
  %28 = icmp ne %struct.block* %27, null, !dbg !1475
  %29 = icmp ne %struct.block* %27, %7, !dbg !1476
  %30 = and i1 %28, %29, !dbg !1476
  call void @llvm.dbg.value(metadata %struct.block* %27, metadata !959, metadata !DIExpression()) #6, !dbg !1473
  %31 = getelementptr inbounds %struct.block, %struct.block* %27, i64 0, i32 1, i32 0, i32 0, !dbg !1477
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !958, metadata !DIExpression()) #6, !dbg !1473
  br i1 %30, label %24, label %32, !dbg !1478, !llvm.loop !1479

32:                                               ; preds = %24
  %33 = icmp eq %struct.block* %27, null, !dbg !1481
  br i1 %33, label %74, label %34, !dbg !1482

34:                                               ; preds = %32
  %35 = icmp eq %struct.block* %26, null, !dbg !1483
  %36 = load %struct.block*, %struct.block** %31, align 8, !dbg !1484, !tbaa !297
  %37 = getelementptr inbounds %struct.block, %struct.block* %26, i64 0, i32 1, i32 0, i32 0, !dbg !1485
  %38 = select i1 %35, %struct.block** @mini_list_start, %struct.block** %37, !dbg !1485
  store %struct.block* %36, %struct.block** %38, align 8, !dbg !1484, !tbaa !297
  br label %74, !dbg !1486

39:                                               ; preds = %21
  call void @llvm.dbg.value(metadata i64 %22, metadata !658, metadata !DIExpression()) #6, !dbg !1487
  %40 = icmp ult i64 %22, 17, !dbg !1489
  br i1 %40, label %58, label %41, !dbg !1490

41:                                               ; preds = %39
  %42 = icmp ult i64 %22, 33, !dbg !1491
  br i1 %42, label %58, label %43, !dbg !1492

43:                                               ; preds = %41
  %44 = icmp ult i64 %22, 65, !dbg !1493
  br i1 %44, label %58, label %45, !dbg !1494

45:                                               ; preds = %43
  %46 = icmp ult i64 %22, 129, !dbg !1495
  br i1 %46, label %58, label %47, !dbg !1496

47:                                               ; preds = %45
  %48 = icmp ult i64 %22, 257, !dbg !1497
  br i1 %48, label %58, label %49, !dbg !1498

49:                                               ; preds = %47
  %50 = icmp ult i64 %22, 513, !dbg !1499
  br i1 %50, label %58, label %51, !dbg !1500

51:                                               ; preds = %49
  %52 = icmp ult i64 %22, 1025, !dbg !1501
  br i1 %52, label %58, label %53, !dbg !1502

53:                                               ; preds = %51
  %54 = icmp ult i64 %22, 2049, !dbg !1503
  br i1 %54, label %58, label %55, !dbg !1504

55:                                               ; preds = %53
  %56 = icmp ult i64 %22, 4097, !dbg !1505
  %57 = select i1 %56, i64 8, i64 9, !dbg !1506
  br label %58, !dbg !1506

58:                                               ; preds = %55, %53, %51, %49, %47, %45, %43, %41, %39
  %59 = phi i64 [ 0, %39 ], [ 1, %41 ], [ 2, %43 ], [ 3, %45 ], [ 4, %47 ], [ 5, %49 ], [ 6, %51 ], [ 7, %53 ], [ %57, %55 ], !dbg !1507
  call void @llvm.dbg.value(metadata i64 %59, metadata !939, metadata !DIExpression()) #6, !dbg !1508
  %60 = getelementptr inbounds i8, i8* %6, i64 8, !dbg !1509
  %61 = bitcast i8* %60 to %struct.block**, !dbg !1509
  %62 = load %struct.block*, %struct.block** %61, align 8, !dbg !1509, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %62, metadata !942, metadata !DIExpression()) #6, !dbg !1508
  %63 = getelementptr inbounds i8, i8* %6, i64 16, !dbg !1510
  %64 = bitcast i8* %63 to %struct.block**, !dbg !1510
  %65 = load %struct.block*, %struct.block** %64, align 8, !dbg !1510, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %65, metadata !943, metadata !DIExpression()) #6, !dbg !1508
  %66 = icmp eq %struct.block* %65, null, !dbg !1511
  %67 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %59, !dbg !1512
  %68 = getelementptr inbounds %struct.block, %struct.block* %65, i64 0, i32 1, i32 0, i32 0, !dbg !1512
  %69 = select i1 %66, %struct.block** %67, %struct.block** %68, !dbg !1512
  store %struct.block* %62, %struct.block** %69, align 8, !dbg !1513, !tbaa !297
  %70 = icmp eq %struct.block* %62, null, !dbg !1514
  br i1 %70, label %73, label %71, !dbg !1515

71:                                               ; preds = %58
  %72 = getelementptr inbounds %struct.block, %struct.block* %62, i64 0, i32 1, i32 0, i32 1, !dbg !1516
  store %struct.block* %65, %struct.block** %72, align 8, !dbg !1517, !tbaa !297
  br label %73, !dbg !1518

73:                                               ; preds = %71, %58
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %60, i8 0, i64 16, i1 false) #6, !dbg !1519
  br label %74

74:                                               ; preds = %32, %34, %73
  %75 = load i64, i64* %3, align 8, !dbg !1520, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1521
  call void @llvm.dbg.value(metadata i64 %75, metadata !123, metadata !DIExpression()), !dbg !1523
  %76 = and i64 %75, -16, !dbg !1525
  %77 = load i64, i64* %8, align 8, !dbg !1526, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1527
  call void @llvm.dbg.value(metadata i64 %77, metadata !123, metadata !DIExpression()), !dbg !1529
  %78 = and i64 %77, -16, !dbg !1531
  %79 = add i64 %78, %76, !dbg !1532
  call void @llvm.dbg.value(metadata i64 %79, metadata !1407, metadata !DIExpression()), !dbg !1533
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !456, metadata !DIExpression()), !dbg !1534
  call void @llvm.dbg.value(metadata i64 %79, metadata !461, metadata !DIExpression()), !dbg !1534
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1534
  call void @llvm.dbg.value(metadata i1 true, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1534
  call void @llvm.dbg.value(metadata i1 %15, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1534
  %80 = icmp eq i64 %79, 16, !dbg !1536
  br i1 %80, label %81, label %88, !dbg !1537

81:                                               ; preds = %74
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !855, metadata !DIExpression()), !dbg !1538
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()), !dbg !1538
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1538
  call void @llvm.dbg.value(metadata i1 true, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1538
  call void @llvm.dbg.value(metadata i1 %15, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1538
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1540
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1542
  %82 = or i64 %14, 18, !dbg !1544
  store i64 %82, i64* %3, align 8, !dbg !1545
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !171, metadata !DIExpression()), !dbg !1546
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1548
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !1550
  %83 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1, !dbg !1552
  %84 = bitcast %struct.block** %83 to i64*, !dbg !1553
  call void @llvm.dbg.value(metadata i64* %84, metadata !862, metadata !DIExpression()), !dbg !1538
  %85 = load i64, i64* %84, align 8, !dbg !1553, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1554
  call void @llvm.dbg.value(metadata i64 %85, metadata !213, metadata !DIExpression()), !dbg !1556
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1538
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1558
  call void @llvm.dbg.value(metadata i64 %85, metadata !123, metadata !DIExpression()), !dbg !1560
  call void @llvm.dbg.value(metadata i64 %85, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1538
  %86 = and i64 %85, -15, !dbg !1562
  %87 = or i64 %86, 4, !dbg !1563
  store i64 %87, i64* %84, align 8, !dbg !1563, !tbaa !137
  br label %374, !dbg !1564

88:                                               ; preds = %74
  call void @llvm.dbg.value(metadata i64 %79, metadata !415, metadata !DIExpression()), !dbg !1565
  call void @llvm.dbg.value(metadata i64 %79, metadata !415, metadata !DIExpression()), !dbg !1567
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1567
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1567
  call void @llvm.dbg.value(metadata i1 %15, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1567
  call void @llvm.dbg.value(metadata i64 %79, metadata !423, metadata !DIExpression()), !dbg !1567
  call void @llvm.dbg.value(metadata i64 %79, metadata !423, metadata !DIExpression()), !dbg !1567
  call void @llvm.dbg.value(metadata i64 %79, metadata !423, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1567
  %89 = or i64 %14, %79, !dbg !1569
  %90 = or i64 %89, 2, !dbg !1569
  call void @llvm.dbg.value(metadata !DIArgList(i64 %79, i64 %14), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1567
  store i64 %90, i64* %3, align 8, !dbg !1570, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !483, metadata !DIExpression()), !dbg !1571
  %91 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, !dbg !1573
  %92 = bitcast %union.anon* %91 to i8*, !dbg !1574
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1575
  call void @llvm.dbg.value(metadata !DIArgList(i64 %79, i64 %14), metadata !123, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1577
  %93 = getelementptr inbounds i8, i8* %92, i64 %79, !dbg !1579
  %94 = getelementptr inbounds i8, i8* %93, i64 -16, !dbg !1580
  %95 = bitcast i8* %94 to i64*, !dbg !1581
  call void @llvm.dbg.value(metadata i64* %95, metadata !465, metadata !DIExpression()), !dbg !1582
  call void @llvm.dbg.value(metadata i64 %79, metadata !415, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1583
  call void @llvm.dbg.value(metadata i1 true, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1583
  call void @llvm.dbg.value(metadata i1 %15, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %79, metadata !423, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %79, metadata !423, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %79, metadata !423, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1583
  call void @llvm.dbg.value(metadata !DIArgList(i64 %79, i64 %14), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1583
  store i64 %90, i64* %95, align 8, !dbg !1585, !tbaa !121
  %96 = load i64, i64* %3, align 8, !dbg !1586, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !171, metadata !DIExpression()), !dbg !1588
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1589
  call void @llvm.dbg.value(metadata i64 %96, metadata !123, metadata !DIExpression()), !dbg !1591
  %97 = and i64 %96, -16, !dbg !1593
  %98 = getelementptr inbounds i8, i8* %2, i64 %97, !dbg !1594
  call void @llvm.dbg.value(metadata i8* %98, metadata !470, metadata !DIExpression()), !dbg !1595
  %99 = bitcast i8* %98 to i64*, !dbg !1596
  %100 = load i64, i64* %99, align 8, !dbg !1596, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1597
  call void @llvm.dbg.value(metadata i64 %100, metadata !213, metadata !DIExpression()), !dbg !1599
  %101 = and i64 %100, 1, !dbg !1601
  %102 = icmp eq i64 %101, 0, !dbg !1602
  call void @llvm.dbg.value(metadata i1 %102, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1595
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1603
  call void @llvm.dbg.value(metadata i64 %100, metadata !123, metadata !DIExpression()), !dbg !1605
  %103 = and i64 %100, -16, !dbg !1607
  call void @llvm.dbg.value(metadata i64 %103, metadata !472, metadata !DIExpression()), !dbg !1595
  call void @llvm.dbg.value(metadata i64 %103, metadata !415, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %103, metadata !415, metadata !DIExpression()), !dbg !1610
  br i1 %102, label %106, label %104, !dbg !1612

104:                                              ; preds = %88
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1610
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1610
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1610
  call void @llvm.dbg.value(metadata i64 %103, metadata !423, metadata !DIExpression()), !dbg !1610
  call void @llvm.dbg.value(metadata i64 %103, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1610
  %105 = or i64 %103, 1, !dbg !1613
  call void @llvm.dbg.value(metadata i64 %105, metadata !423, metadata !DIExpression()), !dbg !1610
  call void @llvm.dbg.value(metadata i64 %105, metadata !423, metadata !DIExpression()), !dbg !1610
  store i64 %105, i64* %99, align 8, !dbg !1614, !tbaa !137
  br label %374, !dbg !1615

106:                                              ; preds = %88
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1608
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1608
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %103, metadata !423, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %103, metadata !423, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %103, metadata !423, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %103, metadata !423, metadata !DIExpression()), !dbg !1608
  store i64 %103, i64* %99, align 8, !dbg !1616, !tbaa !137
  br label %374

107:                                              ; preds = %19
  %108 = select i1 %13, i1 true, i1 %17, !dbg !1617
  br i1 %108, label %212, label %109, !dbg !1617

109:                                              ; preds = %107
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1411, metadata !DIExpression()), !dbg !1618
  br i1 %15, label %113, label %110, !dbg !1619

110:                                              ; preds = %109
  %111 = getelementptr inbounds %struct.block, %struct.block* %0, i64 -1, i32 1, !dbg !1620
  %112 = bitcast %union.anon* %111 to %struct.block*, !dbg !1623
  call void @llvm.dbg.value(metadata %struct.block* %112, metadata !1411, metadata !DIExpression()), !dbg !1618
  br label %123, !dbg !1624

113:                                              ; preds = %109
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !95, metadata !DIExpression()), !dbg !1625
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !103, metadata !DIExpression()), !dbg !1628
  %114 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !1630
  call void @llvm.dbg.value(metadata i64* %114, metadata !100, metadata !DIExpression()), !dbg !1625
  call void @llvm.dbg.value(metadata i64* %114, metadata !112, metadata !DIExpression()), !dbg !1631
  %115 = load i64, i64* %114, align 8, !dbg !1633, !tbaa !121
  call void @llvm.dbg.value(metadata i64 %115, metadata !123, metadata !DIExpression()), !dbg !1634
  %116 = and i64 %115, -16, !dbg !1636
  call void @llvm.dbg.value(metadata i64 %116, metadata !117, metadata !DIExpression()), !dbg !1631
  %117 = icmp eq i64 %116, 0, !dbg !1637
  %118 = bitcast i64* %114 to %struct.block*, !dbg !1638
  %119 = sub i64 0, %116, !dbg !1638
  %120 = getelementptr inbounds i8, i8* %2, i64 %119, !dbg !1638
  %121 = bitcast i8* %120 to %struct.block*, !dbg !1638
  %122 = select i1 %117, %struct.block* %118, %struct.block* %121, !dbg !1638
  call void @llvm.dbg.value(metadata %struct.block* %122, metadata !1411, metadata !DIExpression()), !dbg !1618
  br label %123

123:                                              ; preds = %113, %110
  %124 = phi %struct.block* [ %112, %110 ], [ %122, %113 ], !dbg !1639
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !1411, metadata !DIExpression()), !dbg !1618
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !933, metadata !DIExpression()) #6, !dbg !1640
  %125 = getelementptr %struct.block, %struct.block* %124, i64 0, i32 0, !dbg !1642
  %126 = load i64, i64* %125, align 8, !dbg !1642, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1643
  call void @llvm.dbg.value(metadata i64 %126, metadata !123, metadata !DIExpression()) #6, !dbg !1645
  %127 = and i64 %126, -16, !dbg !1647
  call void @llvm.dbg.value(metadata i64 %127, metadata !938, metadata !DIExpression()) #6, !dbg !1640
  %128 = icmp eq i64 %127, 16, !dbg !1648
  br i1 %128, label %129, label %144, !dbg !1649

129:                                              ; preds = %123, %129
  %130 = phi %struct.block** [ %136, %129 ], [ @mini_list_start, %123 ]
  %131 = phi %struct.block* [ %132, %129 ], [ null, %123 ], !dbg !1650
  %132 = load %struct.block*, %struct.block** %130, align 8, !dbg !1650, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %131, metadata !959, metadata !DIExpression()) #6, !dbg !1650
  call void @llvm.dbg.value(metadata %struct.block* %132, metadata !958, metadata !DIExpression()) #6, !dbg !1650
  %133 = icmp ne %struct.block* %132, null, !dbg !1652
  %134 = icmp ne %struct.block* %132, %124, !dbg !1653
  %135 = and i1 %133, %134, !dbg !1653
  call void @llvm.dbg.value(metadata %struct.block* %132, metadata !959, metadata !DIExpression()) #6, !dbg !1650
  %136 = getelementptr inbounds %struct.block, %struct.block* %132, i64 0, i32 1, i32 0, i32 0, !dbg !1654
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !958, metadata !DIExpression()) #6, !dbg !1650
  br i1 %135, label %129, label %137, !dbg !1655, !llvm.loop !1656

137:                                              ; preds = %129
  %138 = icmp eq %struct.block* %132, null, !dbg !1658
  br i1 %138, label %178, label %139, !dbg !1659

139:                                              ; preds = %137
  %140 = icmp eq %struct.block* %131, null, !dbg !1660
  %141 = load %struct.block*, %struct.block** %136, align 8, !dbg !1661, !tbaa !297
  %142 = getelementptr inbounds %struct.block, %struct.block* %131, i64 0, i32 1, i32 0, i32 0, !dbg !1662
  %143 = select i1 %140, %struct.block** @mini_list_start, %struct.block** %142, !dbg !1662
  store %struct.block* %141, %struct.block** %143, align 8, !dbg !1661, !tbaa !297
  br label %178, !dbg !1663

144:                                              ; preds = %123
  call void @llvm.dbg.value(metadata i64 %127, metadata !658, metadata !DIExpression()) #6, !dbg !1664
  %145 = icmp ult i64 %127, 17, !dbg !1666
  br i1 %145, label %163, label %146, !dbg !1667

146:                                              ; preds = %144
  %147 = icmp ult i64 %127, 33, !dbg !1668
  br i1 %147, label %163, label %148, !dbg !1669

148:                                              ; preds = %146
  %149 = icmp ult i64 %127, 65, !dbg !1670
  br i1 %149, label %163, label %150, !dbg !1671

150:                                              ; preds = %148
  %151 = icmp ult i64 %127, 129, !dbg !1672
  br i1 %151, label %163, label %152, !dbg !1673

152:                                              ; preds = %150
  %153 = icmp ult i64 %127, 257, !dbg !1674
  br i1 %153, label %163, label %154, !dbg !1675

154:                                              ; preds = %152
  %155 = icmp ult i64 %127, 513, !dbg !1676
  br i1 %155, label %163, label %156, !dbg !1677

156:                                              ; preds = %154
  %157 = icmp ult i64 %127, 1025, !dbg !1678
  br i1 %157, label %163, label %158, !dbg !1679

158:                                              ; preds = %156
  %159 = icmp ult i64 %127, 2049, !dbg !1680
  br i1 %159, label %163, label %160, !dbg !1681

160:                                              ; preds = %158
  %161 = icmp ult i64 %127, 4097, !dbg !1682
  %162 = select i1 %161, i64 8, i64 9, !dbg !1683
  br label %163, !dbg !1683

163:                                              ; preds = %160, %158, %156, %154, %152, %150, %148, %146, %144
  %164 = phi i64 [ 0, %144 ], [ 1, %146 ], [ 2, %148 ], [ 3, %150 ], [ 4, %152 ], [ 5, %154 ], [ 6, %156 ], [ 7, %158 ], [ %162, %160 ], !dbg !1684
  call void @llvm.dbg.value(metadata i64 %164, metadata !939, metadata !DIExpression()) #6, !dbg !1685
  %165 = getelementptr inbounds %struct.block, %struct.block* %124, i64 0, i32 1, i32 0, i32 0, !dbg !1686
  %166 = load %struct.block*, %struct.block** %165, align 8, !dbg !1686, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %166, metadata !942, metadata !DIExpression()) #6, !dbg !1685
  %167 = getelementptr inbounds %struct.block, %struct.block* %124, i64 0, i32 1, i32 0, i32 1, !dbg !1687
  %168 = load %struct.block*, %struct.block** %167, align 8, !dbg !1687, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %168, metadata !943, metadata !DIExpression()) #6, !dbg !1685
  %169 = icmp eq %struct.block* %168, null, !dbg !1688
  %170 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %164, !dbg !1689
  %171 = getelementptr inbounds %struct.block, %struct.block* %168, i64 0, i32 1, i32 0, i32 0, !dbg !1689
  %172 = select i1 %169, %struct.block** %170, %struct.block** %171, !dbg !1689
  store %struct.block* %166, %struct.block** %172, align 8, !dbg !1690, !tbaa !297
  %173 = icmp eq %struct.block* %166, null, !dbg !1691
  br i1 %173, label %176, label %174, !dbg !1692

174:                                              ; preds = %163
  %175 = getelementptr inbounds %struct.block, %struct.block* %166, i64 0, i32 1, i32 0, i32 1, !dbg !1693
  store %struct.block* %168, %struct.block** %175, align 8, !dbg !1694, !tbaa !297
  br label %176, !dbg !1695

176:                                              ; preds = %174, %163
  %177 = bitcast %struct.block** %165 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %177, i8 0, i64 16, i1 false) #6, !dbg !1696
  br label %178

178:                                              ; preds = %137, %139, %176
  %179 = load i64, i64* %125, align 8, !dbg !1697, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1698
  call void @llvm.dbg.value(metadata i64 %179, metadata !123, metadata !DIExpression()), !dbg !1700
  %180 = and i64 %179, -16, !dbg !1702
  %181 = load i64, i64* %3, align 8, !dbg !1703, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1704
  call void @llvm.dbg.value(metadata i64 %181, metadata !123, metadata !DIExpression()), !dbg !1706
  %182 = and i64 %181, -16, !dbg !1708
  %183 = add i64 %182, %180, !dbg !1709
  call void @llvm.dbg.value(metadata i64 %183, metadata !1414, metadata !DIExpression()), !dbg !1618
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1438, metadata !DIExpression()), !dbg !1710
  call void @llvm.dbg.value(metadata i64 %179, metadata !1443, metadata !DIExpression()), !dbg !1712
  call void @llvm.dbg.value(metadata i64 %179, metadata !1446, metadata !DIExpression(DW_OP_constu, 2, DW_OP_and, DW_OP_stack_value)), !dbg !1712
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1450, metadata !DIExpression()), !dbg !1714
  call void @llvm.dbg.value(metadata i64 %179, metadata !1455, metadata !DIExpression()), !dbg !1716
  call void @llvm.dbg.value(metadata i64 %179, metadata !1458, metadata !DIExpression(DW_OP_constu, 4, DW_OP_and, DW_OP_stack_value)), !dbg !1716
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !456, metadata !DIExpression()), !dbg !1718
  call void @llvm.dbg.value(metadata i64 %183, metadata !461, metadata !DIExpression()), !dbg !1718
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1718
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1718
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1718
  %184 = icmp eq i64 %183, 16, !dbg !1720
  %185 = and i64 %179, 6, !dbg !1721
  br i1 %184, label %186, label %193, !dbg !1722

186:                                              ; preds = %178
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1718
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1718
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !855, metadata !DIExpression()), !dbg !1723
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()), !dbg !1723
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1723
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1723
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1723
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1725
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1727
  %187 = or i64 %185, 16, !dbg !1729
  store i64 %187, i64* %125, align 8, !dbg !1730
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !171, metadata !DIExpression()), !dbg !1731
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1733
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !1735
  %188 = getelementptr inbounds %struct.block, %struct.block* %124, i64 0, i32 1, i32 0, i32 1, !dbg !1737
  %189 = bitcast %struct.block** %188 to i64*, !dbg !1738
  call void @llvm.dbg.value(metadata i64* %189, metadata !862, metadata !DIExpression()), !dbg !1723
  %190 = load i64, i64* %189, align 8, !dbg !1738, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1739
  call void @llvm.dbg.value(metadata i64 %190, metadata !213, metadata !DIExpression()), !dbg !1741
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1723
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1743
  call void @llvm.dbg.value(metadata i64 %190, metadata !123, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 %190, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1723
  %191 = and i64 %190, -15, !dbg !1747
  %192 = or i64 %191, 4, !dbg !1748
  store i64 %192, i64* %189, align 8, !dbg !1748, !tbaa !137
  br label %374, !dbg !1749

193:                                              ; preds = %178
  call void @llvm.dbg.value(metadata i64 %183, metadata !415, metadata !DIExpression()), !dbg !1750
  call void @llvm.dbg.value(metadata i64 %183, metadata !415, metadata !DIExpression()), !dbg !1752
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1752
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1752
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1752
  call void @llvm.dbg.value(metadata i64 %183, metadata !423, metadata !DIExpression()), !dbg !1752
  call void @llvm.dbg.value(metadata !DIArgList(i64 %179, i64 %183), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1752
  %194 = or i64 %185, %183, !dbg !1754
  call void @llvm.dbg.value(metadata !DIArgList(i64 %179, i64 %179, i64 %183), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 4, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1752
  store i64 %194, i64* %125, align 8, !dbg !1755, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !483, metadata !DIExpression()), !dbg !1756
  %195 = getelementptr inbounds %struct.block, %struct.block* %124, i64 0, i32 1, !dbg !1758
  %196 = bitcast %union.anon* %195 to i8*, !dbg !1759
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1760
  call void @llvm.dbg.value(metadata !DIArgList(i64 %179, i64 %179, i64 %183), metadata !123, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 4, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1762
  %197 = getelementptr inbounds i8, i8* %196, i64 %183, !dbg !1764
  %198 = getelementptr inbounds i8, i8* %197, i64 -16, !dbg !1765
  %199 = bitcast i8* %198 to i64*, !dbg !1766
  call void @llvm.dbg.value(metadata i64* %199, metadata !465, metadata !DIExpression()), !dbg !1767
  call void @llvm.dbg.value(metadata i64 %183, metadata !415, metadata !DIExpression()), !dbg !1768
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1768
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1768
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1768
  call void @llvm.dbg.value(metadata !DIArgList(i64 %179, i64 %179, i64 %183), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 4, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1768
  store i64 %194, i64* %199, align 8, !dbg !1770, !tbaa !121
  %200 = load i64, i64* %125, align 8, !dbg !1771, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !171, metadata !DIExpression()), !dbg !1773
  %201 = bitcast %struct.block* %124 to i8*, !dbg !1774
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1775
  call void @llvm.dbg.value(metadata i64 %200, metadata !123, metadata !DIExpression()), !dbg !1777
  %202 = and i64 %200, -16, !dbg !1779
  %203 = getelementptr inbounds i8, i8* %201, i64 %202, !dbg !1780
  call void @llvm.dbg.value(metadata i8* %203, metadata !470, metadata !DIExpression()), !dbg !1781
  %204 = bitcast i8* %203 to i64*, !dbg !1782
  %205 = load i64, i64* %204, align 8, !dbg !1782, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1783
  call void @llvm.dbg.value(metadata i64 %205, metadata !213, metadata !DIExpression()), !dbg !1785
  %206 = and i64 %205, 1, !dbg !1787
  %207 = icmp eq i64 %206, 0, !dbg !1788
  call void @llvm.dbg.value(metadata i1 %207, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1781
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1789
  call void @llvm.dbg.value(metadata i64 %205, metadata !123, metadata !DIExpression()), !dbg !1791
  %208 = and i64 %205, -16, !dbg !1793
  call void @llvm.dbg.value(metadata i64 %208, metadata !472, metadata !DIExpression()), !dbg !1781
  call void @llvm.dbg.value(metadata i64 %208, metadata !415, metadata !DIExpression()), !dbg !1794
  call void @llvm.dbg.value(metadata i64 %208, metadata !415, metadata !DIExpression()), !dbg !1796
  br i1 %207, label %211, label %209, !dbg !1798

209:                                              ; preds = %193
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1796
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1796
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1796
  call void @llvm.dbg.value(metadata i64 %208, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1796
  %210 = or i64 %208, 1, !dbg !1799
  call void @llvm.dbg.value(metadata i64 %210, metadata !423, metadata !DIExpression()), !dbg !1796
  store i64 %210, i64* %204, align 8, !dbg !1800, !tbaa !137
  br label %374, !dbg !1801

211:                                              ; preds = %193
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1794
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1794
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1794
  call void @llvm.dbg.value(metadata i64 %208, metadata !423, metadata !DIExpression()), !dbg !1794
  store i64 %208, i64* %204, align 8, !dbg !1802, !tbaa !137
  br label %374

212:                                              ; preds = %107
  %213 = select i1 %13, i1 true, i1 %11, !dbg !1803
  br i1 %213, label %374, label %214, !dbg !1803

214:                                              ; preds = %212
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1415, metadata !DIExpression()), !dbg !1804
  br i1 %15, label %218, label %215, !dbg !1805

215:                                              ; preds = %214
  %216 = getelementptr inbounds %struct.block, %struct.block* %0, i64 -1, i32 1, !dbg !1806
  %217 = bitcast %union.anon* %216 to %struct.block*, !dbg !1809
  call void @llvm.dbg.value(metadata %struct.block* %217, metadata !1415, metadata !DIExpression()), !dbg !1804
  br label %228, !dbg !1810

218:                                              ; preds = %214
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !95, metadata !DIExpression()), !dbg !1811
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !103, metadata !DIExpression()), !dbg !1814
  %219 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !1816
  call void @llvm.dbg.value(metadata i64* %219, metadata !100, metadata !DIExpression()), !dbg !1811
  call void @llvm.dbg.value(metadata i64* %219, metadata !112, metadata !DIExpression()), !dbg !1817
  %220 = load i64, i64* %219, align 8, !dbg !1819, !tbaa !121
  call void @llvm.dbg.value(metadata i64 %220, metadata !123, metadata !DIExpression()), !dbg !1820
  %221 = and i64 %220, -16, !dbg !1822
  call void @llvm.dbg.value(metadata i64 %221, metadata !117, metadata !DIExpression()), !dbg !1817
  %222 = icmp eq i64 %221, 0, !dbg !1823
  %223 = bitcast i64* %219 to %struct.block*, !dbg !1824
  %224 = sub i64 0, %221, !dbg !1824
  %225 = getelementptr inbounds i8, i8* %2, i64 %224, !dbg !1824
  %226 = bitcast i8* %225 to %struct.block*, !dbg !1824
  %227 = select i1 %222, %struct.block* %223, %struct.block* %226, !dbg !1824
  call void @llvm.dbg.value(metadata %struct.block* %227, metadata !1415, metadata !DIExpression()), !dbg !1804
  br label %228

228:                                              ; preds = %218, %215
  %229 = phi %struct.block* [ %217, %215 ], [ %227, %218 ], !dbg !1825
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !1415, metadata !DIExpression()), !dbg !1804
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !933, metadata !DIExpression()) #6, !dbg !1826
  %230 = getelementptr %struct.block, %struct.block* %229, i64 0, i32 0, !dbg !1828
  %231 = load i64, i64* %230, align 8, !dbg !1828, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1829
  call void @llvm.dbg.value(metadata i64 %231, metadata !123, metadata !DIExpression()) #6, !dbg !1831
  %232 = and i64 %231, -16, !dbg !1833
  call void @llvm.dbg.value(metadata i64 %232, metadata !938, metadata !DIExpression()) #6, !dbg !1826
  %233 = icmp eq i64 %232, 16, !dbg !1834
  br i1 %233, label %234, label %249, !dbg !1835

234:                                              ; preds = %228, %234
  %235 = phi %struct.block** [ %241, %234 ], [ @mini_list_start, %228 ]
  %236 = phi %struct.block* [ %237, %234 ], [ null, %228 ], !dbg !1836
  %237 = load %struct.block*, %struct.block** %235, align 8, !dbg !1836, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %236, metadata !959, metadata !DIExpression()) #6, !dbg !1836
  call void @llvm.dbg.value(metadata %struct.block* %237, metadata !958, metadata !DIExpression()) #6, !dbg !1836
  %238 = icmp ne %struct.block* %237, null, !dbg !1838
  %239 = icmp ne %struct.block* %237, %229, !dbg !1839
  %240 = and i1 %238, %239, !dbg !1839
  call void @llvm.dbg.value(metadata %struct.block* %237, metadata !959, metadata !DIExpression()) #6, !dbg !1836
  %241 = getelementptr inbounds %struct.block, %struct.block* %237, i64 0, i32 1, i32 0, i32 0, !dbg !1840
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !958, metadata !DIExpression()) #6, !dbg !1836
  br i1 %240, label %234, label %242, !dbg !1841, !llvm.loop !1842

242:                                              ; preds = %234
  %243 = icmp eq %struct.block* %237, null, !dbg !1844
  br i1 %243, label %283, label %244, !dbg !1845

244:                                              ; preds = %242
  %245 = icmp eq %struct.block* %236, null, !dbg !1846
  %246 = load %struct.block*, %struct.block** %241, align 8, !dbg !1847, !tbaa !297
  %247 = getelementptr inbounds %struct.block, %struct.block* %236, i64 0, i32 1, i32 0, i32 0, !dbg !1848
  %248 = select i1 %245, %struct.block** @mini_list_start, %struct.block** %247, !dbg !1848
  store %struct.block* %246, %struct.block** %248, align 8, !dbg !1847, !tbaa !297
  br label %283, !dbg !1849

249:                                              ; preds = %228
  call void @llvm.dbg.value(metadata i64 %232, metadata !658, metadata !DIExpression()) #6, !dbg !1850
  %250 = icmp ult i64 %232, 17, !dbg !1852
  br i1 %250, label %268, label %251, !dbg !1853

251:                                              ; preds = %249
  %252 = icmp ult i64 %232, 33, !dbg !1854
  br i1 %252, label %268, label %253, !dbg !1855

253:                                              ; preds = %251
  %254 = icmp ult i64 %232, 65, !dbg !1856
  br i1 %254, label %268, label %255, !dbg !1857

255:                                              ; preds = %253
  %256 = icmp ult i64 %232, 129, !dbg !1858
  br i1 %256, label %268, label %257, !dbg !1859

257:                                              ; preds = %255
  %258 = icmp ult i64 %232, 257, !dbg !1860
  br i1 %258, label %268, label %259, !dbg !1861

259:                                              ; preds = %257
  %260 = icmp ult i64 %232, 513, !dbg !1862
  br i1 %260, label %268, label %261, !dbg !1863

261:                                              ; preds = %259
  %262 = icmp ult i64 %232, 1025, !dbg !1864
  br i1 %262, label %268, label %263, !dbg !1865

263:                                              ; preds = %261
  %264 = icmp ult i64 %232, 2049, !dbg !1866
  br i1 %264, label %268, label %265, !dbg !1867

265:                                              ; preds = %263
  %266 = icmp ult i64 %232, 4097, !dbg !1868
  %267 = select i1 %266, i64 8, i64 9, !dbg !1869
  br label %268, !dbg !1869

268:                                              ; preds = %265, %263, %261, %259, %257, %255, %253, %251, %249
  %269 = phi i64 [ 0, %249 ], [ 1, %251 ], [ 2, %253 ], [ 3, %255 ], [ 4, %257 ], [ 5, %259 ], [ 6, %261 ], [ 7, %263 ], [ %267, %265 ], !dbg !1870
  call void @llvm.dbg.value(metadata i64 %269, metadata !939, metadata !DIExpression()) #6, !dbg !1871
  %270 = getelementptr inbounds %struct.block, %struct.block* %229, i64 0, i32 1, i32 0, i32 0, !dbg !1872
  %271 = load %struct.block*, %struct.block** %270, align 8, !dbg !1872, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %271, metadata !942, metadata !DIExpression()) #6, !dbg !1871
  %272 = getelementptr inbounds %struct.block, %struct.block* %229, i64 0, i32 1, i32 0, i32 1, !dbg !1873
  %273 = load %struct.block*, %struct.block** %272, align 8, !dbg !1873, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %273, metadata !943, metadata !DIExpression()) #6, !dbg !1871
  %274 = icmp eq %struct.block* %273, null, !dbg !1874
  %275 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %269, !dbg !1875
  %276 = getelementptr inbounds %struct.block, %struct.block* %273, i64 0, i32 1, i32 0, i32 0, !dbg !1875
  %277 = select i1 %274, %struct.block** %275, %struct.block** %276, !dbg !1875
  store %struct.block* %271, %struct.block** %277, align 8, !dbg !1876, !tbaa !297
  %278 = icmp eq %struct.block* %271, null, !dbg !1877
  br i1 %278, label %281, label %279, !dbg !1878

279:                                              ; preds = %268
  %280 = getelementptr inbounds %struct.block, %struct.block* %271, i64 0, i32 1, i32 0, i32 1, !dbg !1879
  store %struct.block* %273, %struct.block** %280, align 8, !dbg !1880, !tbaa !297
  br label %281, !dbg !1881

281:                                              ; preds = %279, %268
  %282 = bitcast %struct.block** %270 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %282, i8 0, i64 16, i1 false) #6, !dbg !1882
  br label %283

283:                                              ; preds = %242, %244, %281
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !933, metadata !DIExpression()) #6, !dbg !1883
  %284 = load i64, i64* %8, align 8, !dbg !1885, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !1886
  call void @llvm.dbg.value(metadata i64 %284, metadata !123, metadata !DIExpression()) #6, !dbg !1888
  %285 = and i64 %284, -16, !dbg !1890
  call void @llvm.dbg.value(metadata i64 %285, metadata !938, metadata !DIExpression()) #6, !dbg !1883
  %286 = icmp eq i64 %285, 16, !dbg !1891
  br i1 %286, label %287, label %302, !dbg !1892

287:                                              ; preds = %283, %287
  %288 = phi %struct.block** [ %294, %287 ], [ @mini_list_start, %283 ]
  %289 = phi %struct.block* [ %290, %287 ], [ null, %283 ], !dbg !1893
  %290 = load %struct.block*, %struct.block** %288, align 8, !dbg !1893, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %289, metadata !959, metadata !DIExpression()) #6, !dbg !1893
  call void @llvm.dbg.value(metadata %struct.block* %290, metadata !958, metadata !DIExpression()) #6, !dbg !1893
  %291 = icmp ne %struct.block* %290, null, !dbg !1895
  %292 = icmp ne %struct.block* %290, %7, !dbg !1896
  %293 = and i1 %291, %292, !dbg !1896
  call void @llvm.dbg.value(metadata %struct.block* %290, metadata !959, metadata !DIExpression()) #6, !dbg !1893
  %294 = getelementptr inbounds %struct.block, %struct.block* %290, i64 0, i32 1, i32 0, i32 0, !dbg !1897
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !958, metadata !DIExpression()) #6, !dbg !1893
  br i1 %293, label %287, label %295, !dbg !1898, !llvm.loop !1899

295:                                              ; preds = %287
  %296 = icmp eq %struct.block* %290, null, !dbg !1901
  br i1 %296, label %337, label %297, !dbg !1902

297:                                              ; preds = %295
  %298 = icmp eq %struct.block* %289, null, !dbg !1903
  %299 = load %struct.block*, %struct.block** %294, align 8, !dbg !1904, !tbaa !297
  %300 = getelementptr inbounds %struct.block, %struct.block* %289, i64 0, i32 1, i32 0, i32 0, !dbg !1905
  %301 = select i1 %298, %struct.block** @mini_list_start, %struct.block** %300, !dbg !1905
  store %struct.block* %299, %struct.block** %301, align 8, !dbg !1904, !tbaa !297
  br label %337, !dbg !1906

302:                                              ; preds = %283
  call void @llvm.dbg.value(metadata i64 %285, metadata !658, metadata !DIExpression()) #6, !dbg !1907
  %303 = icmp ult i64 %285, 17, !dbg !1909
  br i1 %303, label %321, label %304, !dbg !1910

304:                                              ; preds = %302
  %305 = icmp ult i64 %285, 33, !dbg !1911
  br i1 %305, label %321, label %306, !dbg !1912

306:                                              ; preds = %304
  %307 = icmp ult i64 %285, 65, !dbg !1913
  br i1 %307, label %321, label %308, !dbg !1914

308:                                              ; preds = %306
  %309 = icmp ult i64 %285, 129, !dbg !1915
  br i1 %309, label %321, label %310, !dbg !1916

310:                                              ; preds = %308
  %311 = icmp ult i64 %285, 257, !dbg !1917
  br i1 %311, label %321, label %312, !dbg !1918

312:                                              ; preds = %310
  %313 = icmp ult i64 %285, 513, !dbg !1919
  br i1 %313, label %321, label %314, !dbg !1920

314:                                              ; preds = %312
  %315 = icmp ult i64 %285, 1025, !dbg !1921
  br i1 %315, label %321, label %316, !dbg !1922

316:                                              ; preds = %314
  %317 = icmp ult i64 %285, 2049, !dbg !1923
  br i1 %317, label %321, label %318, !dbg !1924

318:                                              ; preds = %316
  %319 = icmp ult i64 %285, 4097, !dbg !1925
  %320 = select i1 %319, i64 8, i64 9, !dbg !1926
  br label %321, !dbg !1926

321:                                              ; preds = %318, %316, %314, %312, %310, %308, %306, %304, %302
  %322 = phi i64 [ 0, %302 ], [ 1, %304 ], [ 2, %306 ], [ 3, %308 ], [ 4, %310 ], [ 5, %312 ], [ 6, %314 ], [ 7, %316 ], [ %320, %318 ], !dbg !1927
  call void @llvm.dbg.value(metadata i64 %322, metadata !939, metadata !DIExpression()) #6, !dbg !1928
  %323 = getelementptr inbounds i8, i8* %6, i64 8, !dbg !1929
  %324 = bitcast i8* %323 to %struct.block**, !dbg !1929
  %325 = load %struct.block*, %struct.block** %324, align 8, !dbg !1929, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %325, metadata !942, metadata !DIExpression()) #6, !dbg !1928
  %326 = getelementptr inbounds i8, i8* %6, i64 16, !dbg !1930
  %327 = bitcast i8* %326 to %struct.block**, !dbg !1930
  %328 = load %struct.block*, %struct.block** %327, align 8, !dbg !1930, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %328, metadata !943, metadata !DIExpression()) #6, !dbg !1928
  %329 = icmp eq %struct.block* %328, null, !dbg !1931
  %330 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %322, !dbg !1932
  %331 = getelementptr inbounds %struct.block, %struct.block* %328, i64 0, i32 1, i32 0, i32 0, !dbg !1932
  %332 = select i1 %329, %struct.block** %330, %struct.block** %331, !dbg !1932
  store %struct.block* %325, %struct.block** %332, align 8, !dbg !1933, !tbaa !297
  %333 = icmp eq %struct.block* %325, null, !dbg !1934
  br i1 %333, label %336, label %334, !dbg !1935

334:                                              ; preds = %321
  %335 = getelementptr inbounds %struct.block, %struct.block* %325, i64 0, i32 1, i32 0, i32 1, !dbg !1936
  store %struct.block* %328, %struct.block** %335, align 8, !dbg !1937, !tbaa !297
  br label %336, !dbg !1938

336:                                              ; preds = %334, %321
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %323, i8 0, i64 16, i1 false) #6, !dbg !1939
  br label %337

337:                                              ; preds = %295, %297, %336
  %338 = load i64, i64* %230, align 8, !dbg !1940, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1941
  call void @llvm.dbg.value(metadata i64 %338, metadata !123, metadata !DIExpression()), !dbg !1943
  %339 = and i64 %338, -16, !dbg !1945
  %340 = load i64, i64* %3, align 8, !dbg !1946, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1947
  call void @llvm.dbg.value(metadata i64 %340, metadata !123, metadata !DIExpression()), !dbg !1949
  %341 = and i64 %340, -16, !dbg !1951
  %342 = add i64 %341, %339, !dbg !1952
  %343 = load i64, i64* %8, align 8, !dbg !1953, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1954
  call void @llvm.dbg.value(metadata i64 %343, metadata !123, metadata !DIExpression()), !dbg !1956
  %344 = and i64 %343, -16, !dbg !1958
  %345 = add i64 %342, %344, !dbg !1959
  call void @llvm.dbg.value(metadata i64 %345, metadata !1418, metadata !DIExpression()), !dbg !1804
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1438, metadata !DIExpression()), !dbg !1960
  call void @llvm.dbg.value(metadata i64 %338, metadata !1443, metadata !DIExpression()), !dbg !1962
  call void @llvm.dbg.value(metadata i64 %338, metadata !1446, metadata !DIExpression(DW_OP_constu, 2, DW_OP_and, DW_OP_stack_value)), !dbg !1962
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1450, metadata !DIExpression()), !dbg !1964
  call void @llvm.dbg.value(metadata i64 %338, metadata !1455, metadata !DIExpression()), !dbg !1966
  call void @llvm.dbg.value(metadata i64 %338, metadata !1458, metadata !DIExpression(DW_OP_constu, 4, DW_OP_and, DW_OP_stack_value)), !dbg !1966
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !456, metadata !DIExpression()), !dbg !1968
  call void @llvm.dbg.value(metadata i64 %345, metadata !461, metadata !DIExpression()), !dbg !1968
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1968
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1968
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1968
  %346 = icmp eq i64 %345, 16, !dbg !1970
  %347 = and i64 %338, 6, !dbg !1971
  br i1 %346, label %348, label %355, !dbg !1972

348:                                              ; preds = %337
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1968
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1968
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !855, metadata !DIExpression()), !dbg !1973
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()), !dbg !1973
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1973
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1973
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1973
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1975
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()), !dbg !1977
  %349 = or i64 %347, 16, !dbg !1979
  store i64 %349, i64* %230, align 8, !dbg !1980
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !171, metadata !DIExpression()), !dbg !1981
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1983
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()), !dbg !1985
  %350 = getelementptr inbounds %struct.block, %struct.block* %229, i64 0, i32 1, i32 0, i32 1, !dbg !1987
  %351 = bitcast %struct.block** %350 to i64*, !dbg !1988
  call void @llvm.dbg.value(metadata i64* %351, metadata !862, metadata !DIExpression()), !dbg !1973
  %352 = load i64, i64* %351, align 8, !dbg !1988, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !1989
  call void @llvm.dbg.value(metadata i64 %352, metadata !213, metadata !DIExpression()), !dbg !1991
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1973
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !1993
  call void @llvm.dbg.value(metadata i64 %352, metadata !123, metadata !DIExpression()), !dbg !1995
  call void @llvm.dbg.value(metadata i64 %352, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1973
  %353 = and i64 %352, -15, !dbg !1997
  %354 = or i64 %353, 4, !dbg !1998
  store i64 %354, i64* %351, align 8, !dbg !1998, !tbaa !137
  br label %374, !dbg !1999

355:                                              ; preds = %337
  call void @llvm.dbg.value(metadata i64 %345, metadata !415, metadata !DIExpression()), !dbg !2000
  call void @llvm.dbg.value(metadata i64 %345, metadata !415, metadata !DIExpression()), !dbg !2002
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2002
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2002
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2002
  call void @llvm.dbg.value(metadata i64 %345, metadata !423, metadata !DIExpression()), !dbg !2002
  call void @llvm.dbg.value(metadata !DIArgList(i64 %338, i64 %345), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !2002
  %356 = or i64 %347, %345, !dbg !2004
  call void @llvm.dbg.value(metadata !DIArgList(i64 %338, i64 %338, i64 %345), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 4, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !2002
  store i64 %356, i64* %230, align 8, !dbg !2005, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !483, metadata !DIExpression()), !dbg !2006
  %357 = getelementptr inbounds %struct.block, %struct.block* %229, i64 0, i32 1, !dbg !2008
  %358 = bitcast %union.anon* %357 to i8*, !dbg !2009
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2010
  call void @llvm.dbg.value(metadata !DIArgList(i64 %338, i64 %338, i64 %345), metadata !123, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 4, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !2012
  %359 = getelementptr inbounds i8, i8* %358, i64 %345, !dbg !2014
  %360 = getelementptr inbounds i8, i8* %359, i64 -16, !dbg !2015
  %361 = bitcast i8* %360 to i64*, !dbg !2016
  call void @llvm.dbg.value(metadata i64* %361, metadata !465, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata i64 %345, metadata !415, metadata !DIExpression()), !dbg !2018
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2018
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2018
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2018
  call void @llvm.dbg.value(metadata !DIArgList(i64 %338, i64 %338, i64 %345), metadata !423, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 4, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_constu, 2, DW_OP_and, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !2018
  store i64 %356, i64* %361, align 8, !dbg !2020, !tbaa !121
  %362 = load i64, i64* %230, align 8, !dbg !2021, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %229, metadata !171, metadata !DIExpression()), !dbg !2023
  %363 = bitcast %struct.block* %229 to i8*, !dbg !2024
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2025
  call void @llvm.dbg.value(metadata i64 %362, metadata !123, metadata !DIExpression()), !dbg !2027
  %364 = and i64 %362, -16, !dbg !2029
  %365 = getelementptr inbounds i8, i8* %363, i64 %364, !dbg !2030
  call void @llvm.dbg.value(metadata i8* %365, metadata !470, metadata !DIExpression()), !dbg !2031
  %366 = bitcast i8* %365 to i64*, !dbg !2032
  %367 = load i64, i64* %366, align 8, !dbg !2032, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !2033
  call void @llvm.dbg.value(metadata i64 %367, metadata !213, metadata !DIExpression()), !dbg !2035
  %368 = and i64 %367, 1, !dbg !2037
  %369 = icmp eq i64 %368, 0, !dbg !2038
  call void @llvm.dbg.value(metadata i1 %369, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2031
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2039
  call void @llvm.dbg.value(metadata i64 %367, metadata !123, metadata !DIExpression()), !dbg !2041
  %370 = and i64 %367, -16, !dbg !2043
  call void @llvm.dbg.value(metadata i64 %370, metadata !472, metadata !DIExpression()), !dbg !2031
  call void @llvm.dbg.value(metadata i64 %370, metadata !415, metadata !DIExpression()), !dbg !2044
  call void @llvm.dbg.value(metadata i64 %370, metadata !415, metadata !DIExpression()), !dbg !2046
  br i1 %369, label %373, label %371, !dbg !2048

371:                                              ; preds = %355
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2046
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2046
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2046
  call void @llvm.dbg.value(metadata i64 %370, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !2046
  %372 = or i64 %370, 1, !dbg !2049
  call void @llvm.dbg.value(metadata i64 %372, metadata !423, metadata !DIExpression()), !dbg !2046
  store i64 %372, i64* %366, align 8, !dbg !2050, !tbaa !137
  br label %374, !dbg !2051

373:                                              ; preds = %355
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2044
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2044
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2044
  call void @llvm.dbg.value(metadata i64 %370, metadata !423, metadata !DIExpression()), !dbg !2044
  store i64 %370, i64* %366, align 8, !dbg !2052, !tbaa !137
  br label %374

374:                                              ; preds = %373, %371, %348, %211, %209, %186, %106, %104, %81, %212, %1
  %375 = phi %struct.block* [ null, %212 ], [ %0, %1 ], [ %0, %81 ], [ %0, %104 ], [ %0, %106 ], [ %124, %186 ], [ %124, %209 ], [ %124, %211 ], [ %229, %348 ], [ %229, %371 ], [ %229, %373 ], !dbg !1419
  call void @llvm.dbg.value(metadata %struct.block* %375, metadata !1402, metadata !DIExpression()), !dbg !1419
  call void @llvm.dbg.value(metadata %struct.block* %375, metadata !1207, metadata !DIExpression()) #6, !dbg !2053
  %376 = getelementptr %struct.block, %struct.block* %375, i64 0, i32 0, !dbg !2055
  %377 = load i64, i64* %376, align 8, !dbg !2055, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2056
  call void @llvm.dbg.value(metadata i64 %377, metadata !123, metadata !DIExpression()) #6, !dbg !2058
  %378 = and i64 %377, -16, !dbg !2060
  call void @llvm.dbg.value(metadata i64 %378, metadata !1208, metadata !DIExpression()) #6, !dbg !2053
  %379 = icmp eq i64 %378, 16, !dbg !2061
  br i1 %379, label %380, label %383, !dbg !2062

380:                                              ; preds = %374
  call void @llvm.dbg.value(metadata %struct.block* %375, metadata !1221, metadata !DIExpression()) #6, !dbg !2063
  %381 = load %struct.block*, %struct.block** @mini_list_start, align 8, !dbg !2065, !tbaa !89
  store %struct.block* %375, %struct.block** @mini_list_start, align 8, !dbg !2066, !tbaa !89
  %382 = getelementptr inbounds %struct.block, %struct.block* %375, i64 0, i32 1, i32 0, i32 0, !dbg !2067
  store %struct.block* %381, %struct.block** %382, align 8, !dbg !2068
  br label %415, !dbg !2069

383:                                              ; preds = %374
  call void @llvm.dbg.value(metadata i64 %378, metadata !658, metadata !DIExpression()) #6, !dbg !2070
  %384 = icmp ult i64 %378, 17, !dbg !2072
  br i1 %384, label %402, label %385, !dbg !2073

385:                                              ; preds = %383
  %386 = icmp ult i64 %378, 33, !dbg !2074
  br i1 %386, label %402, label %387, !dbg !2075

387:                                              ; preds = %385
  %388 = icmp ult i64 %378, 65, !dbg !2076
  br i1 %388, label %402, label %389, !dbg !2077

389:                                              ; preds = %387
  %390 = icmp ult i64 %378, 129, !dbg !2078
  br i1 %390, label %402, label %391, !dbg !2079

391:                                              ; preds = %389
  %392 = icmp ult i64 %378, 257, !dbg !2080
  br i1 %392, label %402, label %393, !dbg !2081

393:                                              ; preds = %391
  %394 = icmp ult i64 %378, 513, !dbg !2082
  br i1 %394, label %402, label %395, !dbg !2083

395:                                              ; preds = %393
  %396 = icmp ult i64 %378, 1025, !dbg !2084
  br i1 %396, label %402, label %397, !dbg !2085

397:                                              ; preds = %395
  %398 = icmp ult i64 %378, 2049, !dbg !2086
  br i1 %398, label %402, label %399, !dbg !2087

399:                                              ; preds = %397
  %400 = icmp ult i64 %378, 4097, !dbg !2088
  %401 = select i1 %400, i64 8, i64 9, !dbg !2089
  br label %402, !dbg !2089

402:                                              ; preds = %399, %397, %395, %393, %391, %389, %387, %385, %383
  %403 = phi i64 [ 0, %383 ], [ 1, %385 ], [ 2, %387 ], [ 3, %389 ], [ 4, %391 ], [ 5, %393 ], [ 6, %395 ], [ 7, %397 ], [ %401, %399 ], !dbg !2090
  call void @llvm.dbg.value(metadata i64 %403, metadata !1209, metadata !DIExpression()) #6, !dbg !2091
  %404 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 %403, !dbg !2092
  %405 = load %struct.block*, %struct.block** %404, align 8, !dbg !2092, !tbaa !89
  %406 = icmp eq %struct.block* %405, null, !dbg !2093
  br i1 %406, label %407, label %410, !dbg !2094

407:                                              ; preds = %402
  store %struct.block* %375, %struct.block** %404, align 8, !dbg !2095, !tbaa !89
  %408 = getelementptr inbounds %struct.block, %struct.block* %375, i64 0, i32 1, i32 0, i32 0, !dbg !2096
  %409 = bitcast %struct.block** %408 to i8*, !dbg !2097
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %409, i8 0, i64 16, i1 false) #6, !dbg !2098
  br label %415, !dbg !2097

410:                                              ; preds = %402
  %411 = getelementptr inbounds %struct.block, %struct.block* %375, i64 0, i32 1, i32 0, i32 0, !dbg !2099
  store %struct.block* %405, %struct.block** %411, align 8, !dbg !2100, !tbaa !297
  %412 = load %struct.block*, %struct.block** %404, align 8, !dbg !2101, !tbaa !89
  %413 = getelementptr inbounds %struct.block, %struct.block* %412, i64 0, i32 1, i32 0, i32 1, !dbg !2102
  store %struct.block* %375, %struct.block** %413, align 8, !dbg !2103, !tbaa !297
  %414 = getelementptr inbounds %struct.block, %struct.block* %375, i64 0, i32 1, i32 0, i32 1, !dbg !2104
  store %struct.block* null, %struct.block** %414, align 8, !dbg !2105, !tbaa !297
  store %struct.block* %375, %struct.block** %404, align 8, !dbg !2106, !tbaa !89
  br label %415

415:                                              ; preds = %380, %407, %410
  ret %struct.block* %375, !dbg !2107
}

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_realloc(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 !dbg !2108 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !2112, metadata !DIExpression()), !dbg !2117
  call void @llvm.dbg.value(metadata i64 %1, metadata !2113, metadata !DIExpression()), !dbg !2117
  call void @llvm.dbg.value(metadata i8* %0, metadata !446, metadata !DIExpression()), !dbg !2118
  %3 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !2120
  %4 = bitcast i8* %3 to %struct.block*, !dbg !2121
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !2114, metadata !DIExpression()), !dbg !2117
  %5 = icmp eq i64 %1, 0, !dbg !2122
  %6 = icmp eq i8* %0, null, !dbg !2117
  br i1 %5, label %7, label %37, !dbg !2124

7:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i8* %0, metadata !1299, metadata !DIExpression()) #6, !dbg !2125
  br i1 %6, label %79, label %8, !dbg !2128

8:                                                ; preds = %7
  call void @llvm.dbg.value(metadata i8* %0, metadata !446, metadata !DIExpression()) #6, !dbg !2129
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !1300, metadata !DIExpression()) #6, !dbg !2125
  %9 = bitcast i8* %3 to i64*, !dbg !2131
  %10 = load i64, i64* %9, align 8, !dbg !2131, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2132
  call void @llvm.dbg.value(metadata i64 %10, metadata !123, metadata !DIExpression()) #6, !dbg !2134
  %11 = and i64 %10, -16, !dbg !2136
  call void @llvm.dbg.value(metadata i64 %11, metadata !1301, metadata !DIExpression()) #6, !dbg !2125
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !456, metadata !DIExpression()) #6, !dbg !2137
  call void @llvm.dbg.value(metadata i64 %11, metadata !461, metadata !DIExpression()) #6, !dbg !2137
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2137
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2137
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2137
  %12 = icmp eq i64 %11, 16, !dbg !2139
  br i1 %12, label %13, label %21, !dbg !2140

13:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2137
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2137
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !855, metadata !DIExpression()) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !2143
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !2145
  %14 = and i64 %10, 6, !dbg !2147
  %15 = or i64 %14, 16, !dbg !2147
  store i64 %15, i64* %9, align 8, !dbg !2148
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !171, metadata !DIExpression()) #6, !dbg !2149
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2151
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()) #6, !dbg !2153
  %16 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !2155
  %17 = bitcast i8* %16 to i64*, !dbg !2156
  call void @llvm.dbg.value(metadata i64* %17, metadata !862, metadata !DIExpression()) #6, !dbg !2141
  %18 = load i64, i64* %17, align 8, !dbg !2156, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !2157
  call void @llvm.dbg.value(metadata i64 %18, metadata !213, metadata !DIExpression()) #6, !dbg !2159
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2141
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2161
  call void @llvm.dbg.value(metadata i64 %18, metadata !123, metadata !DIExpression()) #6, !dbg !2163
  call void @llvm.dbg.value(metadata i64 %18, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !2141
  %19 = and i64 %18, -15, !dbg !2165
  %20 = or i64 %19, 4, !dbg !2166
  store i64 %20, i64* %17, align 8, !dbg !2166, !tbaa !137
  br label %76, !dbg !2167

21:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i64 %11, metadata !415, metadata !DIExpression()) #6, !dbg !2168
  call void @llvm.dbg.value(metadata i64 %11, metadata !415, metadata !DIExpression()) #6, !dbg !2170
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2170
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2170
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2170
  call void @llvm.dbg.value(metadata i64 %11, metadata !423, metadata !DIExpression()) #6, !dbg !2170
  call void @llvm.dbg.value(metadata i64 %11, metadata !423, metadata !DIExpression()) #6, !dbg !2170
  call void @llvm.dbg.value(metadata i64 %10, metadata !423, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)) #6, !dbg !2170
  %22 = and i64 %10, -10, !dbg !2172
  call void @llvm.dbg.value(metadata i64 %22, metadata !423, metadata !DIExpression()) #6, !dbg !2170
  store i64 %22, i64* %9, align 8, !dbg !2173, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !483, metadata !DIExpression()) #6, !dbg !2174
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2176
  call void @llvm.dbg.value(metadata i64 %22, metadata !123, metadata !DIExpression()) #6, !dbg !2178
  %23 = getelementptr inbounds i8, i8* %0, i64 %11, !dbg !2180
  %24 = getelementptr inbounds i8, i8* %23, i64 -16, !dbg !2181
  %25 = bitcast i8* %24 to i64*, !dbg !2182
  call void @llvm.dbg.value(metadata i64* %25, metadata !465, metadata !DIExpression()) #6, !dbg !2183
  call void @llvm.dbg.value(metadata i64 %11, metadata !415, metadata !DIExpression()) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i64 %11, metadata !423, metadata !DIExpression()) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i64 %11, metadata !423, metadata !DIExpression()) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i64 %10, metadata !423, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)) #6, !dbg !2184
  call void @llvm.dbg.value(metadata i64 %22, metadata !423, metadata !DIExpression()) #6, !dbg !2184
  store i64 %22, i64* %25, align 8, !dbg !2186, !tbaa !121
  %26 = load i64, i64* %9, align 8, !dbg !2187, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !171, metadata !DIExpression()) #6, !dbg !2189
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2190
  call void @llvm.dbg.value(metadata i64 %26, metadata !123, metadata !DIExpression()) #6, !dbg !2192
  %27 = and i64 %26, -16, !dbg !2194
  %28 = getelementptr inbounds i8, i8* %3, i64 %27, !dbg !2195
  call void @llvm.dbg.value(metadata i8* %28, metadata !470, metadata !DIExpression()) #6, !dbg !2196
  %29 = bitcast i8* %28 to i64*, !dbg !2197
  %30 = load i64, i64* %29, align 8, !dbg !2197, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !2198
  call void @llvm.dbg.value(metadata i64 %30, metadata !213, metadata !DIExpression()) #6, !dbg !2200
  %31 = and i64 %30, 1, !dbg !2202
  %32 = icmp eq i64 %31, 0, !dbg !2203
  call void @llvm.dbg.value(metadata i1 %32, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2196
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2204
  call void @llvm.dbg.value(metadata i64 %30, metadata !123, metadata !DIExpression()) #6, !dbg !2206
  %33 = and i64 %30, -16, !dbg !2208
  call void @llvm.dbg.value(metadata i64 %33, metadata !472, metadata !DIExpression()) #6, !dbg !2196
  call void @llvm.dbg.value(metadata i64 %33, metadata !415, metadata !DIExpression()) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i64 %33, metadata !415, metadata !DIExpression()) #6, !dbg !2211
  br i1 %32, label %36, label %34, !dbg !2213

34:                                               ; preds = %21
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2211
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2211
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2211
  call void @llvm.dbg.value(metadata i64 %33, metadata !423, metadata !DIExpression()) #6, !dbg !2211
  call void @llvm.dbg.value(metadata i64 %33, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !2211
  %35 = or i64 %33, 1, !dbg !2214
  call void @llvm.dbg.value(metadata i64 %35, metadata !423, metadata !DIExpression()) #6, !dbg !2211
  call void @llvm.dbg.value(metadata i64 %35, metadata !423, metadata !DIExpression()) #6, !dbg !2211
  store i64 %35, i64* %29, align 8, !dbg !2215, !tbaa !137
  br label %76, !dbg !2216

36:                                               ; preds = %21
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i64 %33, metadata !423, metadata !DIExpression()) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i64 %33, metadata !423, metadata !DIExpression()) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i64 %33, metadata !423, metadata !DIExpression()) #6, !dbg !2209
  call void @llvm.dbg.value(metadata i64 %33, metadata !423, metadata !DIExpression()) #6, !dbg !2209
  store i64 %33, i64* %29, align 8, !dbg !2217, !tbaa !137
  br label %76

37:                                               ; preds = %2
  %38 = tail call i8* @mm_malloc(i64 noundef %1), !dbg !2117
  br i1 %6, label %79, label %39, !dbg !2218

39:                                               ; preds = %37
  call void @llvm.dbg.value(metadata i8* %38, metadata !2116, metadata !DIExpression()), !dbg !2117
  %40 = icmp eq i8* %38, null, !dbg !2219
  br i1 %40, label %79, label %41, !dbg !2221

41:                                               ; preds = %39
  %42 = bitcast i8* %3 to i64*, !dbg !2222
  %43 = load i64, i64* %42, align 8, !dbg !2222, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2223, metadata !DIExpression()), !dbg !2227
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2229
  call void @llvm.dbg.value(metadata i64 %43, metadata !123, metadata !DIExpression()), !dbg !2231
  %44 = and i64 %43, -16, !dbg !2233
  call void @llvm.dbg.value(metadata i64 %44, metadata !2226, metadata !DIExpression()), !dbg !2227
  %45 = add i64 %44, -8, !dbg !2234
  call void @llvm.dbg.value(metadata i64 %45, metadata !2115, metadata !DIExpression()), !dbg !2117
  %46 = icmp ugt i64 %45, %1, !dbg !2235
  %47 = select i1 %46, i64 %1, i64 %45, !dbg !2237
  call void @llvm.dbg.value(metadata i64 %47, metadata !2115, metadata !DIExpression()), !dbg !2117
  %48 = tail call i8* @mem_memcpy(i8* noundef nonnull %38, i8* noundef nonnull %0, i64 noundef %47) #6, !dbg !2238
  call void @llvm.dbg.value(metadata i8* %0, metadata !1299, metadata !DIExpression()) #6, !dbg !2239
  call void @llvm.dbg.value(metadata i8* %0, metadata !446, metadata !DIExpression()) #6, !dbg !2241
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !1300, metadata !DIExpression()) #6, !dbg !2239
  %49 = load i64, i64* %42, align 8, !dbg !2243, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2244
  call void @llvm.dbg.value(metadata i64 %49, metadata !123, metadata !DIExpression()) #6, !dbg !2246
  %50 = and i64 %49, -16, !dbg !2248
  call void @llvm.dbg.value(metadata i64 %50, metadata !1301, metadata !DIExpression()) #6, !dbg !2239
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !456, metadata !DIExpression()) #6, !dbg !2249
  call void @llvm.dbg.value(metadata i64 %50, metadata !461, metadata !DIExpression()) #6, !dbg !2249
  call void @llvm.dbg.value(metadata i1 false, metadata !462, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2249
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2249
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2249
  %51 = icmp eq i64 %50, 16, !dbg !2251
  br i1 %51, label %52, label %60, !dbg !2252

52:                                               ; preds = %41
  call void @llvm.dbg.value(metadata i1 undef, metadata !464, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2249
  call void @llvm.dbg.value(metadata i1 undef, metadata !463, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2249
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !855, metadata !DIExpression()) #6, !dbg !2253
  call void @llvm.dbg.value(metadata i64 16, metadata !858, metadata !DIExpression()) #6, !dbg !2253
  call void @llvm.dbg.value(metadata i1 false, metadata !859, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2253
  call void @llvm.dbg.value(metadata i1 undef, metadata !860, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2253
  call void @llvm.dbg.value(metadata i1 undef, metadata !861, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2253
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !2255
  call void @llvm.dbg.value(metadata i64 16, metadata !415, metadata !DIExpression()) #6, !dbg !2257
  %53 = and i64 %49, 6, !dbg !2259
  %54 = or i64 %53, 16, !dbg !2259
  store i64 %54, i64* %42, align 8, !dbg !2260
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !171, metadata !DIExpression()) #6, !dbg !2261
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2263
  call void @llvm.dbg.value(metadata i64 undef, metadata !123, metadata !DIExpression()) #6, !dbg !2265
  %55 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !2267
  %56 = bitcast i8* %55 to i64*, !dbg !2268
  call void @llvm.dbg.value(metadata i64* %56, metadata !862, metadata !DIExpression()) #6, !dbg !2253
  %57 = load i64, i64* %56, align 8, !dbg !2268, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !2269
  call void @llvm.dbg.value(metadata i64 %57, metadata !213, metadata !DIExpression()) #6, !dbg !2271
  call void @llvm.dbg.value(metadata i1 undef, metadata !863, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2253
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2273
  call void @llvm.dbg.value(metadata i64 %57, metadata !123, metadata !DIExpression()) #6, !dbg !2275
  call void @llvm.dbg.value(metadata i64 %57, metadata !864, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)) #6, !dbg !2253
  %58 = and i64 %57, -15, !dbg !2277
  %59 = or i64 %58, 4, !dbg !2278
  store i64 %59, i64* %56, align 8, !dbg !2278, !tbaa !137
  br label %76, !dbg !2279

60:                                               ; preds = %41
  call void @llvm.dbg.value(metadata i64 %50, metadata !415, metadata !DIExpression()) #6, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %50, metadata !415, metadata !DIExpression()) #6, !dbg !2282
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2282
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2282
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2282
  call void @llvm.dbg.value(metadata i64 %49, metadata !423, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)) #6, !dbg !2282
  %61 = and i64 %49, -10, !dbg !2284
  call void @llvm.dbg.value(metadata i64 %61, metadata !423, metadata !DIExpression()) #6, !dbg !2282
  store i64 %61, i64* %42, align 8, !dbg !2285, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !483, metadata !DIExpression()) #6, !dbg !2286
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2288
  call void @llvm.dbg.value(metadata i64 %61, metadata !123, metadata !DIExpression()) #6, !dbg !2290
  %62 = getelementptr inbounds i8, i8* %0, i64 %50, !dbg !2292
  %63 = getelementptr inbounds i8, i8* %62, i64 -16, !dbg !2293
  %64 = bitcast i8* %63 to i64*, !dbg !2294
  call void @llvm.dbg.value(metadata i64* %64, metadata !465, metadata !DIExpression()) #6, !dbg !2295
  call void @llvm.dbg.value(metadata i64 %50, metadata !415, metadata !DIExpression()) #6, !dbg !2296
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2296
  call void @llvm.dbg.value(metadata i1 undef, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2296
  call void @llvm.dbg.value(metadata i1 undef, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2296
  call void @llvm.dbg.value(metadata i64 %61, metadata !423, metadata !DIExpression()) #6, !dbg !2296
  store i64 %61, i64* %64, align 8, !dbg !2298, !tbaa !121
  %65 = load i64, i64* %42, align 8, !dbg !2299, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !171, metadata !DIExpression()) #6, !dbg !2301
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2302
  call void @llvm.dbg.value(metadata i64 %65, metadata !123, metadata !DIExpression()) #6, !dbg !2304
  %66 = and i64 %65, -16, !dbg !2306
  %67 = getelementptr inbounds i8, i8* %3, i64 %66, !dbg !2307
  call void @llvm.dbg.value(metadata i8* %67, metadata !470, metadata !DIExpression()) #6, !dbg !2308
  %68 = bitcast i8* %67 to i64*, !dbg !2309
  %69 = load i64, i64* %68, align 8, !dbg !2309, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()) #6, !dbg !2310
  call void @llvm.dbg.value(metadata i64 %69, metadata !213, metadata !DIExpression()) #6, !dbg !2312
  %70 = and i64 %69, 1, !dbg !2314
  %71 = icmp eq i64 %70, 0, !dbg !2315
  call void @llvm.dbg.value(metadata i1 %71, metadata !471, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2308
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()) #6, !dbg !2316
  call void @llvm.dbg.value(metadata i64 %69, metadata !123, metadata !DIExpression()) #6, !dbg !2318
  %72 = and i64 %69, -16, !dbg !2320
  call void @llvm.dbg.value(metadata i64 %72, metadata !472, metadata !DIExpression()) #6, !dbg !2308
  call void @llvm.dbg.value(metadata i64 %72, metadata !415, metadata !DIExpression()) #6, !dbg !2321
  call void @llvm.dbg.value(metadata i64 %72, metadata !415, metadata !DIExpression()) #6, !dbg !2323
  br i1 %71, label %75, label %73, !dbg !2325

73:                                               ; preds = %60
  call void @llvm.dbg.value(metadata i1 true, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2323
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2323
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2323
  call void @llvm.dbg.value(metadata i64 %72, metadata !423, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !2323
  %74 = or i64 %72, 1, !dbg !2326
  call void @llvm.dbg.value(metadata i64 %74, metadata !423, metadata !DIExpression()) #6, !dbg !2323
  store i64 %74, i64* %68, align 8, !dbg !2327, !tbaa !137
  br label %76, !dbg !2328

75:                                               ; preds = %60
  call void @llvm.dbg.value(metadata i1 false, metadata !420, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2321
  call void @llvm.dbg.value(metadata i1 false, metadata !421, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2321
  call void @llvm.dbg.value(metadata i1 false, metadata !422, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2321
  call void @llvm.dbg.value(metadata i64 %72, metadata !423, metadata !DIExpression()) #6, !dbg !2321
  store i64 %72, i64* %68, align 8, !dbg !2329, !tbaa !137
  br label %76

76:                                               ; preds = %75, %73, %52, %13, %34, %36
  %77 = phi i8* [ null, %36 ], [ null, %34 ], [ null, %13 ], [ %38, %52 ], [ %38, %73 ], [ %38, %75 ]
  %78 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %4) #6, !dbg !2117
  br label %79, !dbg !2330

79:                                               ; preds = %76, %37, %7, %39
  %80 = phi i8* [ null, %39 ], [ null, %7 ], [ %38, %37 ], [ %77, %76 ], !dbg !2117
  ret i8* %80, !dbg !2330
}

declare !dbg !2331 i8* @mem_memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_calloc(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 !dbg !2336 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2340, metadata !DIExpression()), !dbg !2344
  call void @llvm.dbg.value(metadata i64 %1, metadata !2341, metadata !DIExpression()), !dbg !2344
  %3 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %0, i64 %1), !dbg !2345
  %4 = extractvalue { i64, i1 } %3, 0, !dbg !2345
  call void @llvm.dbg.value(metadata i64 %4, metadata !2343, metadata !DIExpression()), !dbg !2344
  %5 = icmp eq i64 %0, 0, !dbg !2346
  br i1 %5, label %13, label %6, !dbg !2348

6:                                                ; preds = %2
  %7 = extractvalue { i64, i1 } %3, 1, !dbg !2345
  br i1 %7, label %13, label %8, !dbg !2349

8:                                                ; preds = %6
  %9 = tail call i8* @mm_malloc(i64 noundef %4), !dbg !2350
  call void @llvm.dbg.value(metadata i8* %9, metadata !2342, metadata !DIExpression()), !dbg !2344
  %10 = icmp eq i8* %9, null, !dbg !2351
  br i1 %10, label %13, label %11, !dbg !2353

11:                                               ; preds = %8
  %12 = tail call i8* @mem_memset(i8* noundef nonnull %9, i32 noundef 0, i64 noundef %4) #6, !dbg !2354
  br label %13, !dbg !2355

13:                                               ; preds = %8, %6, %2, %11
  %14 = phi i8* [ %9, %11 ], [ null, %2 ], [ null, %6 ], [ null, %8 ], !dbg !2344
  ret i8* %14, !dbg !2356
}

declare !dbg !2357 i8* @mem_memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

declare !dbg !2360 i8* @mem_heap_lo() local_unnamed_addr #1

declare !dbg !2363 i8* @mem_heap_hi() local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define internal fastcc zeroext i1 @list_match_heap() unnamed_addr #3 !dbg !2364 {
  call void @llvm.dbg.value(metadata i64 0, metadata !2366, metadata !DIExpression()), !dbg !2382
  %1 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !2383, !tbaa !89
  %2 = icmp eq %struct.block* %1, null, !dbg !2384
  br i1 %2, label %23, label %3, !dbg !2385

3:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i64 0, metadata !2366, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* %1, metadata !2367, metadata !DIExpression()), !dbg !2386
  %4 = getelementptr %struct.block, %struct.block* %1, i64 0, i32 0, !dbg !2387
  %5 = load i64, i64* %4, align 8, !dbg !2387, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2388
  call void @llvm.dbg.value(metadata i64 %5, metadata !123, metadata !DIExpression()), !dbg !2390
  %6 = and i64 %5, -16, !dbg !2392
  %7 = icmp eq i64 %6, 0, !dbg !2393
  br i1 %7, label %23, label %8, !dbg !2394

8:                                                ; preds = %3, %8
  %9 = phi i64 [ %21, %8 ], [ %6, %3 ]
  %10 = phi i64 [ %20, %8 ], [ %5, %3 ]
  %11 = phi i64 [ %15, %8 ], [ 0, %3 ]
  %12 = phi %struct.block* [ %18, %8 ], [ %1, %3 ]
  call void @llvm.dbg.value(metadata i64 %11, metadata !2366, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* %12, metadata !2367, metadata !DIExpression()), !dbg !2386
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !206, metadata !DIExpression()), !dbg !2395
  call void @llvm.dbg.value(metadata i64 %10, metadata !213, metadata !DIExpression()), !dbg !2397
  %13 = and i64 %10, 1, !dbg !2399
  call void @llvm.dbg.value(metadata i1 undef, metadata !2371, metadata !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2400
  %14 = xor i64 %13, 1, !dbg !2401
  %15 = add i64 %14, %11, !dbg !2401
  call void @llvm.dbg.value(metadata i64 %15, metadata !2366, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* %12, metadata !171, metadata !DIExpression()), !dbg !2402
  %16 = bitcast %struct.block* %12 to i8*, !dbg !2404
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2405
  call void @llvm.dbg.value(metadata i64 %10, metadata !123, metadata !DIExpression()), !dbg !2407
  %17 = getelementptr inbounds i8, i8* %16, i64 %9, !dbg !2409
  %18 = bitcast i8* %17 to %struct.block*, !dbg !2410
  call void @llvm.dbg.value(metadata %struct.block* %18, metadata !2367, metadata !DIExpression()), !dbg !2386
  %19 = bitcast i8* %17 to i64*, !dbg !2387
  %20 = load i64, i64* %19, align 8, !dbg !2387, !tbaa !137
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !145, metadata !DIExpression()), !dbg !2388
  call void @llvm.dbg.value(metadata i64 %20, metadata !123, metadata !DIExpression()), !dbg !2390
  %21 = and i64 %20, -16, !dbg !2392
  %22 = icmp eq i64 %21, 0, !dbg !2393
  br i1 %22, label %23, label %8, !dbg !2394, !llvm.loop !2411

23:                                               ; preds = %8, %3, %0
  %24 = phi i64 [ 0, %0 ], [ 0, %3 ], [ %15, %8 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 %24, metadata !2366, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata i64 0, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 0, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %25 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 0), align 16, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !2380, metadata !DIExpression()), !dbg !2415
  %26 = icmp eq %struct.block* %25, null, !dbg !2416
  br i1 %26, label %27, label %129, !dbg !2418

27:                                               ; preds = %129, %23
  %28 = phi i64 [ 0, %23 ], [ %132, %129 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 1, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %28, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %29 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 1), align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %29, metadata !2380, metadata !DIExpression()), !dbg !2415
  %30 = icmp eq %struct.block* %29, null, !dbg !2416
  br i1 %30, label %38, label %31, !dbg !2418

31:                                               ; preds = %27, %31
  %32 = phi %struct.block* [ %36, %31 ], [ %29, %27 ]
  %33 = phi i64 [ %34, %31 ], [ %28, %27 ]
  call void @llvm.dbg.value(metadata i64 %33, metadata !2374, metadata !DIExpression()), !dbg !2382
  %34 = add i64 %33, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %34, metadata !2374, metadata !DIExpression()), !dbg !2382
  %35 = getelementptr inbounds %struct.block, %struct.block* %32, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %36 = load %struct.block*, %struct.block** %35, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %36, metadata !2380, metadata !DIExpression()), !dbg !2415
  %37 = icmp eq %struct.block* %36, null, !dbg !2416
  br i1 %37, label %38, label %31, !dbg !2418, !llvm.loop !2422

38:                                               ; preds = %31, %27
  %39 = phi i64 [ %28, %27 ], [ %34, %31 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 2, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %39, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %40 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 2), align 16, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %40, metadata !2380, metadata !DIExpression()), !dbg !2415
  %41 = icmp eq %struct.block* %40, null, !dbg !2416
  br i1 %41, label %49, label %42, !dbg !2418

42:                                               ; preds = %38, %42
  %43 = phi %struct.block* [ %47, %42 ], [ %40, %38 ]
  %44 = phi i64 [ %45, %42 ], [ %39, %38 ]
  call void @llvm.dbg.value(metadata i64 %44, metadata !2374, metadata !DIExpression()), !dbg !2382
  %45 = add i64 %44, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %45, metadata !2374, metadata !DIExpression()), !dbg !2382
  %46 = getelementptr inbounds %struct.block, %struct.block* %43, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %47 = load %struct.block*, %struct.block** %46, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %47, metadata !2380, metadata !DIExpression()), !dbg !2415
  %48 = icmp eq %struct.block* %47, null, !dbg !2416
  br i1 %48, label %49, label %42, !dbg !2418, !llvm.loop !2422

49:                                               ; preds = %42, %38
  %50 = phi i64 [ %39, %38 ], [ %45, %42 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 3, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %50, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %51 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 3), align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %51, metadata !2380, metadata !DIExpression()), !dbg !2415
  %52 = icmp eq %struct.block* %51, null, !dbg !2416
  br i1 %52, label %60, label %53, !dbg !2418

53:                                               ; preds = %49, %53
  %54 = phi %struct.block* [ %58, %53 ], [ %51, %49 ]
  %55 = phi i64 [ %56, %53 ], [ %50, %49 ]
  call void @llvm.dbg.value(metadata i64 %55, metadata !2374, metadata !DIExpression()), !dbg !2382
  %56 = add i64 %55, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %56, metadata !2374, metadata !DIExpression()), !dbg !2382
  %57 = getelementptr inbounds %struct.block, %struct.block* %54, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %58 = load %struct.block*, %struct.block** %57, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !2380, metadata !DIExpression()), !dbg !2415
  %59 = icmp eq %struct.block* %58, null, !dbg !2416
  br i1 %59, label %60, label %53, !dbg !2418, !llvm.loop !2422

60:                                               ; preds = %53, %49
  %61 = phi i64 [ %50, %49 ], [ %56, %53 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 4, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %61, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %62 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 4), align 16, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %62, metadata !2380, metadata !DIExpression()), !dbg !2415
  %63 = icmp eq %struct.block* %62, null, !dbg !2416
  br i1 %63, label %71, label %64, !dbg !2418

64:                                               ; preds = %60, %64
  %65 = phi %struct.block* [ %69, %64 ], [ %62, %60 ]
  %66 = phi i64 [ %67, %64 ], [ %61, %60 ]
  call void @llvm.dbg.value(metadata i64 %66, metadata !2374, metadata !DIExpression()), !dbg !2382
  %67 = add i64 %66, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %67, metadata !2374, metadata !DIExpression()), !dbg !2382
  %68 = getelementptr inbounds %struct.block, %struct.block* %65, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %69 = load %struct.block*, %struct.block** %68, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %69, metadata !2380, metadata !DIExpression()), !dbg !2415
  %70 = icmp eq %struct.block* %69, null, !dbg !2416
  br i1 %70, label %71, label %64, !dbg !2418, !llvm.loop !2422

71:                                               ; preds = %64, %60
  %72 = phi i64 [ %61, %60 ], [ %67, %64 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 5, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %72, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %73 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 5), align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !2380, metadata !DIExpression()), !dbg !2415
  %74 = icmp eq %struct.block* %73, null, !dbg !2416
  br i1 %74, label %82, label %75, !dbg !2418

75:                                               ; preds = %71, %75
  %76 = phi %struct.block* [ %80, %75 ], [ %73, %71 ]
  %77 = phi i64 [ %78, %75 ], [ %72, %71 ]
  call void @llvm.dbg.value(metadata i64 %77, metadata !2374, metadata !DIExpression()), !dbg !2382
  %78 = add i64 %77, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %78, metadata !2374, metadata !DIExpression()), !dbg !2382
  %79 = getelementptr inbounds %struct.block, %struct.block* %76, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %80 = load %struct.block*, %struct.block** %79, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %80, metadata !2380, metadata !DIExpression()), !dbg !2415
  %81 = icmp eq %struct.block* %80, null, !dbg !2416
  br i1 %81, label %82, label %75, !dbg !2418, !llvm.loop !2422

82:                                               ; preds = %75, %71
  %83 = phi i64 [ %72, %71 ], [ %78, %75 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 6, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %83, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %84 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 6), align 16, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %84, metadata !2380, metadata !DIExpression()), !dbg !2415
  %85 = icmp eq %struct.block* %84, null, !dbg !2416
  br i1 %85, label %93, label %86, !dbg !2418

86:                                               ; preds = %82, %86
  %87 = phi %struct.block* [ %91, %86 ], [ %84, %82 ]
  %88 = phi i64 [ %89, %86 ], [ %83, %82 ]
  call void @llvm.dbg.value(metadata i64 %88, metadata !2374, metadata !DIExpression()), !dbg !2382
  %89 = add i64 %88, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %89, metadata !2374, metadata !DIExpression()), !dbg !2382
  %90 = getelementptr inbounds %struct.block, %struct.block* %87, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %91 = load %struct.block*, %struct.block** %90, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %91, metadata !2380, metadata !DIExpression()), !dbg !2415
  %92 = icmp eq %struct.block* %91, null, !dbg !2416
  br i1 %92, label %93, label %86, !dbg !2418, !llvm.loop !2422

93:                                               ; preds = %86, %82
  %94 = phi i64 [ %83, %82 ], [ %89, %86 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 7, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %94, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %95 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 7), align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !2380, metadata !DIExpression()), !dbg !2415
  %96 = icmp eq %struct.block* %95, null, !dbg !2416
  br i1 %96, label %104, label %97, !dbg !2418

97:                                               ; preds = %93, %97
  %98 = phi %struct.block* [ %102, %97 ], [ %95, %93 ]
  %99 = phi i64 [ %100, %97 ], [ %94, %93 ]
  call void @llvm.dbg.value(metadata i64 %99, metadata !2374, metadata !DIExpression()), !dbg !2382
  %100 = add i64 %99, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %100, metadata !2374, metadata !DIExpression()), !dbg !2382
  %101 = getelementptr inbounds %struct.block, %struct.block* %98, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %102 = load %struct.block*, %struct.block** %101, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %102, metadata !2380, metadata !DIExpression()), !dbg !2415
  %103 = icmp eq %struct.block* %102, null, !dbg !2416
  br i1 %103, label %104, label %97, !dbg !2418, !llvm.loop !2422

104:                                              ; preds = %97, %93
  %105 = phi i64 [ %94, %93 ], [ %100, %97 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 8, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %105, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %106 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 8), align 16, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %106, metadata !2380, metadata !DIExpression()), !dbg !2415
  %107 = icmp eq %struct.block* %106, null, !dbg !2416
  br i1 %107, label %115, label %108, !dbg !2418

108:                                              ; preds = %104, %108
  %109 = phi %struct.block* [ %113, %108 ], [ %106, %104 ]
  %110 = phi i64 [ %111, %108 ], [ %105, %104 ]
  call void @llvm.dbg.value(metadata i64 %110, metadata !2374, metadata !DIExpression()), !dbg !2382
  %111 = add i64 %110, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %111, metadata !2374, metadata !DIExpression()), !dbg !2382
  %112 = getelementptr inbounds %struct.block, %struct.block* %109, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %113 = load %struct.block*, %struct.block** %112, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %113, metadata !2380, metadata !DIExpression()), !dbg !2415
  %114 = icmp eq %struct.block* %113, null, !dbg !2416
  br i1 %114, label %115, label %108, !dbg !2418, !llvm.loop !2422

115:                                              ; preds = %108, %104
  %116 = phi i64 [ %105, %104 ], [ %111, %108 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 9, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %116, metadata !2374, metadata !DIExpression()), !dbg !2382
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2377, metadata !DIExpression()), !dbg !2414
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %117 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @segment_list, i64 0, i64 9), align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %117, metadata !2380, metadata !DIExpression()), !dbg !2415
  %118 = icmp eq %struct.block* %117, null, !dbg !2416
  br i1 %118, label %126, label %119, !dbg !2418

119:                                              ; preds = %115, %119
  %120 = phi %struct.block* [ %124, %119 ], [ %117, %115 ]
  %121 = phi i64 [ %122, %119 ], [ %116, %115 ]
  call void @llvm.dbg.value(metadata i64 %121, metadata !2374, metadata !DIExpression()), !dbg !2382
  %122 = add i64 %121, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %122, metadata !2374, metadata !DIExpression()), !dbg !2382
  %123 = getelementptr inbounds %struct.block, %struct.block* %120, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %124 = load %struct.block*, %struct.block** %123, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %124, metadata !2380, metadata !DIExpression()), !dbg !2415
  %125 = icmp eq %struct.block* %124, null, !dbg !2416
  br i1 %125, label %126, label %119, !dbg !2418, !llvm.loop !2422

126:                                              ; preds = %119, %115
  %127 = phi i64 [ %116, %115 ], [ %122, %119 ], !dbg !2382
  call void @llvm.dbg.value(metadata i64 10, metadata !2375, metadata !DIExpression()), !dbg !2413
  call void @llvm.dbg.value(metadata i64 %127, metadata !2374, metadata !DIExpression()), !dbg !2382
  %128 = icmp eq i64 %24, %127, !dbg !2424
  ret i1 %128, !dbg !2425

129:                                              ; preds = %23, %129
  %130 = phi %struct.block* [ %134, %129 ], [ %25, %23 ]
  %131 = phi i64 [ %132, %129 ], [ 0, %23 ]
  call void @llvm.dbg.value(metadata i64 %131, metadata !2374, metadata !DIExpression()), !dbg !2382
  %132 = add i64 %131, 1, !dbg !2419
  call void @llvm.dbg.value(metadata i64 %132, metadata !2374, metadata !DIExpression()), !dbg !2382
  %133 = getelementptr inbounds %struct.block, %struct.block* %130, i64 0, i32 1, i32 0, i32 0, !dbg !2421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2380, metadata !DIExpression()), !dbg !2415
  %134 = load %struct.block*, %struct.block** %133, align 8, !dbg !2415, !tbaa !297
  call void @llvm.dbg.value(metadata %struct.block* %134, metadata !2380, metadata !DIExpression()), !dbg !2415
  %135 = icmp eq %struct.block* %134, null, !dbg !2416
  br i1 %135, label %27, label %129, !dbg !2418, !llvm.loop !2422
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!66, !67, !68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "segment_list", scope: !2, file: !3, line: 150, type: !63, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !38, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "mm.c", directory: "/afs/andrew.cmu.edu/usr16/gdeherme/private/15213/labs/malloclab-f23-gonzoherme", checksumkind: CSK_MD5, checksum: "41574015bbf386764999e3311d5fe3dd")
!4 = !{!5, !12, !13, !32, !33, !35, !36}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "word_t", file: !3, line: 86, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 45, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!11 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "block_t", file: !3, line: 125, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "block", file: !3, line: 114, size: 192, elements: !16)
!16 = !{!17, !18}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !15, file: !3, line: 115, baseType: !6, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, scope: !15, file: !3, line: 116, baseType: !19, size: 128, offset: 64)
!19 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !15, file: !3, line: 116, size: 128, elements: !20)
!20 = !{!21, !27}
!21 = !DIDerivedType(tag: DW_TAG_member, scope: !19, file: !3, line: 118, baseType: !22, size: 128)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !19, file: !3, line: 118, size: 128, elements: !23)
!23 = !{!24, !26}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "next_free", scope: !22, file: !3, line: 119, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "prev_free", scope: !22, file: !3, line: 120, baseType: !25, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !19, file: !3, line: 123, baseType: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 0)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !34, line: 90, baseType: !11)
!34 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!35 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !34, line: 87, baseType: !37)
!37 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!38 = !{!39, !44, !46, !0, !48, !51, !53, !55, !57, !59, !61}
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!40 = distinct !DIGlobalVariable(name: "wsize", scope: !2, file: !3, line: 89, type: !41, isLocal: true, isDefinition: true)
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !11)
!43 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!45 = distinct !DIGlobalVariable(name: "chunksize", scope: !2, file: !3, line: 101, type: !41, isLocal: true, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!47 = distinct !DIGlobalVariable(name: "dsize", scope: !2, file: !3, line: 92, type: !41, isLocal: true, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_stack_value))
!49 = distinct !DIGlobalVariable(name: "size_mask", scope: !2, file: !3, line: 109, type: !50, isLocal: true, isDefinition: true)
!50 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!52 = distinct !DIGlobalVariable(name: "min_block_size", scope: !2, file: !3, line: 96, type: !41, isLocal: true, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!54 = distinct !DIGlobalVariable(name: "alloc_mask", scope: !2, file: !3, line: 103, type: !50, isLocal: true, isDefinition: true)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(name: "mini_list_start", scope: !2, file: !3, line: 153, type: !13, isLocal: true, isDefinition: true)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!58 = distinct !DIGlobalVariable(name: "prev_alloc_mask", scope: !2, file: !3, line: 105, type: !50, isLocal: true, isDefinition: true)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression(DW_OP_constu, 4, DW_OP_stack_value))
!60 = distinct !DIGlobalVariable(name: "prev_mini_mask", scope: !2, file: !3, line: 107, type: !50, isLocal: true, isDefinition: true)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "heap_start", scope: !2, file: !3, line: 146, type: !13, isLocal: true, isDefinition: true)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 640, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 10)
!66 = !{i32 7, !"Dwarf Version", i32 5}
!67 = !{i32 2, !"Debug Info Version", i32 3}
!68 = !{i32 1, !"wchar_size", i32 4}
!69 = !{i32 7, !"PIC Level", i32 2}
!70 = !{i32 7, !"PIE Level", i32 2}
!71 = !{i32 7, !"uwtable", i32 1}
!72 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!73 = distinct !DISubprogram(name: "mm_checkheap", scope: !3, file: !3, line: 1287, type: !74, scopeLine: 1287, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !77)
!74 = !DISubroutineType(types: !75)
!75 = !{!35, !76}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !{!78}
!78 = !DILocalVariable(name: "line", arg: 1, scope: !73, file: !3, line: 1287, type: !76)
!79 = !DILocation(line: 0, scope: !73)
!80 = !DILocation(line: 1041, column: 7, scope: !81, inlinedAt: !87)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 1041, column: 7)
!82 = distinct !DISubprogram(name: "valid_prologue", scope: !3, file: !3, line: 1039, type: !83, scopeLine: 1039, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !85)
!83 = !DISubroutineType(types: !84)
!84 = !{!35}
!85 = !{!86}
!86 = !DILocalVariable(name: "prologue", scope: !82, file: !3, line: 1045, type: !13)
!87 = distinct !DILocation(line: 1295, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1295, column: 7)
!89 = !{!90, !90, i64 0}
!90 = !{!"any pointer", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = !DILocation(line: 1041, column: 18, scope: !81, inlinedAt: !87)
!94 = !DILocation(line: 1041, column: 7, scope: !82, inlinedAt: !87)
!95 = !DILocalVariable(name: "block", arg: 1, scope: !96, file: !3, line: 440, type: !13)
!96 = distinct !DISubprogram(name: "find_prev", scope: !3, file: !3, line: 440, type: !97, scopeLine: 440, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !99)
!97 = !DISubroutineType(types: !98)
!98 = !{!13, !13}
!99 = !{!95, !100}
!100 = !DILocalVariable(name: "footerp", scope: !96, file: !3, line: 444, type: !5)
!101 = !DILocation(line: 0, scope: !96, inlinedAt: !102)
!102 = distinct !DILocation(line: 1045, column: 23, scope: !82, inlinedAt: !87)
!103 = !DILocalVariable(name: "block", arg: 1, scope: !104, file: !3, line: 422, type: !13)
!104 = distinct !DISubprogram(name: "find_prev_footer", scope: !3, file: !3, line: 422, type: !105, scopeLine: 422, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !107)
!105 = !DISubroutineType(types: !106)
!106 = !{!5, !13}
!107 = !{!103}
!108 = !DILocation(line: 0, scope: !104, inlinedAt: !109)
!109 = distinct !DILocation(line: 444, column: 23, scope: !96, inlinedAt: !102)
!110 = !DILocation(line: 424, column: 21, scope: !104, inlinedAt: !109)
!111 = !DILocation(line: 424, column: 29, scope: !104, inlinedAt: !109)
!112 = !DILocalVariable(name: "footer", arg: 1, scope: !113, file: !3, line: 295, type: !5)
!113 = distinct !DISubprogram(name: "footer_to_header", scope: !3, file: !3, line: 295, type: !114, scopeLine: 295, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !116)
!114 = !DISubroutineType(types: !115)
!115 = !{!13, !5}
!116 = !{!112, !117}
!117 = !DILocalVariable(name: "size", scope: !113, file: !3, line: 296, type: !42)
!118 = !DILocation(line: 0, scope: !113, inlinedAt: !119)
!119 = distinct !DILocation(line: 445, column: 12, scope: !96, inlinedAt: !102)
!120 = !DILocation(line: 296, column: 32, scope: !113, inlinedAt: !119)
!121 = !{!122, !122, i64 0}
!122 = !{!"long", !91, i64 0}
!123 = !DILocalVariable(name: "word", arg: 1, scope: !124, file: !3, line: 235, type: !6)
!124 = distinct !DISubprogram(name: "extract_size", scope: !3, file: !3, line: 235, type: !125, scopeLine: 235, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !127)
!125 = !DISubroutineType(types: !126)
!126 = !{!42, !6}
!127 = !{!123}
!128 = !DILocation(line: 0, scope: !124, inlinedAt: !129)
!129 = distinct !DILocation(line: 296, column: 19, scope: !113, inlinedAt: !119)
!130 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !129)
!131 = !DILocation(line: 297, column: 14, scope: !132, inlinedAt: !119)
!132 = distinct !DILexicalBlock(scope: !113, file: !3, line: 297, column: 9)
!133 = !DILocation(line: 297, column: 9, scope: !113, inlinedAt: !119)
!134 = !DILocation(line: 0, scope: !82, inlinedAt: !87)
!135 = !DILocation(line: 1046, column: 7, scope: !136, inlinedAt: !87)
!136 = distinct !DILexicalBlock(scope: !82, file: !3, line: 1046, column: 7)
!137 = !{!138, !122, i64 0}
!138 = !{!"block", !122, i64 0, !91, i64 8}
!139 = !DILocation(line: 0, scope: !124, inlinedAt: !140)
!140 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !146)
!141 = distinct !DISubprogram(name: "get_size", scope: !3, file: !3, line: 244, type: !142, scopeLine: 244, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !144)
!142 = !DISubroutineType(types: !143)
!143 = !{!42, !13}
!144 = !{!145}
!145 = !DILocalVariable(name: "block", arg: 1, scope: !141, file: !3, line: 244, type: !13)
!146 = distinct !DILocation(line: 1046, column: 7, scope: !136, inlinedAt: !87)
!147 = !DILocation(line: 1046, column: 26, scope: !136, inlinedAt: !87)
!148 = !DILocation(line: 1295, column: 7, scope: !73)
!149 = !DILocalVariable(name: "block", scope: !150, file: !3, line: 1080, type: !13)
!150 = distinct !DILexicalBlock(scope: !151, file: !3, line: 1080, column: 3)
!151 = distinct !DISubprogram(name: "valid_blocks", scope: !3, file: !3, line: 1075, type: !83, scopeLine: 1075, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !152)
!152 = !{!149}
!153 = !DILocation(line: 0, scope: !150, inlinedAt: !154)
!154 = distinct !DILocation(line: 1302, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1302, column: 7)
!156 = !DILocation(line: 1080, column: 37, scope: !157, inlinedAt: !154)
!157 = distinct !DILexicalBlock(scope: !150, file: !3, line: 1080, column: 3)
!158 = !DILocation(line: 0, scope: !141, inlinedAt: !159)
!159 = distinct !DILocation(line: 1080, column: 37, scope: !157, inlinedAt: !154)
!160 = !DILocation(line: 0, scope: !124, inlinedAt: !161)
!161 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !159)
!162 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !161)
!163 = !DILocation(line: 1080, column: 53, scope: !157, inlinedAt: !154)
!164 = !DILocation(line: 1080, column: 3, scope: !150, inlinedAt: !154)
!165 = !DILocation(line: 0, scope: !141, inlinedAt: !166)
!166 = distinct !DILocation(line: 1087, column: 9, scope: !167, inlinedAt: !154)
!167 = distinct !DILexicalBlock(scope: !168, file: !3, line: 1087, column: 9)
!168 = distinct !DILexicalBlock(scope: !157, file: !3, line: 1080, column: 84)
!169 = !DILocation(line: 0, scope: !124, inlinedAt: !170)
!170 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !166)
!171 = !DILocalVariable(name: "block", arg: 1, scope: !172, file: !3, line: 410, type: !13)
!172 = distinct !DISubprogram(name: "find_next", scope: !3, file: !3, line: 410, type: !97, scopeLine: 410, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !173)
!173 = !{!171}
!174 = !DILocation(line: 0, scope: !172, inlinedAt: !175)
!175 = distinct !DILocation(line: 1080, column: 66, scope: !157, inlinedAt: !154)
!176 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !175)
!177 = !DILocation(line: 0, scope: !141, inlinedAt: !178)
!178 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !175)
!179 = !DILocation(line: 0, scope: !124, inlinedAt: !180)
!180 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !178)
!181 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !175)
!182 = !DILocation(line: 414, column: 12, scope: !172, inlinedAt: !175)
!183 = distinct !{!183, !164, !184, !185}
!184 = !DILocation(line: 1091, column: 3, scope: !150, inlinedAt: !154)
!185 = !{!"llvm.loop.mustprogress"}
!186 = !DILocation(line: 1302, column: 7, scope: !73)
!187 = !DILocalVariable(name: "block", scope: !188, file: !3, line: 1111, type: !13)
!188 = distinct !DILexicalBlock(scope: !189, file: !3, line: 1111, column: 3)
!189 = distinct !DISubprogram(name: "check_coalescing", scope: !3, file: !3, line: 1106, type: !83, scopeLine: 1106, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !190)
!190 = !{!187, !191, !194, !197}
!191 = !DILocalVariable(name: "is_free", scope: !192, file: !3, line: 1112, type: !35)
!192 = distinct !DILexicalBlock(scope: !193, file: !3, line: 1111, column: 84)
!193 = distinct !DILexicalBlock(scope: !188, file: !3, line: 1111, column: 3)
!194 = !DILocalVariable(name: "prev_free", scope: !195, file: !3, line: 1116, type: !35)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 1114, column: 17)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 1114, column: 9)
!197 = !DILocalVariable(name: "next_free", scope: !195, file: !3, line: 1117, type: !35)
!198 = !DILocation(line: 0, scope: !188, inlinedAt: !199)
!199 = distinct !DILocation(line: 1309, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1309, column: 7)
!201 = !DILocation(line: 0, scope: !141, inlinedAt: !202)
!202 = distinct !DILocation(line: 1111, column: 37, scope: !193, inlinedAt: !199)
!203 = !DILocation(line: 0, scope: !124, inlinedAt: !204)
!204 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !202)
!205 = !DILocation(line: 1111, column: 3, scope: !188, inlinedAt: !199)
!206 = !DILocalVariable(name: "block", arg: 1, scope: !207, file: !3, line: 363, type: !13)
!207 = distinct !DISubprogram(name: "get_alloc", scope: !3, file: !3, line: 363, type: !208, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !210)
!208 = !DISubroutineType(types: !209)
!209 = !{!35, !13}
!210 = !{!206}
!211 = !DILocation(line: 0, scope: !207, inlinedAt: !212)
!212 = distinct !DILocation(line: 1112, column: 21, scope: !192, inlinedAt: !199)
!213 = !DILocalVariable(name: "word", arg: 1, scope: !214, file: !3, line: 326, type: !6)
!214 = distinct !DISubprogram(name: "extract_alloc", scope: !3, file: !3, line: 326, type: !215, scopeLine: 326, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !217)
!215 = !DISubroutineType(types: !216)
!216 = !{!35, !6}
!217 = !{!213}
!218 = !DILocation(line: 0, scope: !214, inlinedAt: !219)
!219 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !212)
!220 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !219)
!221 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !219)
!222 = !DILocation(line: 0, scope: !192, inlinedAt: !199)
!223 = !DILocation(line: 1114, column: 9, scope: !192, inlinedAt: !199)
!224 = !DILocation(line: 1111, column: 37, scope: !193, inlinedAt: !199)
!225 = !DILocation(line: 0, scope: !96, inlinedAt: !226)
!226 = distinct !DILocation(line: 1116, column: 35, scope: !195, inlinedAt: !199)
!227 = !DILocation(line: 0, scope: !104, inlinedAt: !228)
!228 = distinct !DILocation(line: 444, column: 23, scope: !96, inlinedAt: !226)
!229 = !DILocation(line: 424, column: 29, scope: !104, inlinedAt: !228)
!230 = !DILocation(line: 0, scope: !113, inlinedAt: !231)
!231 = distinct !DILocation(line: 445, column: 12, scope: !96, inlinedAt: !226)
!232 = !DILocation(line: 296, column: 32, scope: !113, inlinedAt: !231)
!233 = !DILocation(line: 0, scope: !124, inlinedAt: !234)
!234 = distinct !DILocation(line: 296, column: 19, scope: !113, inlinedAt: !231)
!235 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !234)
!236 = !DILocation(line: 297, column: 14, scope: !132, inlinedAt: !231)
!237 = !DILocation(line: 297, column: 9, scope: !113, inlinedAt: !231)
!238 = !DILocation(line: 1116, column: 25, scope: !195, inlinedAt: !199)
!239 = !DILocation(line: 0, scope: !207, inlinedAt: !240)
!240 = distinct !DILocation(line: 1116, column: 25, scope: !195, inlinedAt: !199)
!241 = !DILocation(line: 0, scope: !214, inlinedAt: !242)
!242 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !240)
!243 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !242)
!244 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !242)
!245 = !DILocation(line: 0, scope: !195, inlinedAt: !199)
!246 = !DILocation(line: 0, scope: !172, inlinedAt: !247)
!247 = distinct !DILocation(line: 1117, column: 35, scope: !195, inlinedAt: !199)
!248 = !DILocation(line: 0, scope: !141, inlinedAt: !249)
!249 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !247)
!250 = !DILocation(line: 0, scope: !124, inlinedAt: !251)
!251 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !249)
!252 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !247)
!253 = !DILocation(line: 1117, column: 25, scope: !195, inlinedAt: !199)
!254 = !DILocation(line: 0, scope: !207, inlinedAt: !255)
!255 = distinct !DILocation(line: 1117, column: 25, scope: !195, inlinedAt: !199)
!256 = !DILocation(line: 0, scope: !214, inlinedAt: !257)
!257 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !255)
!258 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !257)
!259 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !257)
!260 = !DILocation(line: 1120, column: 21, scope: !261, inlinedAt: !199)
!261 = distinct !DILexicalBlock(scope: !195, file: !3, line: 1120, column: 11)
!262 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !263)
!263 = distinct !DILocation(line: 1111, column: 66, scope: !193, inlinedAt: !199)
!264 = !DILocation(line: 0, scope: !172, inlinedAt: !263)
!265 = !DILocation(line: 0, scope: !141, inlinedAt: !266)
!266 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !263)
!267 = !DILocation(line: 0, scope: !124, inlinedAt: !268)
!268 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !266)
!269 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !263)
!270 = !DILocation(line: 414, column: 12, scope: !172, inlinedAt: !263)
!271 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !204)
!272 = !DILocation(line: 1111, column: 53, scope: !193, inlinedAt: !199)
!273 = distinct !{!273, !205, !274, !185}
!274 = !DILocation(line: 1122, column: 3, scope: !188, inlinedAt: !199)
!275 = !DILocalVariable(name: "i", scope: !276, file: !3, line: 1261, type: !42)
!276 = distinct !DILexicalBlock(scope: !277, file: !3, line: 1261, column: 3)
!277 = distinct !DISubprogram(name: "no_cycles", scope: !3, file: !3, line: 1255, type: !83, scopeLine: 1255, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !278)
!278 = !{!275, !279, !282}
!279 = !DILocalVariable(name: "seg_free_list_start", scope: !280, file: !3, line: 1262, type: !13)
!280 = distinct !DILexicalBlock(scope: !281, file: !3, line: 1261, column: 44)
!281 = distinct !DILexicalBlock(scope: !276, file: !3, line: 1261, column: 3)
!282 = !DILocalVariable(name: "block", scope: !283, file: !3, line: 1264, type: !13)
!283 = distinct !DILexicalBlock(scope: !280, file: !3, line: 1264, column: 5)
!284 = !DILocation(line: 0, scope: !276, inlinedAt: !285)
!285 = distinct !DILocation(line: 1319, column: 8, scope: !286)
!286 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1319, column: 7)
!287 = !DILocation(line: 1262, column: 36, scope: !280, inlinedAt: !285)
!288 = !DILocation(line: 0, scope: !280, inlinedAt: !285)
!289 = !DILocation(line: 0, scope: !283, inlinedAt: !285)
!290 = !DILocation(line: 1264, column: 10, scope: !283, inlinedAt: !285)
!291 = !DILocation(line: 1264, column: 54, scope: !292, inlinedAt: !285)
!292 = distinct !DILexicalBlock(scope: !283, file: !3, line: 1264, column: 5)
!293 = !DILocation(line: 1264, column: 5, scope: !283, inlinedAt: !285)
!294 = !DILocation(line: 1265, column: 18, scope: !295, inlinedAt: !285)
!295 = distinct !DILexicalBlock(scope: !296, file: !3, line: 1265, column: 11)
!296 = distinct !DILexicalBlock(scope: !292, file: !3, line: 1264, column: 88)
!297 = !{!91, !91, i64 0}
!298 = !DILocation(line: 1265, column: 28, scope: !295, inlinedAt: !285)
!299 = !DILocation(line: 1265, column: 11, scope: !296, inlinedAt: !285)
!300 = distinct !{!300, !293, !301, !185}
!301 = !DILocation(line: 1266, column: 5, scope: !283, inlinedAt: !285)
!302 = distinct !{!302, !293, !301, !185}
!303 = distinct !{!303, !293, !301, !185}
!304 = distinct !{!304, !293, !301, !185}
!305 = distinct !{!305, !293, !301, !185}
!306 = distinct !{!306, !293, !301, !185}
!307 = distinct !{!307, !293, !301, !185}
!308 = distinct !{!308, !293, !301, !185}
!309 = distinct !{!309, !293, !301, !185}
!310 = distinct !{!310, !293, !301, !185}
!311 = !DILocalVariable(name: "i", scope: !312, file: !3, line: 1143, type: !42)
!312 = distinct !DILexicalBlock(scope: !313, file: !3, line: 1143, column: 3)
!313 = distinct !DISubprogram(name: "consistent_pointers", scope: !3, file: !3, line: 1141, type: !83, scopeLine: 1141, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !314)
!314 = !{!311, !315, !318, !320, !324, !325}
!315 = !DILocalVariable(name: "seg_free_list_start", scope: !316, file: !3, line: 1144, type: !13)
!316 = distinct !DILexicalBlock(scope: !317, file: !3, line: 1143, column: 44)
!317 = distinct !DILexicalBlock(scope: !312, file: !3, line: 1143, column: 3)
!318 = !DILocalVariable(name: "A", scope: !319, file: !3, line: 1146, type: !13)
!319 = distinct !DILexicalBlock(scope: !316, file: !3, line: 1146, column: 5)
!320 = !DILocalVariable(name: "heap_start_address", scope: !321, file: !3, line: 1148, type: !323)
!321 = distinct !DILexicalBlock(scope: !322, file: !3, line: 1146, column: 72)
!322 = distinct !DILexicalBlock(scope: !319, file: !3, line: 1146, column: 5)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!324 = !DILocalVariable(name: "heap_end_address", scope: !321, file: !3, line: 1149, type: !323)
!325 = !DILocalVariable(name: "B", scope: !321, file: !3, line: 1156, type: !13)
!326 = !DILocation(line: 0, scope: !312, inlinedAt: !327)
!327 = distinct !DILocation(line: 1326, column: 8, scope: !328)
!328 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1326, column: 7)
!329 = !DILocation(line: 0, scope: !316, inlinedAt: !327)
!330 = !DILocation(line: 0, scope: !319, inlinedAt: !327)
!331 = !DILocation(line: 1146, column: 46, scope: !322, inlinedAt: !327)
!332 = !DILocation(line: 1146, column: 5, scope: !319, inlinedAt: !327)
!333 = !DILocation(line: 1148, column: 36, scope: !321, inlinedAt: !327)
!334 = !DILocation(line: 0, scope: !321, inlinedAt: !327)
!335 = !DILocation(line: 1149, column: 34, scope: !321, inlinedAt: !327)
!336 = !DILocation(line: 1151, column: 24, scope: !337, inlinedAt: !327)
!337 = distinct !DILexicalBlock(scope: !321, file: !3, line: 1151, column: 11)
!338 = !DILocation(line: 1151, column: 11, scope: !321, inlinedAt: !327)
!339 = !DILocation(line: 1156, column: 23, scope: !321, inlinedAt: !327)
!340 = !DILocation(line: 1158, column: 13, scope: !341, inlinedAt: !327)
!341 = distinct !DILexicalBlock(scope: !321, file: !3, line: 1158, column: 11)
!342 = !DILocation(line: 1158, column: 11, scope: !321, inlinedAt: !327)
!343 = !DILocation(line: 1162, column: 14, scope: !344, inlinedAt: !327)
!344 = distinct !DILexicalBlock(scope: !321, file: !3, line: 1162, column: 11)
!345 = !DILocation(line: 1162, column: 24, scope: !344, inlinedAt: !327)
!346 = !DILocation(line: 0, scope: !322, inlinedAt: !327)
!347 = distinct !{!347, !332, !348, !185}
!348 = !DILocation(line: 1166, column: 5, scope: !319, inlinedAt: !327)
!349 = distinct !{!349, !332, !348, !185}
!350 = distinct !{!350, !332, !348, !185}
!351 = distinct !{!351, !332, !348, !185}
!352 = distinct !{!352, !332, !348, !185}
!353 = distinct !{!353, !332, !348, !185}
!354 = distinct !{!354, !332, !348, !185}
!355 = distinct !{!355, !332, !348, !185}
!356 = distinct !{!356, !332, !348, !185}
!357 = distinct !{!357, !332, !348, !185}
!358 = !DILocalVariable(name: "i", scope: !359, file: !3, line: 1234, type: !42)
!359 = distinct !DILexicalBlock(scope: !360, file: !3, line: 1234, column: 3)
!360 = distinct !DISubprogram(name: "all_free", scope: !3, file: !3, line: 1228, type: !83, scopeLine: 1228, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !361)
!361 = !{!358, !362, !365}
!362 = !DILocalVariable(name: "seg_free_list_start", scope: !363, file: !3, line: 1235, type: !13)
!363 = distinct !DILexicalBlock(scope: !364, file: !3, line: 1234, column: 44)
!364 = distinct !DILexicalBlock(scope: !359, file: !3, line: 1234, column: 3)
!365 = !DILocalVariable(name: "A", scope: !366, file: !3, line: 1237, type: !13)
!366 = distinct !DILexicalBlock(scope: !363, file: !3, line: 1237, column: 5)
!367 = !DILocation(line: 0, scope: !359, inlinedAt: !368)
!368 = distinct !DILocation(line: 1333, column: 8, scope: !369)
!369 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1333, column: 7)
!370 = !DILocation(line: 0, scope: !363, inlinedAt: !368)
!371 = !DILocation(line: 0, scope: !366, inlinedAt: !368)
!372 = !DILocation(line: 1237, column: 46, scope: !373, inlinedAt: !368)
!373 = distinct !DILexicalBlock(scope: !366, file: !3, line: 1237, column: 5)
!374 = !DILocation(line: 1237, column: 5, scope: !366, inlinedAt: !368)
!375 = !DILocation(line: 1237, column: 62, scope: !373, inlinedAt: !368)
!376 = distinct !{!376, !374, !377, !185}
!377 = !DILocation(line: 1239, column: 5, scope: !366, inlinedAt: !368)
!378 = !DILocation(line: 1238, column: 11, scope: !379, inlinedAt: !368)
!379 = distinct !DILexicalBlock(scope: !380, file: !3, line: 1238, column: 11)
!380 = distinct !DILexicalBlock(scope: !373, file: !3, line: 1237, column: 72)
!381 = !DILocation(line: 0, scope: !207, inlinedAt: !382)
!382 = distinct !DILocation(line: 1238, column: 11, scope: !379, inlinedAt: !368)
!383 = !DILocation(line: 0, scope: !214, inlinedAt: !384)
!384 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !382)
!385 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !384)
!386 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !384)
!387 = !DILocation(line: 1238, column: 11, scope: !380, inlinedAt: !368)
!388 = distinct !{!388, !374, !377, !185}
!389 = distinct !{!389, !374, !377, !185}
!390 = distinct !{!390, !374, !377, !185}
!391 = distinct !{!391, !374, !377, !185}
!392 = distinct !{!392, !374, !377, !185}
!393 = distinct !{!393, !374, !377, !185}
!394 = distinct !{!394, !374, !377, !185}
!395 = distinct !{!395, !374, !377, !185}
!396 = distinct !{!396, !374, !377, !185}
!397 = !DILocation(line: 1339, column: 8, scope: !398)
!398 = distinct !DILexicalBlock(scope: !73, file: !3, line: 1339, column: 7)
!399 = !DILocation(line: 1348, column: 1, scope: !73)
!400 = distinct !DISubprogram(name: "mm_init", scope: !3, file: !3, line: 1360, type: !83, scopeLine: 1360, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !401)
!401 = !{!402, !403}
!402 = !DILocalVariable(name: "start", scope: !400, file: !3, line: 1362, type: !5)
!403 = !DILocalVariable(name: "i", scope: !404, file: !3, line: 1373, type: !42)
!404 = distinct !DILexicalBlock(scope: !400, file: !3, line: 1373, column: 5)
!405 = !DILocation(line: 1362, column: 32, scope: !400)
!406 = !DILocation(line: 0, scope: !400)
!407 = !DILocation(line: 1365, column: 15, scope: !408)
!408 = distinct !DILexicalBlock(scope: !400, file: !3, line: 1365, column: 9)
!409 = !DILocation(line: 1365, column: 9, scope: !400)
!410 = !DILocation(line: 1374, column: 23, scope: !411)
!411 = distinct !DILexicalBlock(scope: !412, file: !3, line: 1373, column: 46)
!412 = distinct !DILexicalBlock(scope: !404, file: !3, line: 1373, column: 5)
!413 = !DILocation(line: 0, scope: !404)
!414 = !DILocation(line: 1378, column: 21, scope: !400)
!415 = !DILocalVariable(name: "size", arg: 1, scope: !416, file: !3, line: 207, type: !42)
!416 = distinct !DISubprogram(name: "pack", scope: !3, file: !3, line: 207, type: !417, scopeLine: 207, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !419)
!417 = !DISubroutineType(types: !418)
!418 = !{!6, !42, !35, !35, !35}
!419 = !{!415, !420, !421, !422, !423}
!420 = !DILocalVariable(name: "alloc", arg: 2, scope: !416, file: !3, line: 207, type: !35)
!421 = !DILocalVariable(name: "prev_alloc", arg: 3, scope: !416, file: !3, line: 207, type: !35)
!422 = !DILocalVariable(name: "prev_mini", arg: 4, scope: !416, file: !3, line: 207, type: !35)
!423 = !DILocalVariable(name: "word", scope: !416, file: !3, line: 208, type: !6)
!424 = !DILocation(line: 0, scope: !416, inlinedAt: !425)
!425 = distinct !DILocation(line: 1382, column: 16, scope: !400)
!426 = !DILocation(line: 0, scope: !416, inlinedAt: !427)
!427 = distinct !DILocation(line: 1383, column: 16, scope: !400)
!428 = !DILocation(line: 1383, column: 5, scope: !400)
!429 = !DILocation(line: 1382, column: 14, scope: !400)
!430 = !DILocation(line: 1388, column: 16, scope: !400)
!431 = !DILocalVariable(name: "size", arg: 1, scope: !432, file: !3, line: 868, type: !42)
!432 = distinct !DISubprogram(name: "extend_heap", scope: !3, file: !3, line: 868, type: !433, scopeLine: 868, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !435)
!433 = !DISubroutineType(types: !434)
!434 = !{!13, !42}
!435 = !{!431, !436, !437, !438}
!436 = !DILocalVariable(name: "bp", scope: !432, file: !3, line: 870, type: !12)
!437 = !DILocalVariable(name: "block", scope: !432, file: !3, line: 880, type: !13)
!438 = !DILocalVariable(name: "block_next", scope: !432, file: !3, line: 884, type: !13)
!439 = !DILocation(line: 0, scope: !432, inlinedAt: !440)
!440 = distinct !DILocation(line: 1391, column: 9, scope: !441)
!441 = distinct !DILexicalBlock(scope: !400, file: !3, line: 1391, column: 9)
!442 = !DILocation(line: 874, column: 15, scope: !443, inlinedAt: !440)
!443 = distinct !DILexicalBlock(scope: !432, file: !3, line: 874, column: 9)
!444 = !DILocation(line: 874, column: 41, scope: !443, inlinedAt: !440)
!445 = !DILocation(line: 874, column: 9, scope: !432, inlinedAt: !440)
!446 = !DILocalVariable(name: "bp", arg: 1, scope: !447, file: !3, line: 254, type: !12)
!447 = distinct !DISubprogram(name: "payload_to_header", scope: !3, file: !3, line: 254, type: !448, scopeLine: 254, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!448 = !DISubroutineType(types: !449)
!449 = !{!13, !12}
!450 = !{!446}
!451 = !DILocation(line: 0, scope: !447, inlinedAt: !452)
!452 = distinct !DILocation(line: 880, column: 22, scope: !432, inlinedAt: !440)
!453 = !DILocation(line: 255, column: 35, scope: !447, inlinedAt: !452)
!454 = !DILocation(line: 255, column: 12, scope: !447, inlinedAt: !452)
!455 = !DILocation(line: 881, column: 37, scope: !432, inlinedAt: !440)
!456 = !DILocalVariable(name: "block", arg: 1, scope: !457, file: !3, line: 493, type: !13)
!457 = distinct !DISubprogram(name: "write_block", scope: !3, file: !3, line: 493, type: !458, scopeLine: 494, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !460)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !13, !42, !35, !35, !35}
!460 = !{!456, !461, !462, !463, !464, !465, !470, !471, !472}
!461 = !DILocalVariable(name: "size", arg: 2, scope: !457, file: !3, line: 493, type: !42)
!462 = !DILocalVariable(name: "alloc", arg: 3, scope: !457, file: !3, line: 494, type: !35)
!463 = !DILocalVariable(name: "prev_alloc", arg: 4, scope: !457, file: !3, line: 494, type: !35)
!464 = !DILocalVariable(name: "prev_mini", arg: 5, scope: !457, file: !3, line: 494, type: !35)
!465 = !DILocalVariable(name: "footerp", scope: !466, file: !3, line: 511, type: !5)
!466 = distinct !DILexicalBlock(scope: !467, file: !3, line: 509, column: 11)
!467 = distinct !DILexicalBlock(scope: !468, file: !3, line: 506, column: 11)
!468 = distinct !DILexicalBlock(scope: !469, file: !3, line: 504, column: 9)
!469 = distinct !DILexicalBlock(scope: !457, file: !3, line: 500, column: 9)
!470 = !DILocalVariable(name: "next_block", scope: !468, file: !3, line: 517, type: !13)
!471 = !DILocalVariable(name: "is_next_alloc", scope: !468, file: !3, line: 518, type: !35)
!472 = !DILocalVariable(name: "next_size", scope: !468, file: !3, line: 519, type: !42)
!473 = !DILocation(line: 0, scope: !457, inlinedAt: !474)
!474 = distinct !DILocation(line: 881, column: 5, scope: !432, inlinedAt: !440)
!475 = !DILocation(line: 0, scope: !469, inlinedAt: !474)
!476 = !DILocation(line: 0, scope: !416, inlinedAt: !477)
!477 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !474)
!478 = distinct !DILexicalBlock(scope: !467, file: !3, line: 506, column: 17)
!479 = !DILocation(line: 0, scope: !416, inlinedAt: !480)
!480 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !474)
!481 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !480)
!482 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !474)
!483 = !DILocalVariable(name: "block", arg: 1, scope: !484, file: !3, line: 277, type: !13)
!484 = distinct !DISubprogram(name: "header_to_footer", scope: !3, file: !3, line: 277, type: !105, scopeLine: 277, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !485)
!485 = !{!483}
!486 = !DILocation(line: 0, scope: !484, inlinedAt: !487)
!487 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !474)
!488 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !487)
!489 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !487)
!490 = !DILocation(line: 0, scope: !466, inlinedAt: !474)
!491 = !DILocation(line: 0, scope: !416, inlinedAt: !492)
!492 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !474)
!493 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !474)
!494 = !DILocation(line: 0, scope: !172, inlinedAt: !495)
!495 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !474)
!496 = !DILocation(line: 0, scope: !468, inlinedAt: !474)
!497 = !DILocation(line: 0, scope: !416, inlinedAt: !498)
!498 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !474)
!499 = distinct !DILexicalBlock(scope: !500, file: !3, line: 525, column: 11)
!500 = distinct !DILexicalBlock(scope: !468, file: !3, line: 522, column: 11)
!501 = !DILocation(line: 0, scope: !416, inlinedAt: !502)
!502 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !474)
!503 = distinct !DILexicalBlock(scope: !500, file: !3, line: 522, column: 25)
!504 = !DILocation(line: 0, scope: !172, inlinedAt: !505)
!505 = distinct !DILocation(line: 884, column: 27, scope: !432, inlinedAt: !440)
!506 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !505)
!507 = !DILocalVariable(name: "block", arg: 1, scope: !508, file: !3, line: 393, type: !13)
!508 = distinct !DISubprogram(name: "write_epilogue", scope: !3, file: !3, line: 393, type: !509, scopeLine: 393, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !511)
!509 = !DISubroutineType(types: !510)
!510 = !{null, !13, !35}
!511 = !{!507, !512}
!512 = !DILocalVariable(name: "is_prev_mini", arg: 2, scope: !508, file: !3, line: 393, type: !35)
!513 = !DILocation(line: 0, scope: !508, inlinedAt: !514)
!514 = distinct !DILocation(line: 885, column: 5, scope: !432, inlinedAt: !440)
!515 = !DILocation(line: 0, scope: !416, inlinedAt: !516)
!516 = distinct !DILocation(line: 396, column: 21, scope: !508, inlinedAt: !514)
!517 = !DILocation(line: 396, column: 12, scope: !508, inlinedAt: !514)
!518 = !DILocation(line: 396, column: 19, scope: !508, inlinedAt: !514)
!519 = !DILocation(line: 888, column: 13, scope: !432, inlinedAt: !440)
!520 = !DILocation(line: 1396, column: 1, scope: !400)
!521 = !DISubprogram(name: "mem_sbrk", scope: !522, file: !522, line: 37, type: !523, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !525)
!522 = !DIFile(filename: "./memlib.h", directory: "/afs/andrew.cmu.edu/usr16/gdeherme/private/15213/labs/malloclab-f23-gonzoherme", checksumkind: CSK_MD5, checksum: "37b081d8653fabdc7bb50cf8ca5e2d25")
!523 = !DISubroutineType(types: !524)
!524 = !{!12, !36}
!525 = !{}
!526 = distinct !DISubprogram(name: "mm_malloc", scope: !3, file: !3, line: 1409, type: !527, scopeLine: 1409, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !529)
!527 = !DISubroutineType(types: !528)
!528 = !{!12, !42}
!529 = !{!530, !531, !532, !533, !534, !535}
!530 = !DILocalVariable(name: "size", arg: 1, scope: !526, file: !3, line: 1409, type: !42)
!531 = !DILocalVariable(name: "asize", scope: !526, file: !3, line: 1413, type: !42)
!532 = !DILocalVariable(name: "extendsize", scope: !526, file: !3, line: 1414, type: !42)
!533 = !DILocalVariable(name: "block", scope: !526, file: !3, line: 1415, type: !13)
!534 = !DILocalVariable(name: "bp", scope: !526, file: !3, line: 1416, type: !12)
!535 = !DILocalVariable(name: "block_size", scope: !526, file: !3, line: 1455, type: !42)
!536 = !DILocation(line: 0, scope: !526)
!537 = !DILocation(line: 1419, column: 9, scope: !538)
!538 = distinct !DILexicalBlock(scope: !526, file: !3, line: 1419, column: 9)
!539 = !DILocation(line: 1419, column: 20, scope: !538)
!540 = !DILocation(line: 1419, column: 9, scope: !526)
!541 = !DILocation(line: 1362, column: 32, scope: !400, inlinedAt: !542)
!542 = distinct !DILocation(line: 1420, column: 15, scope: !543)
!543 = distinct !DILexicalBlock(scope: !544, file: !3, line: 1420, column: 13)
!544 = distinct !DILexicalBlock(scope: !538, file: !3, line: 1419, column: 29)
!545 = !DILocation(line: 0, scope: !400, inlinedAt: !542)
!546 = !DILocation(line: 1365, column: 15, scope: !408, inlinedAt: !542)
!547 = !DILocation(line: 1365, column: 9, scope: !400, inlinedAt: !542)
!548 = !DILocation(line: 1374, column: 23, scope: !411, inlinedAt: !542)
!549 = !DILocation(line: 0, scope: !404, inlinedAt: !542)
!550 = !DILocation(line: 1378, column: 21, scope: !400, inlinedAt: !542)
!551 = !DILocation(line: 0, scope: !416, inlinedAt: !552)
!552 = distinct !DILocation(line: 1382, column: 16, scope: !400, inlinedAt: !542)
!553 = !DILocation(line: 0, scope: !416, inlinedAt: !554)
!554 = distinct !DILocation(line: 1383, column: 16, scope: !400, inlinedAt: !542)
!555 = !DILocation(line: 1383, column: 5, scope: !400, inlinedAt: !542)
!556 = !DILocation(line: 1382, column: 14, scope: !400, inlinedAt: !542)
!557 = !DILocation(line: 1388, column: 16, scope: !400, inlinedAt: !542)
!558 = !DILocation(line: 0, scope: !432, inlinedAt: !559)
!559 = distinct !DILocation(line: 1391, column: 9, scope: !441, inlinedAt: !542)
!560 = !DILocation(line: 874, column: 15, scope: !443, inlinedAt: !559)
!561 = !DILocation(line: 874, column: 41, scope: !443, inlinedAt: !559)
!562 = !DILocation(line: 874, column: 9, scope: !432, inlinedAt: !559)
!563 = !DILocation(line: 0, scope: !447, inlinedAt: !564)
!564 = distinct !DILocation(line: 880, column: 22, scope: !432, inlinedAt: !559)
!565 = !DILocation(line: 255, column: 35, scope: !447, inlinedAt: !564)
!566 = !DILocation(line: 255, column: 12, scope: !447, inlinedAt: !564)
!567 = !DILocation(line: 881, column: 37, scope: !432, inlinedAt: !559)
!568 = !DILocation(line: 0, scope: !457, inlinedAt: !569)
!569 = distinct !DILocation(line: 881, column: 5, scope: !432, inlinedAt: !559)
!570 = !DILocation(line: 0, scope: !469, inlinedAt: !569)
!571 = !DILocation(line: 0, scope: !416, inlinedAt: !572)
!572 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !569)
!573 = !DILocation(line: 0, scope: !416, inlinedAt: !574)
!574 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !569)
!575 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !574)
!576 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !569)
!577 = !DILocation(line: 0, scope: !484, inlinedAt: !578)
!578 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !569)
!579 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !578)
!580 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !578)
!581 = !DILocation(line: 0, scope: !466, inlinedAt: !569)
!582 = !DILocation(line: 0, scope: !416, inlinedAt: !583)
!583 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !569)
!584 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !569)
!585 = !DILocation(line: 0, scope: !172, inlinedAt: !586)
!586 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !569)
!587 = !DILocation(line: 0, scope: !468, inlinedAt: !569)
!588 = !DILocation(line: 0, scope: !416, inlinedAt: !589)
!589 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !569)
!590 = !DILocation(line: 0, scope: !416, inlinedAt: !591)
!591 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !569)
!592 = !DILocation(line: 0, scope: !172, inlinedAt: !593)
!593 = distinct !DILocation(line: 884, column: 27, scope: !432, inlinedAt: !559)
!594 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !593)
!595 = !DILocation(line: 0, scope: !508, inlinedAt: !596)
!596 = distinct !DILocation(line: 885, column: 5, scope: !432, inlinedAt: !559)
!597 = !DILocation(line: 0, scope: !416, inlinedAt: !598)
!598 = distinct !DILocation(line: 396, column: 21, scope: !508, inlinedAt: !596)
!599 = !DILocation(line: 396, column: 12, scope: !508, inlinedAt: !596)
!600 = !DILocation(line: 396, column: 19, scope: !508, inlinedAt: !596)
!601 = !DILocation(line: 888, column: 13, scope: !432, inlinedAt: !559)
!602 = !DILocation(line: 1420, column: 13, scope: !544)
!603 = !DILocation(line: 1427, column: 14, scope: !604)
!604 = distinct !DILexicalBlock(scope: !526, file: !3, line: 1427, column: 9)
!605 = !DILocation(line: 1427, column: 9, scope: !526)
!606 = !DILocalVariable(name: "size", arg: 1, scope: !607, file: !3, line: 191, type: !42)
!607 = distinct !DISubprogram(name: "round_up", scope: !3, file: !3, line: 191, type: !608, scopeLine: 191, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !610)
!608 = !DISubroutineType(types: !609)
!609 = !{!42, !42, !42}
!610 = !{!606, !611}
!611 = !DILocalVariable(name: "n", arg: 2, scope: !607, file: !3, line: 191, type: !42)
!612 = !DILocation(line: 0, scope: !607, inlinedAt: !613)
!613 = distinct !DILocation(line: 1434, column: 13, scope: !526)
!614 = !DILocation(line: 192, column: 23, scope: !607, inlinedAt: !613)
!615 = !DILocation(line: 192, column: 14, scope: !607, inlinedAt: !613)
!616 = !DILocalVariable(name: "asize", arg: 1, scope: !617, file: !3, line: 972, type: !42)
!617 = distinct !DISubprogram(name: "find_fit", scope: !3, file: !3, line: 972, type: !433, scopeLine: 972, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !618)
!618 = !{!616, !619, !620, !623, !625, !628, !630, !633, !636, !637, !638, !640}
!619 = !DILocalVariable(name: "mini_block_fit", scope: !617, file: !3, line: 975, type: !13)
!620 = !DILocalVariable(name: "index", scope: !621, file: !3, line: 988, type: !42)
!621 = distinct !DILexicalBlock(scope: !622, file: !3, line: 986, column: 8)
!622 = distinct !DILexicalBlock(scope: !617, file: !3, line: 982, column: 7)
!623 = !DILocalVariable(name: "i", scope: !624, file: !3, line: 991, type: !42)
!624 = distinct !DILexicalBlock(scope: !621, file: !3, line: 991, column: 5)
!625 = !DILocalVariable(name: "seg_free_list_start", scope: !626, file: !3, line: 992, type: !13)
!626 = distinct !DILexicalBlock(scope: !627, file: !3, line: 991, column: 50)
!627 = distinct !DILexicalBlock(scope: !624, file: !3, line: 991, column: 5)
!628 = !DILocalVariable(name: "block", scope: !629, file: !3, line: 994, type: !13)
!629 = distinct !DILexicalBlock(scope: !626, file: !3, line: 994, column: 7)
!630 = !DILocalVariable(name: "available_size", scope: !631, file: !3, line: 995, type: !42)
!631 = distinct !DILexicalBlock(scope: !632, file: !3, line: 994, column: 90)
!632 = distinct !DILexicalBlock(scope: !629, file: !3, line: 994, column: 7)
!633 = !DILocalVariable(name: "counter", scope: !634, file: !3, line: 999, type: !42)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 996, column: 30)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 996, column: 6)
!636 = !DILocalVariable(name: "best_size", scope: !634, file: !3, line: 1000, type: !42)
!637 = !DILocalVariable(name: "best_fit", scope: !634, file: !3, line: 1001, type: !13)
!638 = !DILocalVariable(name: "compare_block", scope: !639, file: !3, line: 1003, type: !13)
!639 = distinct !DILexicalBlock(scope: !634, file: !3, line: 1003, column: 4)
!640 = !DILocalVariable(name: "compare_size", scope: !641, file: !3, line: 1004, type: !42)
!641 = distinct !DILexicalBlock(scope: !642, file: !3, line: 1003, column: 105)
!642 = distinct !DILexicalBlock(scope: !639, file: !3, line: 1003, column: 4)
!643 = !DILocation(line: 0, scope: !617, inlinedAt: !644)
!644 = distinct !DILocation(line: 1437, column: 13, scope: !526)
!645 = !DILocation(line: 977, column: 13, scope: !646, inlinedAt: !644)
!646 = distinct !DILexicalBlock(scope: !617, file: !3, line: 977, column: 7)
!647 = !DILocation(line: 977, column: 7, scope: !617, inlinedAt: !644)
!648 = !DILocalVariable(name: "asize", arg: 1, scope: !649, file: !3, line: 949, type: !42)
!649 = distinct !DISubprogram(name: "find_mini_fit", scope: !3, file: !3, line: 949, type: !433, scopeLine: 949, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !650)
!650 = !{!648}
!651 = !DILocation(line: 0, scope: !649, inlinedAt: !652)
!652 = distinct !DILocation(line: 978, column: 22, scope: !653, inlinedAt: !644)
!653 = distinct !DILexicalBlock(scope: !646, file: !3, line: 977, column: 31)
!654 = !DILocation(line: 951, column: 7, scope: !655, inlinedAt: !652)
!655 = distinct !DILexicalBlock(scope: !649, file: !3, line: 951, column: 7)
!656 = !DILocation(line: 982, column: 22, scope: !622, inlinedAt: !644)
!657 = !DILocation(line: 982, column: 7, scope: !617, inlinedAt: !644)
!658 = !DILocalVariable(name: "size", arg: 1, scope: !659, file: !3, line: 576, type: !42)
!659 = distinct !DISubprogram(name: "determine_seg_index", scope: !3, file: !3, line: 576, type: !660, scopeLine: 576, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !662)
!660 = !DISubroutineType(types: !661)
!661 = !{!42, !42}
!662 = !{!658}
!663 = !DILocation(line: 0, scope: !659, inlinedAt: !664)
!664 = distinct !DILocation(line: 988, column: 20, scope: !621, inlinedAt: !644)
!665 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !664)
!666 = distinct !DILexicalBlock(scope: !659, file: !3, line: 577, column: 7)
!667 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !664)
!668 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !664)
!669 = distinct !DILexicalBlock(scope: !666, file: !3, line: 578, column: 12)
!670 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !664)
!671 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !664)
!672 = distinct !DILexicalBlock(scope: !669, file: !3, line: 579, column: 12)
!673 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !664)
!674 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !664)
!675 = distinct !DILexicalBlock(scope: !672, file: !3, line: 580, column: 12)
!676 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !664)
!677 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !664)
!678 = distinct !DILexicalBlock(scope: !675, file: !3, line: 581, column: 12)
!679 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !664)
!680 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !664)
!681 = distinct !DILexicalBlock(scope: !678, file: !3, line: 582, column: 12)
!682 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !664)
!683 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !664)
!684 = distinct !DILexicalBlock(scope: !681, file: !3, line: 583, column: 12)
!685 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !664)
!686 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !664)
!687 = distinct !DILexicalBlock(scope: !684, file: !3, line: 584, column: 12)
!688 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !664)
!689 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !664)
!690 = distinct !DILexicalBlock(scope: !687, file: !3, line: 585, column: 12)
!691 = !DILocation(line: 0, scope: !690, inlinedAt: !664)
!692 = !DILocation(line: 991, column: 5, scope: !624, inlinedAt: !644)
!693 = !DILocation(line: 0, scope: !624, inlinedAt: !644)
!694 = !DILocation(line: 992, column: 38, scope: !626, inlinedAt: !644)
!695 = !DILocation(line: 0, scope: !626, inlinedAt: !644)
!696 = !DILocation(line: 0, scope: !629, inlinedAt: !644)
!697 = !DILocation(line: 994, column: 56, scope: !632, inlinedAt: !644)
!698 = !DILocation(line: 994, column: 7, scope: !629, inlinedAt: !644)
!699 = !DILocation(line: 995, column: 26, scope: !631, inlinedAt: !644)
!700 = !DILocation(line: 0, scope: !141, inlinedAt: !701)
!701 = distinct !DILocation(line: 995, column: 26, scope: !631, inlinedAt: !644)
!702 = !DILocation(line: 0, scope: !124, inlinedAt: !703)
!703 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !701)
!704 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !703)
!705 = !DILocation(line: 0, scope: !631, inlinedAt: !644)
!706 = !DILocation(line: 996, column: 21, scope: !635, inlinedAt: !644)
!707 = !DILocation(line: 0, scope: !632, inlinedAt: !644)
!708 = !DILocation(line: 996, column: 6, scope: !631, inlinedAt: !644)
!709 = !DILocation(line: 0, scope: !639, inlinedAt: !644)
!710 = !DILocation(line: 0, scope: !141, inlinedAt: !711)
!711 = distinct !DILocation(line: 1004, column: 28, scope: !641, inlinedAt: !644)
!712 = !DILocation(line: 0, scope: !124, inlinedAt: !713)
!713 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !711)
!714 = !DILocation(line: 0, scope: !641, inlinedAt: !644)
!715 = !DILocation(line: 0, scope: !634, inlinedAt: !644)
!716 = !DILocation(line: 1003, column: 4, scope: !639, inlinedAt: !644)
!717 = distinct !{!717, !716, !718, !185}
!718 = !DILocation(line: 1014, column: 4, scope: !639, inlinedAt: !644)
!719 = !DILocation(line: 1004, column: 28, scope: !641, inlinedAt: !644)
!720 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !713)
!721 = !DILocation(line: 1005, column: 24, scope: !722, inlinedAt: !644)
!722 = distinct !DILexicalBlock(scope: !641, file: !3, line: 1005, column: 10)
!723 = !DILocation(line: 1005, column: 37, scope: !722, inlinedAt: !644)
!724 = !DILocation(line: 1003, column: 95, scope: !642, inlinedAt: !644)
!725 = !DILocation(line: 1003, column: 55, scope: !642, inlinedAt: !644)
!726 = distinct !{!726, !716, !718, !185}
!727 = distinct !{!727, !716, !718, !185}
!728 = distinct !{!728, !716, !718, !185}
!729 = distinct !{!729, !716, !718, !185}
!730 = distinct !{!730, !716, !718, !185}
!731 = distinct !{!731, !716, !718, !185}
!732 = distinct !{!732, !716, !718, !185}
!733 = distinct !{!733, !716, !718, !185}
!734 = distinct !{!734, !716, !718, !185}
!735 = distinct !{!735, !716, !718, !185}
!736 = distinct !{!736, !716, !718, !185}
!737 = distinct !{!737, !716, !718, !185}
!738 = distinct !{!738, !716, !718, !185}
!739 = distinct !{!739, !716, !718, !185}
!740 = distinct !{!740, !716, !718, !185}
!741 = distinct !{!741, !716, !718, !185}
!742 = distinct !{!742, !716, !718, !185}
!743 = distinct !{!743, !716, !718, !185}
!744 = distinct !{!744, !716, !718, !185}
!745 = distinct !{!745, !698, !746, !185}
!746 = !DILocation(line: 1020, column: 7, scope: !629, inlinedAt: !644)
!747 = !DILocation(line: 991, column: 47, scope: !627, inlinedAt: !644)
!748 = !DILocation(line: 991, column: 30, scope: !627, inlinedAt: !644)
!749 = distinct !{!749, !692, !750, !185}
!750 = !DILocation(line: 1022, column: 5, scope: !624, inlinedAt: !644)
!751 = !DILocalVariable(name: "x", arg: 1, scope: !752, file: !3, line: 181, type: !42)
!752 = distinct !DISubprogram(name: "max", scope: !3, file: !3, line: 181, type: !608, scopeLine: 181, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !753)
!753 = !{!751, !754}
!754 = !DILocalVariable(name: "y", arg: 2, scope: !752, file: !3, line: 181, type: !42)
!755 = !DILocation(line: 0, scope: !752, inlinedAt: !756)
!756 = distinct !DILocation(line: 1442, column: 22, scope: !757)
!757 = distinct !DILexicalBlock(scope: !758, file: !3, line: 1440, column: 24)
!758 = distinct !DILexicalBlock(scope: !526, file: !3, line: 1440, column: 9)
!759 = !DILocation(line: 182, column: 15, scope: !752, inlinedAt: !756)
!760 = !DILocation(line: 182, column: 12, scope: !752, inlinedAt: !756)
!761 = !DILocation(line: 0, scope: !607, inlinedAt: !762)
!762 = distinct !DILocation(line: 873, column: 12, scope: !432, inlinedAt: !763)
!763 = distinct !DILocation(line: 1443, column: 17, scope: !757)
!764 = !DILocation(line: 0, scope: !432, inlinedAt: !763)
!765 = !DILocation(line: 874, column: 15, scope: !443, inlinedAt: !763)
!766 = !DILocation(line: 874, column: 41, scope: !443, inlinedAt: !763)
!767 = !DILocation(line: 874, column: 9, scope: !432, inlinedAt: !763)
!768 = !DILocation(line: 0, scope: !447, inlinedAt: !769)
!769 = distinct !DILocation(line: 880, column: 22, scope: !432, inlinedAt: !763)
!770 = !DILocation(line: 255, column: 35, scope: !447, inlinedAt: !769)
!771 = !DILocation(line: 255, column: 12, scope: !447, inlinedAt: !769)
!772 = !DILocation(line: 881, column: 37, scope: !432, inlinedAt: !763)
!773 = !DILocation(line: 0, scope: !457, inlinedAt: !774)
!774 = distinct !DILocation(line: 881, column: 5, scope: !432, inlinedAt: !763)
!775 = !DILocation(line: 0, scope: !469, inlinedAt: !774)
!776 = !DILocation(line: 0, scope: !416, inlinedAt: !777)
!777 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !774)
!778 = !DILocation(line: 0, scope: !416, inlinedAt: !779)
!779 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !774)
!780 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !779)
!781 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !774)
!782 = !DILocation(line: 0, scope: !484, inlinedAt: !783)
!783 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !774)
!784 = !DILocation(line: 0, scope: !141, inlinedAt: !785)
!785 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !783)
!786 = !DILocation(line: 0, scope: !124, inlinedAt: !787)
!787 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !785)
!788 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !783)
!789 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !783)
!790 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !783)
!791 = !DILocation(line: 0, scope: !466, inlinedAt: !774)
!792 = !DILocation(line: 0, scope: !416, inlinedAt: !793)
!793 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !774)
!794 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !774)
!795 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !796)
!796 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !774)
!797 = !DILocation(line: 0, scope: !172, inlinedAt: !796)
!798 = !DILocation(line: 0, scope: !141, inlinedAt: !799)
!799 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !796)
!800 = !DILocation(line: 0, scope: !124, inlinedAt: !801)
!801 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !799)
!802 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !801)
!803 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !796)
!804 = !DILocation(line: 0, scope: !468, inlinedAt: !774)
!805 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !774)
!806 = !DILocation(line: 0, scope: !207, inlinedAt: !807)
!807 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !774)
!808 = !DILocation(line: 0, scope: !214, inlinedAt: !809)
!809 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !807)
!810 = !DILocation(line: 0, scope: !141, inlinedAt: !811)
!811 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !774)
!812 = !DILocation(line: 0, scope: !124, inlinedAt: !813)
!813 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !811)
!814 = !DILocation(line: 0, scope: !416, inlinedAt: !815)
!815 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !774)
!816 = !DILocation(line: 0, scope: !416, inlinedAt: !817)
!817 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !774)
!818 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !774)
!819 = !DILocation(line: 0, scope: !500, inlinedAt: !774)
!820 = !DILocation(line: 0, scope: !172, inlinedAt: !821)
!821 = distinct !DILocation(line: 884, column: 27, scope: !432, inlinedAt: !763)
!822 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !821)
!823 = !DILocation(line: 0, scope: !141, inlinedAt: !824)
!824 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !821)
!825 = !DILocation(line: 0, scope: !124, inlinedAt: !826)
!826 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !824)
!827 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !826)
!828 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !821)
!829 = !DILocation(line: 0, scope: !141, inlinedAt: !830)
!830 = distinct !DILocation(line: 885, column: 32, scope: !432, inlinedAt: !763)
!831 = !DILocation(line: 0, scope: !124, inlinedAt: !832)
!832 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !830)
!833 = !DILocation(line: 885, column: 48, scope: !432, inlinedAt: !763)
!834 = !DILocation(line: 0, scope: !508, inlinedAt: !835)
!835 = distinct !DILocation(line: 885, column: 5, scope: !432, inlinedAt: !763)
!836 = !DILocation(line: 0, scope: !416, inlinedAt: !837)
!837 = distinct !DILocation(line: 396, column: 21, scope: !508, inlinedAt: !835)
!838 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !837)
!839 = !DILocation(line: 396, column: 12, scope: !508, inlinedAt: !835)
!840 = !DILocation(line: 396, column: 19, scope: !508, inlinedAt: !835)
!841 = !DILocation(line: 888, column: 13, scope: !432, inlinedAt: !763)
!842 = !DILocation(line: 1445, column: 19, scope: !843)
!843 = distinct !DILexicalBlock(scope: !757, file: !3, line: 1445, column: 13)
!844 = !DILocation(line: 1445, column: 13, scope: !757)
!845 = !DILocation(line: 1455, column: 25, scope: !526)
!846 = !DILocation(line: 0, scope: !141, inlinedAt: !847)
!847 = distinct !DILocation(line: 1455, column: 25, scope: !526)
!848 = !DILocation(line: 0, scope: !124, inlinedAt: !849)
!849 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !847)
!850 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !849)
!851 = !DILocation(line: 0, scope: !457, inlinedAt: !852)
!852 = distinct !DILocation(line: 1458, column: 5, scope: !526)
!853 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !852)
!854 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !852)
!855 = !DILocalVariable(name: "block", arg: 1, scope: !856, file: !3, line: 455, type: !13)
!856 = distinct !DISubprogram(name: "write_miniblock", scope: !3, file: !3, line: 455, type: !458, scopeLine: 456, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !857)
!857 = !{!855, !858, !859, !860, !861, !862, !863, !864}
!858 = !DILocalVariable(name: "size", arg: 2, scope: !856, file: !3, line: 455, type: !42)
!859 = !DILocalVariable(name: "alloc", arg: 3, scope: !856, file: !3, line: 456, type: !35)
!860 = !DILocalVariable(name: "prev_alloc", arg: 4, scope: !856, file: !3, line: 456, type: !35)
!861 = !DILocalVariable(name: "prev_mini", arg: 5, scope: !856, file: !3, line: 456, type: !35)
!862 = !DILocalVariable(name: "next_block", scope: !856, file: !3, line: 466, type: !13)
!863 = !DILocalVariable(name: "is_next_alloc", scope: !856, file: !3, line: 467, type: !35)
!864 = !DILocalVariable(name: "next_size", scope: !856, file: !3, line: 468, type: !42)
!865 = !DILocation(line: 0, scope: !856, inlinedAt: !866)
!866 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !852)
!867 = distinct !DILexicalBlock(scope: !469, file: !3, line: 500, column: 32)
!868 = !DILocation(line: 0, scope: !416, inlinedAt: !869)
!869 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !866)
!870 = distinct !DILexicalBlock(scope: !871, file: !3, line: 458, column: 13)
!871 = distinct !DILexicalBlock(scope: !856, file: !3, line: 458, column: 7)
!872 = !DILocation(line: 0, scope: !416, inlinedAt: !873)
!873 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !866)
!874 = distinct !DILexicalBlock(scope: !871, file: !3, line: 461, column: 7)
!875 = !DILocation(line: 0, scope: !871, inlinedAt: !866)
!876 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !866)
!877 = !DILocation(line: 0, scope: !172, inlinedAt: !878)
!878 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !866)
!879 = !DILocation(line: 0, scope: !141, inlinedAt: !880)
!880 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !878)
!881 = !DILocation(line: 0, scope: !124, inlinedAt: !882)
!882 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !880)
!883 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !878)
!884 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !866)
!885 = !DILocation(line: 0, scope: !207, inlinedAt: !886)
!886 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !866)
!887 = !DILocation(line: 0, scope: !214, inlinedAt: !888)
!888 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !886)
!889 = !DILocation(line: 0, scope: !141, inlinedAt: !890)
!890 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !866)
!891 = !DILocation(line: 0, scope: !124, inlinedAt: !892)
!892 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !890)
!893 = !DILocation(line: 0, scope: !894, inlinedAt: !866)
!894 = distinct !DILexicalBlock(scope: !856, file: !3, line: 471, column: 7)
!895 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !852)
!896 = !DILocation(line: 0, scope: !416, inlinedAt: !897)
!897 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !852)
!898 = !DILocation(line: 0, scope: !416, inlinedAt: !899)
!899 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !852)
!900 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !897)
!901 = !DILocation(line: 507, column: 16, scope: !478, inlinedAt: !852)
!902 = !DILocation(line: 0, scope: !172, inlinedAt: !903)
!903 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !852)
!904 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !903)
!905 = !DILocation(line: 0, scope: !141, inlinedAt: !906)
!906 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !903)
!907 = !DILocation(line: 0, scope: !124, inlinedAt: !908)
!908 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !906)
!909 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !903)
!910 = !DILocation(line: 0, scope: !468, inlinedAt: !852)
!911 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !852)
!912 = !DILocation(line: 0, scope: !207, inlinedAt: !913)
!913 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !852)
!914 = !DILocation(line: 0, scope: !214, inlinedAt: !915)
!915 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !913)
!916 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !915)
!917 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !915)
!918 = !DILocation(line: 0, scope: !141, inlinedAt: !919)
!919 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !852)
!920 = !DILocation(line: 0, scope: !124, inlinedAt: !921)
!921 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !919)
!922 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !921)
!923 = !DILocation(line: 0, scope: !416, inlinedAt: !924)
!924 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !852)
!925 = !DILocation(line: 0, scope: !416, inlinedAt: !926)
!926 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !852)
!927 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !852)
!928 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !926)
!929 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !852)
!930 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !852)
!931 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !924)
!932 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !852)
!933 = !DILocalVariable(name: "block", arg: 1, scope: !934, file: !3, line: 706, type: !13)
!934 = distinct !DISubprogram(name: "remove_from_free_list", scope: !3, file: !3, line: 706, type: !935, scopeLine: 706, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !937)
!935 = !DISubroutineType(types: !936)
!936 = !{null, !13}
!937 = !{!933, !938, !939, !942, !943}
!938 = !DILocalVariable(name: "size", scope: !934, file: !3, line: 710, type: !42)
!939 = !DILocalVariable(name: "index", scope: !940, file: !3, line: 720, type: !42)
!940 = distinct !DILexicalBlock(scope: !941, file: !3, line: 718, column: 7)
!941 = distinct !DILexicalBlock(scope: !934, file: !3, line: 713, column: 7)
!942 = !DILocalVariable(name: "next", scope: !940, file: !3, line: 723, type: !13)
!943 = !DILocalVariable(name: "prev", scope: !940, file: !3, line: 724, type: !13)
!944 = !DILocation(line: 0, scope: !934, inlinedAt: !945)
!945 = distinct !DILocation(line: 1461, column: 5, scope: !526)
!946 = !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !945)
!947 = !DILocation(line: 0, scope: !141, inlinedAt: !948)
!948 = distinct !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !945)
!949 = !DILocation(line: 0, scope: !124, inlinedAt: !950)
!950 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !948)
!951 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !950)
!952 = !DILocation(line: 713, column: 12, scope: !941, inlinedAt: !945)
!953 = !DILocation(line: 713, column: 7, scope: !934, inlinedAt: !945)
!954 = !DILocation(line: 0, scope: !955, inlinedAt: !960)
!955 = distinct !DISubprogram(name: "remove_from_mini_free_list", scope: !3, file: !3, line: 671, type: !935, scopeLine: 671, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !956)
!956 = !{!957, !958, !959}
!957 = !DILocalVariable(name: "block", arg: 1, scope: !955, file: !3, line: 671, type: !13)
!958 = !DILocalVariable(name: "current", scope: !955, file: !3, line: 674, type: !13)
!959 = !DILocalVariable(name: "prev", scope: !955, file: !3, line: 675, type: !13)
!960 = distinct !DILocation(line: 715, column: 5, scope: !961, inlinedAt: !945)
!961 = distinct !DILexicalBlock(scope: !941, file: !3, line: 713, column: 30)
!962 = !DILocation(line: 678, column: 18, scope: !955, inlinedAt: !960)
!963 = !DILocation(line: 678, column: 26, scope: !955, inlinedAt: !960)
!964 = !DILocation(line: 680, column: 24, scope: !965, inlinedAt: !960)
!965 = distinct !DILexicalBlock(scope: !955, file: !3, line: 678, column: 47)
!966 = !DILocation(line: 678, column: 3, scope: !955, inlinedAt: !960)
!967 = distinct !{!967, !966, !968, !185}
!968 = !DILocation(line: 681, column: 3, scope: !955, inlinedAt: !960)
!969 = !DILocation(line: 683, column: 15, scope: !970, inlinedAt: !960)
!970 = distinct !DILexicalBlock(scope: !955, file: !3, line: 683, column: 7)
!971 = !DILocation(line: 683, column: 7, scope: !955, inlinedAt: !960)
!972 = !DILocation(line: 688, column: 12, scope: !973, inlinedAt: !960)
!973 = distinct !DILexicalBlock(scope: !955, file: !3, line: 688, column: 7)
!974 = !DILocation(line: 0, scope: !973, inlinedAt: !960)
!975 = !DILocation(line: 688, column: 7, scope: !955, inlinedAt: !960)
!976 = !DILocation(line: 695, column: 1, scope: !955, inlinedAt: !960)
!977 = !DILocation(line: 0, scope: !659, inlinedAt: !978)
!978 = distinct !DILocation(line: 720, column: 22, scope: !940, inlinedAt: !945)
!979 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !978)
!980 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !978)
!981 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !978)
!982 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !978)
!983 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !978)
!984 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !978)
!985 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !978)
!986 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !978)
!987 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !978)
!988 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !978)
!989 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !978)
!990 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !978)
!991 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !978)
!992 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !978)
!993 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !978)
!994 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !978)
!995 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !978)
!996 = !DILocation(line: 0, scope: !690, inlinedAt: !978)
!997 = !DILocation(line: 0, scope: !666, inlinedAt: !978)
!998 = !DILocation(line: 0, scope: !940, inlinedAt: !945)
!999 = !DILocation(line: 723, column: 28, scope: !940, inlinedAt: !945)
!1000 = !DILocation(line: 724, column: 28, scope: !940, inlinedAt: !945)
!1001 = !DILocation(line: 726, column: 14, scope: !1002, inlinedAt: !945)
!1002 = distinct !DILexicalBlock(scope: !940, file: !3, line: 726, column: 9)
!1003 = !DILocation(line: 726, column: 9, scope: !940, inlinedAt: !945)
!1004 = !DILocation(line: 0, scope: !1002, inlinedAt: !945)
!1005 = !DILocation(line: 734, column: 14, scope: !1006, inlinedAt: !945)
!1006 = distinct !DILexicalBlock(scope: !940, file: !3, line: 734, column: 9)
!1007 = !DILocation(line: 734, column: 9, scope: !940, inlinedAt: !945)
!1008 = !DILocation(line: 735, column: 13, scope: !1009, inlinedAt: !945)
!1009 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 734, column: 22)
!1010 = !DILocation(line: 735, column: 23, scope: !1009, inlinedAt: !945)
!1011 = !DILocation(line: 736, column: 5, scope: !1009, inlinedAt: !945)
!1012 = !DILocation(line: 740, column: 22, scope: !940, inlinedAt: !945)
!1013 = !DILocalVariable(name: "block", arg: 1, scope: !1014, file: !3, line: 904, type: !13)
!1014 = distinct !DISubprogram(name: "split_block", scope: !3, file: !3, line: 904, type: !1015, scopeLine: 904, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1017)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{null, !13, !42}
!1017 = !{!1013, !1018, !1019, !1020, !1023}
!1018 = !DILocalVariable(name: "asize", arg: 2, scope: !1014, file: !3, line: 904, type: !42)
!1019 = !DILocalVariable(name: "block_size", scope: !1014, file: !3, line: 912, type: !42)
!1020 = !DILocalVariable(name: "block_next", scope: !1021, file: !3, line: 917, type: !13)
!1021 = distinct !DILexicalBlock(scope: !1022, file: !3, line: 913, column: 49)
!1022 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 913, column: 9)
!1023 = !DILocalVariable(name: "epilogue", scope: !1024, file: !3, line: 932, type: !13)
!1024 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 930, column: 38)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !3, line: 930, column: 11)
!1026 = !DILocation(line: 0, scope: !1014, inlinedAt: !1027)
!1027 = distinct !DILocation(line: 1465, column: 5, scope: !526)
!1028 = !DILocation(line: 912, column: 25, scope: !1014, inlinedAt: !1027)
!1029 = !DILocation(line: 0, scope: !141, inlinedAt: !1030)
!1030 = distinct !DILocation(line: 912, column: 25, scope: !1014, inlinedAt: !1027)
!1031 = !DILocation(line: 0, scope: !124, inlinedAt: !1032)
!1032 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1030)
!1033 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1032)
!1034 = !DILocation(line: 913, column: 21, scope: !1022, inlinedAt: !1027)
!1035 = !DILocation(line: 913, column: 30, scope: !1022, inlinedAt: !1027)
!1036 = !DILocation(line: 913, column: 9, scope: !1014, inlinedAt: !1027)
!1037 = !DILocation(line: 0, scope: !457, inlinedAt: !1038)
!1038 = distinct !DILocation(line: 918, column: 7, scope: !1021, inlinedAt: !1027)
!1039 = !DILocation(line: 0, scope: !469, inlinedAt: !1038)
!1040 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !1038)
!1041 = !DILocation(line: 0, scope: !856, inlinedAt: !1042)
!1042 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !1038)
!1043 = !DILocation(line: 0, scope: !416, inlinedAt: !1044)
!1044 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !1042)
!1045 = !DILocation(line: 0, scope: !416, inlinedAt: !1046)
!1046 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !1042)
!1047 = !DILocation(line: 0, scope: !871, inlinedAt: !1042)
!1048 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !1042)
!1049 = !DILocation(line: 0, scope: !172, inlinedAt: !1050)
!1050 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !1042)
!1051 = !DILocation(line: 0, scope: !141, inlinedAt: !1052)
!1052 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1050)
!1053 = !DILocation(line: 0, scope: !124, inlinedAt: !1054)
!1054 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1052)
!1055 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1050)
!1056 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1042)
!1057 = !DILocation(line: 0, scope: !207, inlinedAt: !1058)
!1058 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1042)
!1059 = !DILocation(line: 0, scope: !214, inlinedAt: !1060)
!1060 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1058)
!1061 = !DILocation(line: 0, scope: !141, inlinedAt: !1062)
!1062 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !1042)
!1063 = !DILocation(line: 0, scope: !124, inlinedAt: !1064)
!1064 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1062)
!1065 = !DILocation(line: 0, scope: !894, inlinedAt: !1042)
!1066 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !1038)
!1067 = !DILocation(line: 0, scope: !416, inlinedAt: !1068)
!1068 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !1038)
!1069 = !DILocation(line: 0, scope: !416, inlinedAt: !1070)
!1070 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !1038)
!1071 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !1068)
!1072 = !DILocation(line: 507, column: 16, scope: !478, inlinedAt: !1038)
!1073 = !DILocation(line: 0, scope: !172, inlinedAt: !1074)
!1074 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !1038)
!1075 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !1074)
!1076 = !DILocation(line: 0, scope: !141, inlinedAt: !1077)
!1077 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1074)
!1078 = !DILocation(line: 0, scope: !124, inlinedAt: !1079)
!1079 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1077)
!1080 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1074)
!1081 = !DILocation(line: 0, scope: !468, inlinedAt: !1038)
!1082 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1038)
!1083 = !DILocation(line: 0, scope: !207, inlinedAt: !1084)
!1084 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1038)
!1085 = !DILocation(line: 0, scope: !214, inlinedAt: !1086)
!1086 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1084)
!1087 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !1086)
!1088 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !1086)
!1089 = !DILocation(line: 0, scope: !141, inlinedAt: !1090)
!1090 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !1038)
!1091 = !DILocation(line: 0, scope: !124, inlinedAt: !1092)
!1092 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1090)
!1093 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1092)
!1094 = !DILocation(line: 0, scope: !416, inlinedAt: !1095)
!1095 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !1038)
!1096 = !DILocation(line: 0, scope: !416, inlinedAt: !1097)
!1097 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !1038)
!1098 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !1038)
!1099 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !1097)
!1100 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !1038)
!1101 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !1038)
!1102 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !1095)
!1103 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !1038)
!1104 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !1105)
!1105 = distinct !DILocation(line: 923, column: 20, scope: !1021, inlinedAt: !1027)
!1106 = !DILocation(line: 0, scope: !172, inlinedAt: !1105)
!1107 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1105)
!1108 = !DILocation(line: 0, scope: !141, inlinedAt: !1109)
!1109 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1105)
!1110 = !DILocation(line: 0, scope: !124, inlinedAt: !1111)
!1111 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1109)
!1112 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1111)
!1113 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1105)
!1114 = !DILocation(line: 0, scope: !1021, inlinedAt: !1027)
!1115 = !DILocation(line: 0, scope: !141, inlinedAt: !1116)
!1116 = distinct !DILocation(line: 924, column: 64, scope: !1021, inlinedAt: !1027)
!1117 = !DILocation(line: 0, scope: !124, inlinedAt: !1118)
!1118 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1116)
!1119 = !DILocation(line: 924, column: 80, scope: !1021, inlinedAt: !1027)
!1120 = !DILocation(line: 0, scope: !457, inlinedAt: !1121)
!1121 = distinct !DILocation(line: 924, column: 7, scope: !1021, inlinedAt: !1027)
!1122 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !1121)
!1123 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !1121)
!1124 = !DILocation(line: 0, scope: !856, inlinedAt: !1125)
!1125 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !1121)
!1126 = !DILocation(line: 0, scope: !416, inlinedAt: !1127)
!1127 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !1125)
!1128 = !DILocation(line: 0, scope: !416, inlinedAt: !1129)
!1129 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !1125)
!1130 = !DILocation(line: 0, scope: !871, inlinedAt: !1125)
!1131 = !DILocation(line: 459, column: 12, scope: !870, inlinedAt: !1125)
!1132 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !1125)
!1133 = !DILocation(line: 0, scope: !172, inlinedAt: !1134)
!1134 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !1125)
!1135 = !DILocation(line: 0, scope: !141, inlinedAt: !1136)
!1136 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1134)
!1137 = !DILocation(line: 0, scope: !124, inlinedAt: !1138)
!1138 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1136)
!1139 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1134)
!1140 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1125)
!1141 = !DILocation(line: 0, scope: !207, inlinedAt: !1142)
!1142 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1125)
!1143 = !DILocation(line: 0, scope: !214, inlinedAt: !1144)
!1144 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1142)
!1145 = !DILocation(line: 0, scope: !141, inlinedAt: !1146)
!1146 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !1125)
!1147 = !DILocation(line: 0, scope: !124, inlinedAt: !1148)
!1148 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1146)
!1149 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !1125)
!1150 = !DILocation(line: 0, scope: !894, inlinedAt: !1125)
!1151 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !1121)
!1152 = !DILocation(line: 0, scope: !416, inlinedAt: !1153)
!1153 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !1121)
!1154 = !DILocation(line: 0, scope: !416, inlinedAt: !1155)
!1155 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !1121)
!1156 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !1155)
!1157 = !DILocation(line: 510, column: 9, scope: !466, inlinedAt: !1121)
!1158 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !1121)
!1159 = !DILocation(line: 0, scope: !484, inlinedAt: !1160)
!1160 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !1121)
!1161 = !DILocation(line: 280, column: 30, scope: !484, inlinedAt: !1160)
!1162 = !DILocation(line: 0, scope: !141, inlinedAt: !1163)
!1163 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !1160)
!1164 = !DILocation(line: 0, scope: !124, inlinedAt: !1165)
!1165 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1163)
!1166 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !1160)
!1167 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !1160)
!1168 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !1160)
!1169 = !DILocation(line: 0, scope: !466, inlinedAt: !1121)
!1170 = !DILocation(line: 0, scope: !416, inlinedAt: !1171)
!1171 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !1121)
!1172 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !1121)
!1173 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1174)
!1174 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !1121)
!1175 = !DILocation(line: 0, scope: !172, inlinedAt: !1174)
!1176 = !DILocation(line: 0, scope: !141, inlinedAt: !1177)
!1177 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1174)
!1178 = !DILocation(line: 0, scope: !124, inlinedAt: !1179)
!1179 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1177)
!1180 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1179)
!1181 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1174)
!1182 = !DILocation(line: 0, scope: !468, inlinedAt: !1121)
!1183 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1121)
!1184 = !DILocation(line: 0, scope: !207, inlinedAt: !1185)
!1185 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1121)
!1186 = !DILocation(line: 0, scope: !214, inlinedAt: !1187)
!1187 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1185)
!1188 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !1187)
!1189 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !1187)
!1190 = !DILocation(line: 0, scope: !141, inlinedAt: !1191)
!1191 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !1121)
!1192 = !DILocation(line: 0, scope: !124, inlinedAt: !1193)
!1193 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1191)
!1194 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1193)
!1195 = !DILocation(line: 0, scope: !416, inlinedAt: !1196)
!1196 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !1121)
!1197 = !DILocation(line: 0, scope: !416, inlinedAt: !1198)
!1198 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !1121)
!1199 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !1121)
!1200 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !1198)
!1201 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !1121)
!1202 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !1121)
!1203 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !1121)
!1204 = !DILocation(line: 631, column: 17, scope: !1205, inlinedAt: !1212)
!1205 = distinct !DISubprogram(name: "add_to_free_list", scope: !3, file: !3, line: 625, type: !935, scopeLine: 625, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1206)
!1206 = !{!1207, !1208, !1209}
!1207 = !DILocalVariable(name: "block", arg: 1, scope: !1205, file: !3, line: 625, type: !13)
!1208 = !DILocalVariable(name: "size", scope: !1205, file: !3, line: 631, type: !42)
!1209 = !DILocalVariable(name: "index", scope: !1210, file: !3, line: 641, type: !42)
!1210 = distinct !DILexicalBlock(scope: !1211, file: !3, line: 639, column: 7)
!1211 = distinct !DILexicalBlock(scope: !1205, file: !3, line: 635, column: 7)
!1212 = distinct !DILocation(line: 928, column: 7, scope: !1021, inlinedAt: !1027)
!1213 = !DILocation(line: 0, scope: !1205, inlinedAt: !1212)
!1214 = !DILocation(line: 0, scope: !141, inlinedAt: !1215)
!1215 = distinct !DILocation(line: 631, column: 17, scope: !1205, inlinedAt: !1212)
!1216 = !DILocation(line: 0, scope: !124, inlinedAt: !1217)
!1217 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1215)
!1218 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1217)
!1219 = !DILocation(line: 635, column: 12, scope: !1211, inlinedAt: !1212)
!1220 = !DILocation(line: 635, column: 7, scope: !1205, inlinedAt: !1212)
!1221 = !DILocalVariable(name: "block", arg: 1, scope: !1222, file: !3, line: 601, type: !13)
!1222 = distinct !DISubprogram(name: "add_to_mini_free_list", scope: !3, file: !3, line: 601, type: !935, scopeLine: 601, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1223)
!1223 = !{!1221}
!1224 = !DILocation(line: 0, scope: !1222, inlinedAt: !1225)
!1225 = distinct !DILocation(line: 636, column: 5, scope: !1226, inlinedAt: !1212)
!1226 = distinct !DILexicalBlock(scope: !1211, file: !3, line: 635, column: 30)
!1227 = !DILocation(line: 604, column: 7, scope: !1228, inlinedAt: !1225)
!1228 = distinct !DILexicalBlock(scope: !1222, file: !3, line: 604, column: 7)
!1229 = !DILocation(line: 0, scope: !1228, inlinedAt: !1225)
!1230 = !DILocation(line: 606, column: 12, scope: !1231, inlinedAt: !1225)
!1231 = distinct !DILexicalBlock(scope: !1228, file: !3, line: 604, column: 31)
!1232 = !DILocation(line: 606, column: 22, scope: !1231, inlinedAt: !1225)
!1233 = !DILocation(line: 637, column: 3, scope: !1226, inlinedAt: !1212)
!1234 = !DILocation(line: 0, scope: !659, inlinedAt: !1235)
!1235 = distinct !DILocation(line: 641, column: 20, scope: !1210, inlinedAt: !1212)
!1236 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !1235)
!1237 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !1235)
!1238 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !1235)
!1239 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !1235)
!1240 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !1235)
!1241 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !1235)
!1242 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !1235)
!1243 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !1235)
!1244 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !1235)
!1245 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !1235)
!1246 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !1235)
!1247 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !1235)
!1248 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !1235)
!1249 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !1235)
!1250 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !1235)
!1251 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !1235)
!1252 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !1235)
!1253 = !DILocation(line: 0, scope: !690, inlinedAt: !1235)
!1254 = !DILocation(line: 0, scope: !666, inlinedAt: !1235)
!1255 = !DILocation(line: 0, scope: !1210, inlinedAt: !1212)
!1256 = !DILocation(line: 645, column: 9, scope: !1257, inlinedAt: !1212)
!1257 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 645, column: 9)
!1258 = !DILocation(line: 645, column: 29, scope: !1257, inlinedAt: !1212)
!1259 = !DILocation(line: 645, column: 9, scope: !1210, inlinedAt: !1212)
!1260 = !DILocation(line: 646, column: 27, scope: !1261, inlinedAt: !1212)
!1261 = distinct !DILexicalBlock(scope: !1257, file: !3, line: 645, column: 37)
!1262 = !DILocation(line: 648, column: 14, scope: !1261, inlinedAt: !1212)
!1263 = !DILocation(line: 648, column: 24, scope: !1261, inlinedAt: !1212)
!1264 = !DILocation(line: 649, column: 5, scope: !1261, inlinedAt: !1212)
!1265 = !DILocation(line: 652, column: 14, scope: !1266, inlinedAt: !1212)
!1266 = distinct !DILexicalBlock(scope: !1257, file: !3, line: 651, column: 9)
!1267 = !DILocation(line: 652, column: 24, scope: !1266, inlinedAt: !1212)
!1268 = !DILocation(line: 653, column: 7, scope: !1266, inlinedAt: !1212)
!1269 = !DILocation(line: 653, column: 28, scope: !1266, inlinedAt: !1212)
!1270 = !DILocation(line: 653, column: 38, scope: !1266, inlinedAt: !1212)
!1271 = !DILocation(line: 654, column: 14, scope: !1266, inlinedAt: !1212)
!1272 = !DILocation(line: 654, column: 24, scope: !1266, inlinedAt: !1212)
!1273 = !DILocation(line: 655, column: 27, scope: !1266, inlinedAt: !1212)
!1274 = !DILocation(line: 930, column: 11, scope: !1025, inlinedAt: !1027)
!1275 = !DILocation(line: 0, scope: !141, inlinedAt: !1276)
!1276 = distinct !DILocation(line: 930, column: 11, scope: !1025, inlinedAt: !1027)
!1277 = !DILocation(line: 0, scope: !124, inlinedAt: !1278)
!1278 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1276)
!1279 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1278)
!1280 = !DILocation(line: 930, column: 32, scope: !1025, inlinedAt: !1027)
!1281 = !DILocation(line: 930, column: 11, scope: !1021, inlinedAt: !1027)
!1282 = !DILocation(line: 932, column: 45, scope: !1024, inlinedAt: !1027)
!1283 = !DILocation(line: 0, scope: !1024, inlinedAt: !1027)
!1284 = !DILocation(line: 934, column: 7, scope: !1024, inlinedAt: !1027)
!1285 = !DILocalVariable(name: "block", arg: 1, scope: !1286, file: !3, line: 265, type: !13)
!1286 = distinct !DISubprogram(name: "header_to_payload", scope: !3, file: !3, line: 265, type: !1287, scopeLine: 265, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1289)
!1287 = !DISubroutineType(types: !1288)
!1288 = !{!12, !13}
!1289 = !{!1285}
!1290 = !DILocation(line: 0, scope: !1286, inlinedAt: !1291)
!1291 = distinct !DILocation(line: 1469, column: 10, scope: !526)
!1292 = !DILocation(line: 267, column: 28, scope: !1286, inlinedAt: !1291)
!1293 = !DILocation(line: 267, column: 20, scope: !1286, inlinedAt: !1291)
!1294 = !DILocation(line: 1472, column: 1, scope: !526)
!1295 = distinct !DISubprogram(name: "mm_free", scope: !3, file: !3, line: 1484, type: !1296, scopeLine: 1484, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1298)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{null, !12}
!1298 = !{!1299, !1300, !1301}
!1299 = !DILocalVariable(name: "bp", arg: 1, scope: !1295, file: !3, line: 1484, type: !12)
!1300 = !DILocalVariable(name: "block", scope: !1295, file: !3, line: 1491, type: !13)
!1301 = !DILocalVariable(name: "size", scope: !1295, file: !3, line: 1492, type: !42)
!1302 = !DILocation(line: 0, scope: !1295)
!1303 = !DILocation(line: 1487, column: 12, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1295, file: !3, line: 1487, column: 9)
!1305 = !DILocation(line: 1487, column: 9, scope: !1295)
!1306 = !DILocation(line: 0, scope: !447, inlinedAt: !1307)
!1307 = distinct !DILocation(line: 1491, column: 22, scope: !1295)
!1308 = !DILocation(line: 255, column: 35, scope: !447, inlinedAt: !1307)
!1309 = !DILocation(line: 255, column: 12, scope: !447, inlinedAt: !1307)
!1310 = !DILocation(line: 1492, column: 19, scope: !1295)
!1311 = !DILocation(line: 0, scope: !141, inlinedAt: !1312)
!1312 = distinct !DILocation(line: 1492, column: 19, scope: !1295)
!1313 = !DILocation(line: 0, scope: !124, inlinedAt: !1314)
!1314 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1312)
!1315 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1314)
!1316 = !DILocation(line: 0, scope: !457, inlinedAt: !1317)
!1317 = distinct !DILocation(line: 1502, column: 5, scope: !1295)
!1318 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !1317)
!1319 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !1317)
!1320 = !DILocation(line: 0, scope: !856, inlinedAt: !1321)
!1321 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !1317)
!1322 = !DILocation(line: 0, scope: !416, inlinedAt: !1323)
!1323 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !1321)
!1324 = !DILocation(line: 0, scope: !416, inlinedAt: !1325)
!1325 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !1321)
!1326 = !DILocation(line: 0, scope: !871, inlinedAt: !1321)
!1327 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !1321)
!1328 = !DILocation(line: 0, scope: !172, inlinedAt: !1329)
!1329 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !1321)
!1330 = !DILocation(line: 0, scope: !141, inlinedAt: !1331)
!1331 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1329)
!1332 = !DILocation(line: 0, scope: !124, inlinedAt: !1333)
!1333 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1331)
!1334 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1329)
!1335 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1321)
!1336 = !DILocation(line: 0, scope: !207, inlinedAt: !1337)
!1337 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1321)
!1338 = !DILocation(line: 0, scope: !214, inlinedAt: !1339)
!1339 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1337)
!1340 = !DILocation(line: 0, scope: !141, inlinedAt: !1341)
!1341 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !1321)
!1342 = !DILocation(line: 0, scope: !124, inlinedAt: !1343)
!1343 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1341)
!1344 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !1321)
!1345 = !DILocation(line: 0, scope: !894, inlinedAt: !1321)
!1346 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !1317)
!1347 = !DILocation(line: 0, scope: !416, inlinedAt: !1348)
!1348 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !1317)
!1349 = !DILocation(line: 0, scope: !416, inlinedAt: !1350)
!1350 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !1317)
!1351 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !1350)
!1352 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !1317)
!1353 = !DILocation(line: 0, scope: !484, inlinedAt: !1354)
!1354 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !1317)
!1355 = !DILocation(line: 0, scope: !141, inlinedAt: !1356)
!1356 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !1354)
!1357 = !DILocation(line: 0, scope: !124, inlinedAt: !1358)
!1358 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1356)
!1359 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !1354)
!1360 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !1354)
!1361 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !1354)
!1362 = !DILocation(line: 0, scope: !466, inlinedAt: !1317)
!1363 = !DILocation(line: 0, scope: !416, inlinedAt: !1364)
!1364 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !1317)
!1365 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !1317)
!1366 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1367)
!1367 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !1317)
!1368 = !DILocation(line: 0, scope: !172, inlinedAt: !1367)
!1369 = !DILocation(line: 0, scope: !141, inlinedAt: !1370)
!1370 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1367)
!1371 = !DILocation(line: 0, scope: !124, inlinedAt: !1372)
!1372 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1370)
!1373 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1372)
!1374 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1367)
!1375 = !DILocation(line: 0, scope: !468, inlinedAt: !1317)
!1376 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1317)
!1377 = !DILocation(line: 0, scope: !207, inlinedAt: !1378)
!1378 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1317)
!1379 = !DILocation(line: 0, scope: !214, inlinedAt: !1380)
!1380 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1378)
!1381 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !1380)
!1382 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !1380)
!1383 = !DILocation(line: 0, scope: !141, inlinedAt: !1384)
!1384 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !1317)
!1385 = !DILocation(line: 0, scope: !124, inlinedAt: !1386)
!1386 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1384)
!1387 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1386)
!1388 = !DILocation(line: 0, scope: !416, inlinedAt: !1389)
!1389 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !1317)
!1390 = !DILocation(line: 0, scope: !416, inlinedAt: !1391)
!1391 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !1317)
!1392 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !1317)
!1393 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !1391)
!1394 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !1317)
!1395 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !1317)
!1396 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !1317)
!1397 = !DILocation(line: 1505, column: 5, scope: !1295)
!1398 = !DILocation(line: 1508, column: 1, scope: !1295)
!1399 = distinct !DISubprogram(name: "coalesce_block", scope: !3, file: !3, line: 757, type: !97, scopeLine: 757, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1400)
!1400 = !{!1401, !1402, !1403, !1404, !1405, !1406, !1407, !1411, !1414, !1415, !1418}
!1401 = !DILocalVariable(name: "block", arg: 1, scope: !1399, file: !3, line: 757, type: !13)
!1402 = !DILocalVariable(name: "coalesced_block", scope: !1399, file: !3, line: 764, type: !13)
!1403 = !DILocalVariable(name: "next", scope: !1399, file: !3, line: 769, type: !13)
!1404 = !DILocalVariable(name: "next_free", scope: !1399, file: !3, line: 770, type: !35)
!1405 = !DILocalVariable(name: "prev_free", scope: !1399, file: !3, line: 771, type: !35)
!1406 = !DILocalVariable(name: "prev_mini", scope: !1399, file: !3, line: 773, type: !35)
!1407 = !DILocalVariable(name: "new_size", scope: !1408, file: !3, line: 788, type: !42)
!1408 = distinct !DILexicalBlock(scope: !1409, file: !3, line: 783, column: 36)
!1409 = distinct !DILexicalBlock(scope: !1410, file: !3, line: 783, column: 12)
!1410 = distinct !DILexicalBlock(scope: !1399, file: !3, line: 776, column: 7)
!1411 = !DILocalVariable(name: "prev", scope: !1412, file: !3, line: 798, type: !13)
!1412 = distinct !DILexicalBlock(scope: !1413, file: !3, line: 795, column: 36)
!1413 = distinct !DILexicalBlock(scope: !1409, file: !3, line: 795, column: 12)
!1414 = !DILocalVariable(name: "new_size", scope: !1412, file: !3, line: 815, type: !42)
!1415 = !DILocalVariable(name: "prev", scope: !1416, file: !3, line: 823, type: !13)
!1416 = distinct !DILexicalBlock(scope: !1417, file: !3, line: 820, column: 35)
!1417 = distinct !DILexicalBlock(scope: !1413, file: !3, line: 820, column: 12)
!1418 = !DILocalVariable(name: "new_size", scope: !1416, file: !3, line: 840, type: !42)
!1419 = !DILocation(line: 0, scope: !1399)
!1420 = !DILocation(line: 0, scope: !172, inlinedAt: !1421)
!1421 = distinct !DILocation(line: 769, column: 19, scope: !1399)
!1422 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !1421)
!1423 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1421)
!1424 = !DILocation(line: 0, scope: !141, inlinedAt: !1425)
!1425 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1421)
!1426 = !DILocation(line: 0, scope: !124, inlinedAt: !1427)
!1427 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1425)
!1428 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1427)
!1429 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1421)
!1430 = !DILocation(line: 414, column: 12, scope: !172, inlinedAt: !1421)
!1431 = !DILocation(line: 770, column: 21, scope: !1399)
!1432 = !DILocation(line: 0, scope: !207, inlinedAt: !1433)
!1433 = distinct !DILocation(line: 770, column: 21, scope: !1399)
!1434 = !DILocation(line: 0, scope: !214, inlinedAt: !1435)
!1435 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1433)
!1436 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !1435)
!1437 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !1435)
!1438 = !DILocalVariable(name: "block", arg: 1, scope: !1439, file: !3, line: 372, type: !13)
!1439 = distinct !DISubprogram(name: "get_prev_alloc", scope: !3, file: !3, line: 372, type: !208, scopeLine: 372, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1440)
!1440 = !{!1438}
!1441 = !DILocation(line: 0, scope: !1439, inlinedAt: !1442)
!1442 = distinct !DILocation(line: 771, column: 21, scope: !1399)
!1443 = !DILocalVariable(name: "word", arg: 1, scope: !1444, file: !3, line: 338, type: !6)
!1444 = distinct !DISubprogram(name: "extract_prev_alloc", scope: !3, file: !3, line: 338, type: !215, scopeLine: 338, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1445)
!1445 = !{!1443, !1446}
!1446 = !DILocalVariable(name: "masked", scope: !1444, file: !3, line: 339, type: !6)
!1447 = !DILocation(line: 0, scope: !1444, inlinedAt: !1448)
!1448 = distinct !DILocation(line: 373, column: 12, scope: !1439, inlinedAt: !1442)
!1449 = !DILocation(line: 340, column: 10, scope: !1444, inlinedAt: !1448)
!1450 = !DILocalVariable(name: "block", arg: 1, scope: !1451, file: !3, line: 381, type: !13)
!1451 = distinct !DISubprogram(name: "get_prev_mini", scope: !3, file: !3, line: 381, type: !208, scopeLine: 381, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1452)
!1452 = !{!1450}
!1453 = !DILocation(line: 0, scope: !1451, inlinedAt: !1454)
!1454 = distinct !DILocation(line: 773, column: 20, scope: !1399)
!1455 = !DILocalVariable(name: "word", arg: 1, scope: !1456, file: !3, line: 352, type: !6)
!1456 = distinct !DISubprogram(name: "extract_prev_mini", scope: !3, file: !3, line: 352, type: !215, scopeLine: 352, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1457)
!1457 = !{!1455, !1458}
!1458 = !DILocalVariable(name: "masked", scope: !1456, file: !3, line: 353, type: !6)
!1459 = !DILocation(line: 0, scope: !1456, inlinedAt: !1460)
!1460 = distinct !DILocation(line: 382, column: 12, scope: !1451, inlinedAt: !1454)
!1461 = !DILocation(line: 354, column: 10, scope: !1456, inlinedAt: !1460)
!1462 = !DILocation(line: 776, column: 18, scope: !1410)
!1463 = !DILocation(line: 783, column: 23, scope: !1409)
!1464 = !DILocation(line: 0, scope: !934, inlinedAt: !1465)
!1465 = distinct !DILocation(line: 785, column: 5, scope: !1408)
!1466 = !DILocation(line: 0, scope: !141, inlinedAt: !1467)
!1467 = distinct !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1465)
!1468 = !DILocation(line: 0, scope: !124, inlinedAt: !1469)
!1469 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1467)
!1470 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1469)
!1471 = !DILocation(line: 713, column: 12, scope: !941, inlinedAt: !1465)
!1472 = !DILocation(line: 713, column: 7, scope: !934, inlinedAt: !1465)
!1473 = !DILocation(line: 0, scope: !955, inlinedAt: !1474)
!1474 = distinct !DILocation(line: 715, column: 5, scope: !961, inlinedAt: !1465)
!1475 = !DILocation(line: 678, column: 18, scope: !955, inlinedAt: !1474)
!1476 = !DILocation(line: 678, column: 26, scope: !955, inlinedAt: !1474)
!1477 = !DILocation(line: 680, column: 24, scope: !965, inlinedAt: !1474)
!1478 = !DILocation(line: 678, column: 3, scope: !955, inlinedAt: !1474)
!1479 = distinct !{!1479, !1478, !1480, !185}
!1480 = !DILocation(line: 681, column: 3, scope: !955, inlinedAt: !1474)
!1481 = !DILocation(line: 683, column: 15, scope: !970, inlinedAt: !1474)
!1482 = !DILocation(line: 683, column: 7, scope: !955, inlinedAt: !1474)
!1483 = !DILocation(line: 688, column: 12, scope: !973, inlinedAt: !1474)
!1484 = !DILocation(line: 0, scope: !973, inlinedAt: !1474)
!1485 = !DILocation(line: 688, column: 7, scope: !955, inlinedAt: !1474)
!1486 = !DILocation(line: 695, column: 1, scope: !955, inlinedAt: !1474)
!1487 = !DILocation(line: 0, scope: !659, inlinedAt: !1488)
!1488 = distinct !DILocation(line: 720, column: 22, scope: !940, inlinedAt: !1465)
!1489 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !1488)
!1490 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !1488)
!1491 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !1488)
!1492 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !1488)
!1493 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !1488)
!1494 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !1488)
!1495 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !1488)
!1496 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !1488)
!1497 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !1488)
!1498 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !1488)
!1499 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !1488)
!1500 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !1488)
!1501 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !1488)
!1502 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !1488)
!1503 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !1488)
!1504 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !1488)
!1505 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !1488)
!1506 = !DILocation(line: 0, scope: !690, inlinedAt: !1488)
!1507 = !DILocation(line: 0, scope: !666, inlinedAt: !1488)
!1508 = !DILocation(line: 0, scope: !940, inlinedAt: !1465)
!1509 = !DILocation(line: 723, column: 28, scope: !940, inlinedAt: !1465)
!1510 = !DILocation(line: 724, column: 28, scope: !940, inlinedAt: !1465)
!1511 = !DILocation(line: 726, column: 14, scope: !1002, inlinedAt: !1465)
!1512 = !DILocation(line: 726, column: 9, scope: !940, inlinedAt: !1465)
!1513 = !DILocation(line: 0, scope: !1002, inlinedAt: !1465)
!1514 = !DILocation(line: 734, column: 14, scope: !1006, inlinedAt: !1465)
!1515 = !DILocation(line: 734, column: 9, scope: !940, inlinedAt: !1465)
!1516 = !DILocation(line: 735, column: 13, scope: !1009, inlinedAt: !1465)
!1517 = !DILocation(line: 735, column: 23, scope: !1009, inlinedAt: !1465)
!1518 = !DILocation(line: 736, column: 5, scope: !1009, inlinedAt: !1465)
!1519 = !DILocation(line: 740, column: 22, scope: !940, inlinedAt: !1465)
!1520 = !DILocation(line: 788, column: 23, scope: !1408)
!1521 = !DILocation(line: 0, scope: !141, inlinedAt: !1522)
!1522 = distinct !DILocation(line: 788, column: 23, scope: !1408)
!1523 = !DILocation(line: 0, scope: !124, inlinedAt: !1524)
!1524 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1522)
!1525 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1524)
!1526 = !DILocation(line: 788, column: 41, scope: !1408)
!1527 = !DILocation(line: 0, scope: !141, inlinedAt: !1528)
!1528 = distinct !DILocation(line: 788, column: 41, scope: !1408)
!1529 = !DILocation(line: 0, scope: !124, inlinedAt: !1530)
!1530 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1528)
!1531 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1530)
!1532 = !DILocation(line: 788, column: 39, scope: !1408)
!1533 = !DILocation(line: 0, scope: !1408)
!1534 = !DILocation(line: 0, scope: !457, inlinedAt: !1535)
!1535 = distinct !DILocation(line: 789, column: 5, scope: !1408)
!1536 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !1535)
!1537 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !1535)
!1538 = !DILocation(line: 0, scope: !856, inlinedAt: !1539)
!1539 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !1535)
!1540 = !DILocation(line: 0, scope: !416, inlinedAt: !1541)
!1541 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !1539)
!1542 = !DILocation(line: 0, scope: !416, inlinedAt: !1543)
!1543 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !1539)
!1544 = !DILocation(line: 0, scope: !871, inlinedAt: !1539)
!1545 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !1539)
!1546 = !DILocation(line: 0, scope: !172, inlinedAt: !1547)
!1547 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !1539)
!1548 = !DILocation(line: 0, scope: !141, inlinedAt: !1549)
!1549 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1547)
!1550 = !DILocation(line: 0, scope: !124, inlinedAt: !1551)
!1551 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1549)
!1552 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1547)
!1553 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1539)
!1554 = !DILocation(line: 0, scope: !207, inlinedAt: !1555)
!1555 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1539)
!1556 = !DILocation(line: 0, scope: !214, inlinedAt: !1557)
!1557 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1555)
!1558 = !DILocation(line: 0, scope: !141, inlinedAt: !1559)
!1559 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !1539)
!1560 = !DILocation(line: 0, scope: !124, inlinedAt: !1561)
!1561 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1559)
!1562 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !1539)
!1563 = !DILocation(line: 0, scope: !894, inlinedAt: !1539)
!1564 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !1535)
!1565 = !DILocation(line: 0, scope: !416, inlinedAt: !1566)
!1566 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !1535)
!1567 = !DILocation(line: 0, scope: !416, inlinedAt: !1568)
!1568 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !1535)
!1569 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !1568)
!1570 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !1535)
!1571 = !DILocation(line: 0, scope: !484, inlinedAt: !1572)
!1572 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !1535)
!1573 = !DILocation(line: 280, column: 30, scope: !484, inlinedAt: !1572)
!1574 = !DILocation(line: 280, column: 23, scope: !484, inlinedAt: !1572)
!1575 = !DILocation(line: 0, scope: !141, inlinedAt: !1576)
!1576 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !1572)
!1577 = !DILocation(line: 0, scope: !124, inlinedAt: !1578)
!1578 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1576)
!1579 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !1572)
!1580 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !1572)
!1581 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !1572)
!1582 = !DILocation(line: 0, scope: !466, inlinedAt: !1535)
!1583 = !DILocation(line: 0, scope: !416, inlinedAt: !1584)
!1584 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !1535)
!1585 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !1535)
!1586 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1587)
!1587 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !1535)
!1588 = !DILocation(line: 0, scope: !172, inlinedAt: !1587)
!1589 = !DILocation(line: 0, scope: !141, inlinedAt: !1590)
!1590 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1587)
!1591 = !DILocation(line: 0, scope: !124, inlinedAt: !1592)
!1592 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1590)
!1593 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1592)
!1594 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1587)
!1595 = !DILocation(line: 0, scope: !468, inlinedAt: !1535)
!1596 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1535)
!1597 = !DILocation(line: 0, scope: !207, inlinedAt: !1598)
!1598 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1535)
!1599 = !DILocation(line: 0, scope: !214, inlinedAt: !1600)
!1600 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1598)
!1601 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !1600)
!1602 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !1600)
!1603 = !DILocation(line: 0, scope: !141, inlinedAt: !1604)
!1604 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !1535)
!1605 = !DILocation(line: 0, scope: !124, inlinedAt: !1606)
!1606 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1604)
!1607 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1606)
!1608 = !DILocation(line: 0, scope: !416, inlinedAt: !1609)
!1609 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !1535)
!1610 = !DILocation(line: 0, scope: !416, inlinedAt: !1611)
!1611 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !1535)
!1612 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !1535)
!1613 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !1611)
!1614 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !1535)
!1615 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !1535)
!1616 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !1535)
!1617 = !DILocation(line: 795, column: 22, scope: !1413)
!1618 = !DILocation(line: 0, scope: !1412)
!1619 = !DILocation(line: 801, column: 9, scope: !1412)
!1620 = !DILocation(line: 802, column: 53, scope: !1621)
!1621 = distinct !DILexicalBlock(scope: !1622, file: !3, line: 801, column: 19)
!1622 = distinct !DILexicalBlock(scope: !1412, file: !3, line: 801, column: 9)
!1623 = !DILocation(line: 802, column: 14, scope: !1621)
!1624 = !DILocation(line: 803, column: 5, scope: !1621)
!1625 = !DILocation(line: 0, scope: !96, inlinedAt: !1626)
!1626 = distinct !DILocation(line: 806, column: 14, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1622, file: !3, line: 804, column: 9)
!1628 = !DILocation(line: 0, scope: !104, inlinedAt: !1629)
!1629 = distinct !DILocation(line: 444, column: 23, scope: !96, inlinedAt: !1626)
!1630 = !DILocation(line: 424, column: 29, scope: !104, inlinedAt: !1629)
!1631 = !DILocation(line: 0, scope: !113, inlinedAt: !1632)
!1632 = distinct !DILocation(line: 445, column: 12, scope: !96, inlinedAt: !1626)
!1633 = !DILocation(line: 296, column: 32, scope: !113, inlinedAt: !1632)
!1634 = !DILocation(line: 0, scope: !124, inlinedAt: !1635)
!1635 = distinct !DILocation(line: 296, column: 19, scope: !113, inlinedAt: !1632)
!1636 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1635)
!1637 = !DILocation(line: 297, column: 14, scope: !132, inlinedAt: !1632)
!1638 = !DILocation(line: 297, column: 9, scope: !113, inlinedAt: !1632)
!1639 = !DILocation(line: 0, scope: !1622)
!1640 = !DILocation(line: 0, scope: !934, inlinedAt: !1641)
!1641 = distinct !DILocation(line: 812, column: 5, scope: !1412)
!1642 = !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1641)
!1643 = !DILocation(line: 0, scope: !141, inlinedAt: !1644)
!1644 = distinct !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1641)
!1645 = !DILocation(line: 0, scope: !124, inlinedAt: !1646)
!1646 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1644)
!1647 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1646)
!1648 = !DILocation(line: 713, column: 12, scope: !941, inlinedAt: !1641)
!1649 = !DILocation(line: 713, column: 7, scope: !934, inlinedAt: !1641)
!1650 = !DILocation(line: 0, scope: !955, inlinedAt: !1651)
!1651 = distinct !DILocation(line: 715, column: 5, scope: !961, inlinedAt: !1641)
!1652 = !DILocation(line: 678, column: 18, scope: !955, inlinedAt: !1651)
!1653 = !DILocation(line: 678, column: 26, scope: !955, inlinedAt: !1651)
!1654 = !DILocation(line: 680, column: 24, scope: !965, inlinedAt: !1651)
!1655 = !DILocation(line: 678, column: 3, scope: !955, inlinedAt: !1651)
!1656 = distinct !{!1656, !1655, !1657, !185}
!1657 = !DILocation(line: 681, column: 3, scope: !955, inlinedAt: !1651)
!1658 = !DILocation(line: 683, column: 15, scope: !970, inlinedAt: !1651)
!1659 = !DILocation(line: 683, column: 7, scope: !955, inlinedAt: !1651)
!1660 = !DILocation(line: 688, column: 12, scope: !973, inlinedAt: !1651)
!1661 = !DILocation(line: 0, scope: !973, inlinedAt: !1651)
!1662 = !DILocation(line: 688, column: 7, scope: !955, inlinedAt: !1651)
!1663 = !DILocation(line: 695, column: 1, scope: !955, inlinedAt: !1651)
!1664 = !DILocation(line: 0, scope: !659, inlinedAt: !1665)
!1665 = distinct !DILocation(line: 720, column: 22, scope: !940, inlinedAt: !1641)
!1666 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !1665)
!1667 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !1665)
!1668 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !1665)
!1669 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !1665)
!1670 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !1665)
!1671 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !1665)
!1672 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !1665)
!1673 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !1665)
!1674 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !1665)
!1675 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !1665)
!1676 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !1665)
!1677 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !1665)
!1678 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !1665)
!1679 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !1665)
!1680 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !1665)
!1681 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !1665)
!1682 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !1665)
!1683 = !DILocation(line: 0, scope: !690, inlinedAt: !1665)
!1684 = !DILocation(line: 0, scope: !666, inlinedAt: !1665)
!1685 = !DILocation(line: 0, scope: !940, inlinedAt: !1641)
!1686 = !DILocation(line: 723, column: 28, scope: !940, inlinedAt: !1641)
!1687 = !DILocation(line: 724, column: 28, scope: !940, inlinedAt: !1641)
!1688 = !DILocation(line: 726, column: 14, scope: !1002, inlinedAt: !1641)
!1689 = !DILocation(line: 726, column: 9, scope: !940, inlinedAt: !1641)
!1690 = !DILocation(line: 0, scope: !1002, inlinedAt: !1641)
!1691 = !DILocation(line: 734, column: 14, scope: !1006, inlinedAt: !1641)
!1692 = !DILocation(line: 734, column: 9, scope: !940, inlinedAt: !1641)
!1693 = !DILocation(line: 735, column: 13, scope: !1009, inlinedAt: !1641)
!1694 = !DILocation(line: 735, column: 23, scope: !1009, inlinedAt: !1641)
!1695 = !DILocation(line: 736, column: 5, scope: !1009, inlinedAt: !1641)
!1696 = !DILocation(line: 740, column: 22, scope: !940, inlinedAt: !1641)
!1697 = !DILocation(line: 815, column: 23, scope: !1412)
!1698 = !DILocation(line: 0, scope: !141, inlinedAt: !1699)
!1699 = distinct !DILocation(line: 815, column: 23, scope: !1412)
!1700 = !DILocation(line: 0, scope: !124, inlinedAt: !1701)
!1701 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1699)
!1702 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1701)
!1703 = !DILocation(line: 815, column: 40, scope: !1412)
!1704 = !DILocation(line: 0, scope: !141, inlinedAt: !1705)
!1705 = distinct !DILocation(line: 815, column: 40, scope: !1412)
!1706 = !DILocation(line: 0, scope: !124, inlinedAt: !1707)
!1707 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1705)
!1708 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1707)
!1709 = !DILocation(line: 815, column: 38, scope: !1412)
!1710 = !DILocation(line: 0, scope: !1439, inlinedAt: !1711)
!1711 = distinct !DILocation(line: 816, column: 40, scope: !1412)
!1712 = !DILocation(line: 0, scope: !1444, inlinedAt: !1713)
!1713 = distinct !DILocation(line: 373, column: 12, scope: !1439, inlinedAt: !1711)
!1714 = !DILocation(line: 0, scope: !1451, inlinedAt: !1715)
!1715 = distinct !DILocation(line: 816, column: 62, scope: !1412)
!1716 = !DILocation(line: 0, scope: !1456, inlinedAt: !1717)
!1717 = distinct !DILocation(line: 382, column: 12, scope: !1451, inlinedAt: !1715)
!1718 = !DILocation(line: 0, scope: !457, inlinedAt: !1719)
!1719 = distinct !DILocation(line: 816, column: 5, scope: !1412)
!1720 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !1719)
!1721 = !DILocation(line: 0, scope: !469, inlinedAt: !1719)
!1722 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !1719)
!1723 = !DILocation(line: 0, scope: !856, inlinedAt: !1724)
!1724 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !1719)
!1725 = !DILocation(line: 0, scope: !416, inlinedAt: !1726)
!1726 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !1724)
!1727 = !DILocation(line: 0, scope: !416, inlinedAt: !1728)
!1728 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !1724)
!1729 = !DILocation(line: 0, scope: !871, inlinedAt: !1724)
!1730 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !1724)
!1731 = !DILocation(line: 0, scope: !172, inlinedAt: !1732)
!1732 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !1724)
!1733 = !DILocation(line: 0, scope: !141, inlinedAt: !1734)
!1734 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1732)
!1735 = !DILocation(line: 0, scope: !124, inlinedAt: !1736)
!1736 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1734)
!1737 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1732)
!1738 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1724)
!1739 = !DILocation(line: 0, scope: !207, inlinedAt: !1740)
!1740 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1724)
!1741 = !DILocation(line: 0, scope: !214, inlinedAt: !1742)
!1742 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1740)
!1743 = !DILocation(line: 0, scope: !141, inlinedAt: !1744)
!1744 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !1724)
!1745 = !DILocation(line: 0, scope: !124, inlinedAt: !1746)
!1746 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1744)
!1747 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !1724)
!1748 = !DILocation(line: 0, scope: !894, inlinedAt: !1724)
!1749 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !1719)
!1750 = !DILocation(line: 0, scope: !416, inlinedAt: !1751)
!1751 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !1719)
!1752 = !DILocation(line: 0, scope: !416, inlinedAt: !1753)
!1753 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !1719)
!1754 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !1753)
!1755 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !1719)
!1756 = !DILocation(line: 0, scope: !484, inlinedAt: !1757)
!1757 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !1719)
!1758 = !DILocation(line: 280, column: 30, scope: !484, inlinedAt: !1757)
!1759 = !DILocation(line: 280, column: 23, scope: !484, inlinedAt: !1757)
!1760 = !DILocation(line: 0, scope: !141, inlinedAt: !1761)
!1761 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !1757)
!1762 = !DILocation(line: 0, scope: !124, inlinedAt: !1763)
!1763 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1761)
!1764 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !1757)
!1765 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !1757)
!1766 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !1757)
!1767 = !DILocation(line: 0, scope: !466, inlinedAt: !1719)
!1768 = !DILocation(line: 0, scope: !416, inlinedAt: !1769)
!1769 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !1719)
!1770 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !1719)
!1771 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1772)
!1772 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !1719)
!1773 = !DILocation(line: 0, scope: !172, inlinedAt: !1772)
!1774 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !1772)
!1775 = !DILocation(line: 0, scope: !141, inlinedAt: !1776)
!1776 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1772)
!1777 = !DILocation(line: 0, scope: !124, inlinedAt: !1778)
!1778 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1776)
!1779 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1778)
!1780 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1772)
!1781 = !DILocation(line: 0, scope: !468, inlinedAt: !1719)
!1782 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1719)
!1783 = !DILocation(line: 0, scope: !207, inlinedAt: !1784)
!1784 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1719)
!1785 = !DILocation(line: 0, scope: !214, inlinedAt: !1786)
!1786 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1784)
!1787 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !1786)
!1788 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !1786)
!1789 = !DILocation(line: 0, scope: !141, inlinedAt: !1790)
!1790 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !1719)
!1791 = !DILocation(line: 0, scope: !124, inlinedAt: !1792)
!1792 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1790)
!1793 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1792)
!1794 = !DILocation(line: 0, scope: !416, inlinedAt: !1795)
!1795 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !1719)
!1796 = !DILocation(line: 0, scope: !416, inlinedAt: !1797)
!1797 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !1719)
!1798 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !1719)
!1799 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !1797)
!1800 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !1719)
!1801 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !1719)
!1802 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !1719)
!1803 = !DILocation(line: 820, column: 22, scope: !1417)
!1804 = !DILocation(line: 0, scope: !1416)
!1805 = !DILocation(line: 826, column: 9, scope: !1416)
!1806 = !DILocation(line: 827, column: 42, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1808, file: !3, line: 826, column: 19)
!1808 = distinct !DILexicalBlock(scope: !1416, file: !3, line: 826, column: 9)
!1809 = !DILocation(line: 827, column: 14, scope: !1807)
!1810 = !DILocation(line: 828, column: 5, scope: !1807)
!1811 = !DILocation(line: 0, scope: !96, inlinedAt: !1812)
!1812 = distinct !DILocation(line: 831, column: 14, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1808, file: !3, line: 829, column: 9)
!1814 = !DILocation(line: 0, scope: !104, inlinedAt: !1815)
!1815 = distinct !DILocation(line: 444, column: 23, scope: !96, inlinedAt: !1812)
!1816 = !DILocation(line: 424, column: 29, scope: !104, inlinedAt: !1815)
!1817 = !DILocation(line: 0, scope: !113, inlinedAt: !1818)
!1818 = distinct !DILocation(line: 445, column: 12, scope: !96, inlinedAt: !1812)
!1819 = !DILocation(line: 296, column: 32, scope: !113, inlinedAt: !1818)
!1820 = !DILocation(line: 0, scope: !124, inlinedAt: !1821)
!1821 = distinct !DILocation(line: 296, column: 19, scope: !113, inlinedAt: !1818)
!1822 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1821)
!1823 = !DILocation(line: 297, column: 14, scope: !132, inlinedAt: !1818)
!1824 = !DILocation(line: 297, column: 9, scope: !113, inlinedAt: !1818)
!1825 = !DILocation(line: 0, scope: !1808)
!1826 = !DILocation(line: 0, scope: !934, inlinedAt: !1827)
!1827 = distinct !DILocation(line: 836, column: 5, scope: !1416)
!1828 = !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1827)
!1829 = !DILocation(line: 0, scope: !141, inlinedAt: !1830)
!1830 = distinct !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1827)
!1831 = !DILocation(line: 0, scope: !124, inlinedAt: !1832)
!1832 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1830)
!1833 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1832)
!1834 = !DILocation(line: 713, column: 12, scope: !941, inlinedAt: !1827)
!1835 = !DILocation(line: 713, column: 7, scope: !934, inlinedAt: !1827)
!1836 = !DILocation(line: 0, scope: !955, inlinedAt: !1837)
!1837 = distinct !DILocation(line: 715, column: 5, scope: !961, inlinedAt: !1827)
!1838 = !DILocation(line: 678, column: 18, scope: !955, inlinedAt: !1837)
!1839 = !DILocation(line: 678, column: 26, scope: !955, inlinedAt: !1837)
!1840 = !DILocation(line: 680, column: 24, scope: !965, inlinedAt: !1837)
!1841 = !DILocation(line: 678, column: 3, scope: !955, inlinedAt: !1837)
!1842 = distinct !{!1842, !1841, !1843, !185}
!1843 = !DILocation(line: 681, column: 3, scope: !955, inlinedAt: !1837)
!1844 = !DILocation(line: 683, column: 15, scope: !970, inlinedAt: !1837)
!1845 = !DILocation(line: 683, column: 7, scope: !955, inlinedAt: !1837)
!1846 = !DILocation(line: 688, column: 12, scope: !973, inlinedAt: !1837)
!1847 = !DILocation(line: 0, scope: !973, inlinedAt: !1837)
!1848 = !DILocation(line: 688, column: 7, scope: !955, inlinedAt: !1837)
!1849 = !DILocation(line: 695, column: 1, scope: !955, inlinedAt: !1837)
!1850 = !DILocation(line: 0, scope: !659, inlinedAt: !1851)
!1851 = distinct !DILocation(line: 720, column: 22, scope: !940, inlinedAt: !1827)
!1852 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !1851)
!1853 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !1851)
!1854 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !1851)
!1855 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !1851)
!1856 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !1851)
!1857 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !1851)
!1858 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !1851)
!1859 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !1851)
!1860 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !1851)
!1861 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !1851)
!1862 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !1851)
!1863 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !1851)
!1864 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !1851)
!1865 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !1851)
!1866 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !1851)
!1867 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !1851)
!1868 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !1851)
!1869 = !DILocation(line: 0, scope: !690, inlinedAt: !1851)
!1870 = !DILocation(line: 0, scope: !666, inlinedAt: !1851)
!1871 = !DILocation(line: 0, scope: !940, inlinedAt: !1827)
!1872 = !DILocation(line: 723, column: 28, scope: !940, inlinedAt: !1827)
!1873 = !DILocation(line: 724, column: 28, scope: !940, inlinedAt: !1827)
!1874 = !DILocation(line: 726, column: 14, scope: !1002, inlinedAt: !1827)
!1875 = !DILocation(line: 726, column: 9, scope: !940, inlinedAt: !1827)
!1876 = !DILocation(line: 0, scope: !1002, inlinedAt: !1827)
!1877 = !DILocation(line: 734, column: 14, scope: !1006, inlinedAt: !1827)
!1878 = !DILocation(line: 734, column: 9, scope: !940, inlinedAt: !1827)
!1879 = !DILocation(line: 735, column: 13, scope: !1009, inlinedAt: !1827)
!1880 = !DILocation(line: 735, column: 23, scope: !1009, inlinedAt: !1827)
!1881 = !DILocation(line: 736, column: 5, scope: !1009, inlinedAt: !1827)
!1882 = !DILocation(line: 740, column: 22, scope: !940, inlinedAt: !1827)
!1883 = !DILocation(line: 0, scope: !934, inlinedAt: !1884)
!1884 = distinct !DILocation(line: 837, column: 5, scope: !1416)
!1885 = !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1884)
!1886 = !DILocation(line: 0, scope: !141, inlinedAt: !1887)
!1887 = distinct !DILocation(line: 710, column: 17, scope: !934, inlinedAt: !1884)
!1888 = !DILocation(line: 0, scope: !124, inlinedAt: !1889)
!1889 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1887)
!1890 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1889)
!1891 = !DILocation(line: 713, column: 12, scope: !941, inlinedAt: !1884)
!1892 = !DILocation(line: 713, column: 7, scope: !934, inlinedAt: !1884)
!1893 = !DILocation(line: 0, scope: !955, inlinedAt: !1894)
!1894 = distinct !DILocation(line: 715, column: 5, scope: !961, inlinedAt: !1884)
!1895 = !DILocation(line: 678, column: 18, scope: !955, inlinedAt: !1894)
!1896 = !DILocation(line: 678, column: 26, scope: !955, inlinedAt: !1894)
!1897 = !DILocation(line: 680, column: 24, scope: !965, inlinedAt: !1894)
!1898 = !DILocation(line: 678, column: 3, scope: !955, inlinedAt: !1894)
!1899 = distinct !{!1899, !1898, !1900, !185}
!1900 = !DILocation(line: 681, column: 3, scope: !955, inlinedAt: !1894)
!1901 = !DILocation(line: 683, column: 15, scope: !970, inlinedAt: !1894)
!1902 = !DILocation(line: 683, column: 7, scope: !955, inlinedAt: !1894)
!1903 = !DILocation(line: 688, column: 12, scope: !973, inlinedAt: !1894)
!1904 = !DILocation(line: 0, scope: !973, inlinedAt: !1894)
!1905 = !DILocation(line: 688, column: 7, scope: !955, inlinedAt: !1894)
!1906 = !DILocation(line: 695, column: 1, scope: !955, inlinedAt: !1894)
!1907 = !DILocation(line: 0, scope: !659, inlinedAt: !1908)
!1908 = distinct !DILocation(line: 720, column: 22, scope: !940, inlinedAt: !1884)
!1909 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !1908)
!1910 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !1908)
!1911 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !1908)
!1912 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !1908)
!1913 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !1908)
!1914 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !1908)
!1915 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !1908)
!1916 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !1908)
!1917 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !1908)
!1918 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !1908)
!1919 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !1908)
!1920 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !1908)
!1921 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !1908)
!1922 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !1908)
!1923 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !1908)
!1924 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !1908)
!1925 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !1908)
!1926 = !DILocation(line: 0, scope: !690, inlinedAt: !1908)
!1927 = !DILocation(line: 0, scope: !666, inlinedAt: !1908)
!1928 = !DILocation(line: 0, scope: !940, inlinedAt: !1884)
!1929 = !DILocation(line: 723, column: 28, scope: !940, inlinedAt: !1884)
!1930 = !DILocation(line: 724, column: 28, scope: !940, inlinedAt: !1884)
!1931 = !DILocation(line: 726, column: 14, scope: !1002, inlinedAt: !1884)
!1932 = !DILocation(line: 726, column: 9, scope: !940, inlinedAt: !1884)
!1933 = !DILocation(line: 0, scope: !1002, inlinedAt: !1884)
!1934 = !DILocation(line: 734, column: 14, scope: !1006, inlinedAt: !1884)
!1935 = !DILocation(line: 734, column: 9, scope: !940, inlinedAt: !1884)
!1936 = !DILocation(line: 735, column: 13, scope: !1009, inlinedAt: !1884)
!1937 = !DILocation(line: 735, column: 23, scope: !1009, inlinedAt: !1884)
!1938 = !DILocation(line: 736, column: 5, scope: !1009, inlinedAt: !1884)
!1939 = !DILocation(line: 740, column: 22, scope: !940, inlinedAt: !1884)
!1940 = !DILocation(line: 840, column: 23, scope: !1416)
!1941 = !DILocation(line: 0, scope: !141, inlinedAt: !1942)
!1942 = distinct !DILocation(line: 840, column: 23, scope: !1416)
!1943 = !DILocation(line: 0, scope: !124, inlinedAt: !1944)
!1944 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1942)
!1945 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1944)
!1946 = !DILocation(line: 840, column: 40, scope: !1416)
!1947 = !DILocation(line: 0, scope: !141, inlinedAt: !1948)
!1948 = distinct !DILocation(line: 840, column: 40, scope: !1416)
!1949 = !DILocation(line: 0, scope: !124, inlinedAt: !1950)
!1950 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1948)
!1951 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1950)
!1952 = !DILocation(line: 840, column: 38, scope: !1416)
!1953 = !DILocation(line: 840, column: 58, scope: !1416)
!1954 = !DILocation(line: 0, scope: !141, inlinedAt: !1955)
!1955 = distinct !DILocation(line: 840, column: 58, scope: !1416)
!1956 = !DILocation(line: 0, scope: !124, inlinedAt: !1957)
!1957 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1955)
!1958 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !1957)
!1959 = !DILocation(line: 840, column: 56, scope: !1416)
!1960 = !DILocation(line: 0, scope: !1439, inlinedAt: !1961)
!1961 = distinct !DILocation(line: 841, column: 40, scope: !1416)
!1962 = !DILocation(line: 0, scope: !1444, inlinedAt: !1963)
!1963 = distinct !DILocation(line: 373, column: 12, scope: !1439, inlinedAt: !1961)
!1964 = !DILocation(line: 0, scope: !1451, inlinedAt: !1965)
!1965 = distinct !DILocation(line: 841, column: 62, scope: !1416)
!1966 = !DILocation(line: 0, scope: !1456, inlinedAt: !1967)
!1967 = distinct !DILocation(line: 382, column: 12, scope: !1451, inlinedAt: !1965)
!1968 = !DILocation(line: 0, scope: !457, inlinedAt: !1969)
!1969 = distinct !DILocation(line: 841, column: 5, scope: !1416)
!1970 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !1969)
!1971 = !DILocation(line: 0, scope: !469, inlinedAt: !1969)
!1972 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !1969)
!1973 = !DILocation(line: 0, scope: !856, inlinedAt: !1974)
!1974 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !1969)
!1975 = !DILocation(line: 0, scope: !416, inlinedAt: !1976)
!1976 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !1974)
!1977 = !DILocation(line: 0, scope: !416, inlinedAt: !1978)
!1978 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !1974)
!1979 = !DILocation(line: 0, scope: !871, inlinedAt: !1974)
!1980 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !1974)
!1981 = !DILocation(line: 0, scope: !172, inlinedAt: !1982)
!1982 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !1974)
!1983 = !DILocation(line: 0, scope: !141, inlinedAt: !1984)
!1984 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !1982)
!1985 = !DILocation(line: 0, scope: !124, inlinedAt: !1986)
!1986 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1984)
!1987 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !1982)
!1988 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1974)
!1989 = !DILocation(line: 0, scope: !207, inlinedAt: !1990)
!1990 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !1974)
!1991 = !DILocation(line: 0, scope: !214, inlinedAt: !1992)
!1992 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !1990)
!1993 = !DILocation(line: 0, scope: !141, inlinedAt: !1994)
!1994 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !1974)
!1995 = !DILocation(line: 0, scope: !124, inlinedAt: !1996)
!1996 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !1994)
!1997 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !1974)
!1998 = !DILocation(line: 0, scope: !894, inlinedAt: !1974)
!1999 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !1969)
!2000 = !DILocation(line: 0, scope: !416, inlinedAt: !2001)
!2001 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !1969)
!2002 = !DILocation(line: 0, scope: !416, inlinedAt: !2003)
!2003 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !1969)
!2004 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !2003)
!2005 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !1969)
!2006 = !DILocation(line: 0, scope: !484, inlinedAt: !2007)
!2007 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !1969)
!2008 = !DILocation(line: 280, column: 30, scope: !484, inlinedAt: !2007)
!2009 = !DILocation(line: 280, column: 23, scope: !484, inlinedAt: !2007)
!2010 = !DILocation(line: 0, scope: !141, inlinedAt: !2011)
!2011 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !2007)
!2012 = !DILocation(line: 0, scope: !124, inlinedAt: !2013)
!2013 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2011)
!2014 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !2007)
!2015 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !2007)
!2016 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !2007)
!2017 = !DILocation(line: 0, scope: !466, inlinedAt: !1969)
!2018 = !DILocation(line: 0, scope: !416, inlinedAt: !2019)
!2019 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !1969)
!2020 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !1969)
!2021 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2022)
!2022 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !1969)
!2023 = !DILocation(line: 0, scope: !172, inlinedAt: !2022)
!2024 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !2022)
!2025 = !DILocation(line: 0, scope: !141, inlinedAt: !2026)
!2026 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2022)
!2027 = !DILocation(line: 0, scope: !124, inlinedAt: !2028)
!2028 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2026)
!2029 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2028)
!2030 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !2022)
!2031 = !DILocation(line: 0, scope: !468, inlinedAt: !1969)
!2032 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1969)
!2033 = !DILocation(line: 0, scope: !207, inlinedAt: !2034)
!2034 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !1969)
!2035 = !DILocation(line: 0, scope: !214, inlinedAt: !2036)
!2036 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !2034)
!2037 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !2036)
!2038 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !2036)
!2039 = !DILocation(line: 0, scope: !141, inlinedAt: !2040)
!2040 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !1969)
!2041 = !DILocation(line: 0, scope: !124, inlinedAt: !2042)
!2042 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2040)
!2043 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2042)
!2044 = !DILocation(line: 0, scope: !416, inlinedAt: !2045)
!2045 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !1969)
!2046 = !DILocation(line: 0, scope: !416, inlinedAt: !2047)
!2047 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !1969)
!2048 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !1969)
!2049 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !2047)
!2050 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !1969)
!2051 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !1969)
!2052 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !1969)
!2053 = !DILocation(line: 0, scope: !1205, inlinedAt: !2054)
!2054 = distinct !DILocation(line: 849, column: 3, scope: !1399)
!2055 = !DILocation(line: 631, column: 17, scope: !1205, inlinedAt: !2054)
!2056 = !DILocation(line: 0, scope: !141, inlinedAt: !2057)
!2057 = distinct !DILocation(line: 631, column: 17, scope: !1205, inlinedAt: !2054)
!2058 = !DILocation(line: 0, scope: !124, inlinedAt: !2059)
!2059 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2057)
!2060 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2059)
!2061 = !DILocation(line: 635, column: 12, scope: !1211, inlinedAt: !2054)
!2062 = !DILocation(line: 635, column: 7, scope: !1205, inlinedAt: !2054)
!2063 = !DILocation(line: 0, scope: !1222, inlinedAt: !2064)
!2064 = distinct !DILocation(line: 636, column: 5, scope: !1226, inlinedAt: !2054)
!2065 = !DILocation(line: 604, column: 7, scope: !1228, inlinedAt: !2064)
!2066 = !DILocation(line: 0, scope: !1228, inlinedAt: !2064)
!2067 = !DILocation(line: 606, column: 12, scope: !1231, inlinedAt: !2064)
!2068 = !DILocation(line: 606, column: 22, scope: !1231, inlinedAt: !2064)
!2069 = !DILocation(line: 637, column: 3, scope: !1226, inlinedAt: !2054)
!2070 = !DILocation(line: 0, scope: !659, inlinedAt: !2071)
!2071 = distinct !DILocation(line: 641, column: 20, scope: !1210, inlinedAt: !2054)
!2072 = !DILocation(line: 577, column: 12, scope: !666, inlinedAt: !2071)
!2073 = !DILocation(line: 577, column: 7, scope: !659, inlinedAt: !2071)
!2074 = !DILocation(line: 578, column: 17, scope: !669, inlinedAt: !2071)
!2075 = !DILocation(line: 578, column: 12, scope: !666, inlinedAt: !2071)
!2076 = !DILocation(line: 579, column: 17, scope: !672, inlinedAt: !2071)
!2077 = !DILocation(line: 579, column: 12, scope: !669, inlinedAt: !2071)
!2078 = !DILocation(line: 580, column: 17, scope: !675, inlinedAt: !2071)
!2079 = !DILocation(line: 580, column: 12, scope: !672, inlinedAt: !2071)
!2080 = !DILocation(line: 581, column: 17, scope: !678, inlinedAt: !2071)
!2081 = !DILocation(line: 581, column: 12, scope: !675, inlinedAt: !2071)
!2082 = !DILocation(line: 582, column: 17, scope: !681, inlinedAt: !2071)
!2083 = !DILocation(line: 582, column: 12, scope: !678, inlinedAt: !2071)
!2084 = !DILocation(line: 583, column: 17, scope: !684, inlinedAt: !2071)
!2085 = !DILocation(line: 583, column: 12, scope: !681, inlinedAt: !2071)
!2086 = !DILocation(line: 584, column: 17, scope: !687, inlinedAt: !2071)
!2087 = !DILocation(line: 584, column: 12, scope: !684, inlinedAt: !2071)
!2088 = !DILocation(line: 585, column: 17, scope: !690, inlinedAt: !2071)
!2089 = !DILocation(line: 0, scope: !690, inlinedAt: !2071)
!2090 = !DILocation(line: 0, scope: !666, inlinedAt: !2071)
!2091 = !DILocation(line: 0, scope: !1210, inlinedAt: !2054)
!2092 = !DILocation(line: 645, column: 9, scope: !1257, inlinedAt: !2054)
!2093 = !DILocation(line: 645, column: 29, scope: !1257, inlinedAt: !2054)
!2094 = !DILocation(line: 645, column: 9, scope: !1210, inlinedAt: !2054)
!2095 = !DILocation(line: 646, column: 27, scope: !1261, inlinedAt: !2054)
!2096 = !DILocation(line: 648, column: 14, scope: !1261, inlinedAt: !2054)
!2097 = !DILocation(line: 649, column: 5, scope: !1261, inlinedAt: !2054)
!2098 = !DILocation(line: 648, column: 24, scope: !1261, inlinedAt: !2054)
!2099 = !DILocation(line: 652, column: 14, scope: !1266, inlinedAt: !2054)
!2100 = !DILocation(line: 652, column: 24, scope: !1266, inlinedAt: !2054)
!2101 = !DILocation(line: 653, column: 7, scope: !1266, inlinedAt: !2054)
!2102 = !DILocation(line: 653, column: 28, scope: !1266, inlinedAt: !2054)
!2103 = !DILocation(line: 653, column: 38, scope: !1266, inlinedAt: !2054)
!2104 = !DILocation(line: 654, column: 14, scope: !1266, inlinedAt: !2054)
!2105 = !DILocation(line: 654, column: 24, scope: !1266, inlinedAt: !2054)
!2106 = !DILocation(line: 655, column: 27, scope: !1266, inlinedAt: !2054)
!2107 = !DILocation(line: 854, column: 3, scope: !1399)
!2108 = distinct !DISubprogram(name: "mm_realloc", scope: !3, file: !3, line: 1522, type: !2109, scopeLine: 1522, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2111)
!2109 = !DISubroutineType(types: !2110)
!2110 = !{!12, !12, !42}
!2111 = !{!2112, !2113, !2114, !2115, !2116}
!2112 = !DILocalVariable(name: "ptr", arg: 1, scope: !2108, file: !3, line: 1522, type: !12)
!2113 = !DILocalVariable(name: "size", arg: 2, scope: !2108, file: !3, line: 1522, type: !42)
!2114 = !DILocalVariable(name: "block", scope: !2108, file: !3, line: 1523, type: !13)
!2115 = !DILocalVariable(name: "copysize", scope: !2108, file: !3, line: 1524, type: !42)
!2116 = !DILocalVariable(name: "newptr", scope: !2108, file: !3, line: 1525, type: !12)
!2117 = !DILocation(line: 0, scope: !2108)
!2118 = !DILocation(line: 0, scope: !447, inlinedAt: !2119)
!2119 = distinct !DILocation(line: 1523, column: 22, scope: !2108)
!2120 = !DILocation(line: 255, column: 35, scope: !447, inlinedAt: !2119)
!2121 = !DILocation(line: 255, column: 12, scope: !447, inlinedAt: !2119)
!2122 = !DILocation(line: 1528, column: 14, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2108, file: !3, line: 1528, column: 9)
!2124 = !DILocation(line: 1528, column: 9, scope: !2108)
!2125 = !DILocation(line: 0, scope: !1295, inlinedAt: !2126)
!2126 = distinct !DILocation(line: 1529, column: 9, scope: !2127)
!2127 = distinct !DILexicalBlock(scope: !2123, file: !3, line: 1528, column: 20)
!2128 = !DILocation(line: 1487, column: 9, scope: !1295, inlinedAt: !2126)
!2129 = !DILocation(line: 0, scope: !447, inlinedAt: !2130)
!2130 = distinct !DILocation(line: 1491, column: 22, scope: !1295, inlinedAt: !2126)
!2131 = !DILocation(line: 1492, column: 19, scope: !1295, inlinedAt: !2126)
!2132 = !DILocation(line: 0, scope: !141, inlinedAt: !2133)
!2133 = distinct !DILocation(line: 1492, column: 19, scope: !1295, inlinedAt: !2126)
!2134 = !DILocation(line: 0, scope: !124, inlinedAt: !2135)
!2135 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2133)
!2136 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2135)
!2137 = !DILocation(line: 0, scope: !457, inlinedAt: !2138)
!2138 = distinct !DILocation(line: 1502, column: 5, scope: !1295, inlinedAt: !2126)
!2139 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !2138)
!2140 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !2138)
!2141 = !DILocation(line: 0, scope: !856, inlinedAt: !2142)
!2142 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !2138)
!2143 = !DILocation(line: 0, scope: !416, inlinedAt: !2144)
!2144 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !2142)
!2145 = !DILocation(line: 0, scope: !416, inlinedAt: !2146)
!2146 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !2142)
!2147 = !DILocation(line: 0, scope: !871, inlinedAt: !2142)
!2148 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !2142)
!2149 = !DILocation(line: 0, scope: !172, inlinedAt: !2150)
!2150 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !2142)
!2151 = !DILocation(line: 0, scope: !141, inlinedAt: !2152)
!2152 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2150)
!2153 = !DILocation(line: 0, scope: !124, inlinedAt: !2154)
!2154 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2152)
!2155 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !2150)
!2156 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !2142)
!2157 = !DILocation(line: 0, scope: !207, inlinedAt: !2158)
!2158 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !2142)
!2159 = !DILocation(line: 0, scope: !214, inlinedAt: !2160)
!2160 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !2158)
!2161 = !DILocation(line: 0, scope: !141, inlinedAt: !2162)
!2162 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !2142)
!2163 = !DILocation(line: 0, scope: !124, inlinedAt: !2164)
!2164 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2162)
!2165 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !2142)
!2166 = !DILocation(line: 0, scope: !894, inlinedAt: !2142)
!2167 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !2138)
!2168 = !DILocation(line: 0, scope: !416, inlinedAt: !2169)
!2169 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !2138)
!2170 = !DILocation(line: 0, scope: !416, inlinedAt: !2171)
!2171 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !2138)
!2172 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !2171)
!2173 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !2138)
!2174 = !DILocation(line: 0, scope: !484, inlinedAt: !2175)
!2175 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !2138)
!2176 = !DILocation(line: 0, scope: !141, inlinedAt: !2177)
!2177 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !2175)
!2178 = !DILocation(line: 0, scope: !124, inlinedAt: !2179)
!2179 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2177)
!2180 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !2175)
!2181 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !2175)
!2182 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !2175)
!2183 = !DILocation(line: 0, scope: !466, inlinedAt: !2138)
!2184 = !DILocation(line: 0, scope: !416, inlinedAt: !2185)
!2185 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !2138)
!2186 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !2138)
!2187 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2188)
!2188 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !2138)
!2189 = !DILocation(line: 0, scope: !172, inlinedAt: !2188)
!2190 = !DILocation(line: 0, scope: !141, inlinedAt: !2191)
!2191 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2188)
!2192 = !DILocation(line: 0, scope: !124, inlinedAt: !2193)
!2193 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2191)
!2194 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2193)
!2195 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !2188)
!2196 = !DILocation(line: 0, scope: !468, inlinedAt: !2138)
!2197 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !2138)
!2198 = !DILocation(line: 0, scope: !207, inlinedAt: !2199)
!2199 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !2138)
!2200 = !DILocation(line: 0, scope: !214, inlinedAt: !2201)
!2201 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !2199)
!2202 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !2201)
!2203 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !2201)
!2204 = !DILocation(line: 0, scope: !141, inlinedAt: !2205)
!2205 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !2138)
!2206 = !DILocation(line: 0, scope: !124, inlinedAt: !2207)
!2207 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2205)
!2208 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2207)
!2209 = !DILocation(line: 0, scope: !416, inlinedAt: !2210)
!2210 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !2138)
!2211 = !DILocation(line: 0, scope: !416, inlinedAt: !2212)
!2212 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !2138)
!2213 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !2138)
!2214 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !2212)
!2215 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !2138)
!2216 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !2138)
!2217 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !2138)
!2218 = !DILocation(line: 1534, column: 9, scope: !2108)
!2219 = !DILocation(line: 1542, column: 16, scope: !2220)
!2220 = distinct !DILexicalBlock(scope: !2108, file: !3, line: 1542, column: 9)
!2221 = !DILocation(line: 1542, column: 9, scope: !2108)
!2222 = !DILocation(line: 1547, column: 16, scope: !2108)
!2223 = !DILocalVariable(name: "block", arg: 1, scope: !2224, file: !3, line: 312, type: !13)
!2224 = distinct !DISubprogram(name: "get_payload_size", scope: !3, file: !3, line: 312, type: !142, scopeLine: 312, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2225)
!2225 = !{!2223, !2226}
!2226 = !DILocalVariable(name: "asize", scope: !2224, file: !3, line: 313, type: !42)
!2227 = !DILocation(line: 0, scope: !2224, inlinedAt: !2228)
!2228 = distinct !DILocation(line: 1547, column: 16, scope: !2108)
!2229 = !DILocation(line: 0, scope: !141, inlinedAt: !2230)
!2230 = distinct !DILocation(line: 313, column: 20, scope: !2224, inlinedAt: !2228)
!2231 = !DILocation(line: 0, scope: !124, inlinedAt: !2232)
!2232 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2230)
!2233 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2232)
!2234 = !DILocation(line: 315, column: 18, scope: !2224, inlinedAt: !2228)
!2235 = !DILocation(line: 1548, column: 14, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2108, file: !3, line: 1548, column: 9)
!2237 = !DILocation(line: 1548, column: 9, scope: !2108)
!2238 = !DILocation(line: 1551, column: 5, scope: !2108)
!2239 = !DILocation(line: 0, scope: !1295, inlinedAt: !2240)
!2240 = distinct !DILocation(line: 1554, column: 5, scope: !2108)
!2241 = !DILocation(line: 0, scope: !447, inlinedAt: !2242)
!2242 = distinct !DILocation(line: 1491, column: 22, scope: !1295, inlinedAt: !2240)
!2243 = !DILocation(line: 1492, column: 19, scope: !1295, inlinedAt: !2240)
!2244 = !DILocation(line: 0, scope: !141, inlinedAt: !2245)
!2245 = distinct !DILocation(line: 1492, column: 19, scope: !1295, inlinedAt: !2240)
!2246 = !DILocation(line: 0, scope: !124, inlinedAt: !2247)
!2247 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2245)
!2248 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2247)
!2249 = !DILocation(line: 0, scope: !457, inlinedAt: !2250)
!2250 = distinct !DILocation(line: 1502, column: 5, scope: !1295, inlinedAt: !2240)
!2251 = !DILocation(line: 500, column: 14, scope: !469, inlinedAt: !2250)
!2252 = !DILocation(line: 500, column: 9, scope: !457, inlinedAt: !2250)
!2253 = !DILocation(line: 0, scope: !856, inlinedAt: !2254)
!2254 = distinct !DILocation(line: 501, column: 7, scope: !867, inlinedAt: !2250)
!2255 = !DILocation(line: 0, scope: !416, inlinedAt: !2256)
!2256 = distinct !DILocation(line: 459, column: 21, scope: !870, inlinedAt: !2254)
!2257 = !DILocation(line: 0, scope: !416, inlinedAt: !2258)
!2258 = distinct !DILocation(line: 462, column: 21, scope: !874, inlinedAt: !2254)
!2259 = !DILocation(line: 0, scope: !871, inlinedAt: !2254)
!2260 = !DILocation(line: 459, column: 19, scope: !870, inlinedAt: !2254)
!2261 = !DILocation(line: 0, scope: !172, inlinedAt: !2262)
!2262 = distinct !DILocation(line: 466, column: 25, scope: !856, inlinedAt: !2254)
!2263 = !DILocation(line: 0, scope: !141, inlinedAt: !2264)
!2264 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2262)
!2265 = !DILocation(line: 0, scope: !124, inlinedAt: !2266)
!2266 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2264)
!2267 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !2262)
!2268 = !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !2254)
!2269 = !DILocation(line: 0, scope: !207, inlinedAt: !2270)
!2270 = distinct !DILocation(line: 467, column: 24, scope: !856, inlinedAt: !2254)
!2271 = !DILocation(line: 0, scope: !214, inlinedAt: !2272)
!2272 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !2270)
!2273 = !DILocation(line: 0, scope: !141, inlinedAt: !2274)
!2274 = distinct !DILocation(line: 468, column: 22, scope: !856, inlinedAt: !2254)
!2275 = !DILocation(line: 0, scope: !124, inlinedAt: !2276)
!2276 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2274)
!2277 = !DILocation(line: 471, column: 7, scope: !856, inlinedAt: !2254)
!2278 = !DILocation(line: 0, scope: !894, inlinedAt: !2254)
!2279 = !DILocation(line: 502, column: 5, scope: !867, inlinedAt: !2250)
!2280 = !DILocation(line: 0, scope: !416, inlinedAt: !2281)
!2281 = distinct !DILocation(line: 507, column: 18, scope: !478, inlinedAt: !2250)
!2282 = !DILocation(line: 0, scope: !416, inlinedAt: !2283)
!2283 = distinct !DILocation(line: 510, column: 18, scope: !466, inlinedAt: !2250)
!2284 = !DILocation(line: 219, column: 9, scope: !416, inlinedAt: !2283)
!2285 = !DILocation(line: 510, column: 16, scope: !466, inlinedAt: !2250)
!2286 = !DILocation(line: 0, scope: !484, inlinedAt: !2287)
!2287 = distinct !DILocation(line: 511, column: 20, scope: !466, inlinedAt: !2250)
!2288 = !DILocation(line: 0, scope: !141, inlinedAt: !2289)
!2289 = distinct !DILocation(line: 280, column: 40, scope: !484, inlinedAt: !2287)
!2290 = !DILocation(line: 0, scope: !124, inlinedAt: !2291)
!2291 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2289)
!2292 = !DILocation(line: 280, column: 38, scope: !484, inlinedAt: !2287)
!2293 = !DILocation(line: 280, column: 56, scope: !484, inlinedAt: !2287)
!2294 = !DILocation(line: 280, column: 12, scope: !484, inlinedAt: !2287)
!2295 = !DILocation(line: 0, scope: !466, inlinedAt: !2250)
!2296 = !DILocation(line: 0, scope: !416, inlinedAt: !2297)
!2297 = distinct !DILocation(line: 512, column: 13, scope: !466, inlinedAt: !2250)
!2298 = !DILocation(line: 512, column: 11, scope: !466, inlinedAt: !2250)
!2299 = !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2300)
!2300 = distinct !DILocation(line: 517, column: 29, scope: !468, inlinedAt: !2250)
!2301 = !DILocation(line: 0, scope: !172, inlinedAt: !2300)
!2302 = !DILocation(line: 0, scope: !141, inlinedAt: !2303)
!2303 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2300)
!2304 = !DILocation(line: 0, scope: !124, inlinedAt: !2305)
!2305 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2303)
!2306 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2305)
!2307 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !2300)
!2308 = !DILocation(line: 0, scope: !468, inlinedAt: !2250)
!2309 = !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !2250)
!2310 = !DILocation(line: 0, scope: !207, inlinedAt: !2311)
!2311 = distinct !DILocation(line: 518, column: 28, scope: !468, inlinedAt: !2250)
!2312 = !DILocation(line: 0, scope: !214, inlinedAt: !2313)
!2313 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !2311)
!2314 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !2313)
!2315 = !DILocation(line: 327, column: 12, scope: !214, inlinedAt: !2313)
!2316 = !DILocation(line: 0, scope: !141, inlinedAt: !2317)
!2317 = distinct !DILocation(line: 519, column: 26, scope: !468, inlinedAt: !2250)
!2318 = !DILocation(line: 0, scope: !124, inlinedAt: !2319)
!2319 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2317)
!2320 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2319)
!2321 = !DILocation(line: 0, scope: !416, inlinedAt: !2322)
!2322 = distinct !DILocation(line: 526, column: 23, scope: !499, inlinedAt: !2250)
!2323 = !DILocation(line: 0, scope: !416, inlinedAt: !2324)
!2324 = distinct !DILocation(line: 523, column: 23, scope: !503, inlinedAt: !2250)
!2325 = !DILocation(line: 522, column: 11, scope: !468, inlinedAt: !2250)
!2326 = !DILocation(line: 214, column: 9, scope: !416, inlinedAt: !2324)
!2327 = !DILocation(line: 523, column: 21, scope: !503, inlinedAt: !2250)
!2328 = !DILocation(line: 524, column: 7, scope: !503, inlinedAt: !2250)
!2329 = !DILocation(line: 526, column: 21, scope: !499, inlinedAt: !2250)
!2330 = !DILocation(line: 1557, column: 1, scope: !2108)
!2331 = !DISubprogram(name: "mem_memcpy", scope: !522, file: !522, line: 113, type: !2332, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !525)
!2332 = !DISubroutineType(types: !2333)
!2333 = !{!12, !12, !2334, !42}
!2334 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2335, size: 64)
!2335 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!2336 = distinct !DISubprogram(name: "mm_calloc", scope: !3, file: !3, line: 1571, type: !2337, scopeLine: 1571, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2339)
!2337 = !DISubroutineType(types: !2338)
!2338 = !{!12, !42, !42}
!2339 = !{!2340, !2341, !2342, !2343}
!2340 = !DILocalVariable(name: "elements", arg: 1, scope: !2336, file: !3, line: 1571, type: !42)
!2341 = !DILocalVariable(name: "size", arg: 2, scope: !2336, file: !3, line: 1571, type: !42)
!2342 = !DILocalVariable(name: "bp", scope: !2336, file: !3, line: 1572, type: !12)
!2343 = !DILocalVariable(name: "asize", scope: !2336, file: !3, line: 1573, type: !42)
!2344 = !DILocation(line: 0, scope: !2336)
!2345 = !DILocation(line: 1573, column: 29, scope: !2336)
!2346 = !DILocation(line: 1575, column: 18, scope: !2347)
!2347 = distinct !DILexicalBlock(scope: !2336, file: !3, line: 1575, column: 9)
!2348 = !DILocation(line: 1575, column: 9, scope: !2336)
!2349 = !DILocation(line: 1578, column: 9, scope: !2336)
!2350 = !DILocation(line: 1583, column: 10, scope: !2336)
!2351 = !DILocation(line: 1584, column: 12, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2336, file: !3, line: 1584, column: 9)
!2353 = !DILocation(line: 1584, column: 9, scope: !2336)
!2354 = !DILocation(line: 1589, column: 5, scope: !2336)
!2355 = !DILocation(line: 1591, column: 5, scope: !2336)
!2356 = !DILocation(line: 1592, column: 1, scope: !2336)
!2357 = !DISubprogram(name: "mem_memset", scope: !522, file: !522, line: 122, type: !2358, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !525)
!2358 = !DISubroutineType(types: !2359)
!2359 = !{!12, !12, !76, !42}
!2360 = !DISubprogram(name: "mem_heap_lo", scope: !522, file: !522, line: 48, type: !2361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !525)
!2361 = !DISubroutineType(types: !2362)
!2362 = !{!12}
!2363 = !DISubprogram(name: "mem_heap_hi", scope: !522, file: !522, line: 58, type: !2361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !525)
!2364 = distinct !DISubprogram(name: "list_match_heap", scope: !3, file: !3, line: 1182, type: !83, scopeLine: 1182, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2365)
!2365 = !{!2366, !2367, !2371, !2374, !2375, !2377, !2380}
!2366 = !DILocalVariable(name: "heap_count", scope: !2364, file: !3, line: 1184, type: !42)
!2367 = !DILocalVariable(name: "block", scope: !2368, file: !3, line: 1190, type: !13)
!2368 = distinct !DILexicalBlock(scope: !2369, file: !3, line: 1190, column: 5)
!2369 = distinct !DILexicalBlock(scope: !2370, file: !3, line: 1189, column: 7)
!2370 = distinct !DILexicalBlock(scope: !2364, file: !3, line: 1188, column: 7)
!2371 = !DILocalVariable(name: "is_free", scope: !2372, file: !3, line: 1191, type: !35)
!2372 = distinct !DILexicalBlock(scope: !2373, file: !3, line: 1190, column: 86)
!2373 = distinct !DILexicalBlock(scope: !2368, file: !3, line: 1190, column: 5)
!2374 = !DILocalVariable(name: "list_count", scope: !2364, file: !3, line: 1198, type: !42)
!2375 = !DILocalVariable(name: "i", scope: !2376, file: !3, line: 1201, type: !42)
!2376 = distinct !DILexicalBlock(scope: !2364, file: !3, line: 1201, column: 3)
!2377 = !DILocalVariable(name: "seg_free_list_start", scope: !2378, file: !3, line: 1202, type: !13)
!2378 = distinct !DILexicalBlock(scope: !2379, file: !3, line: 1201, column: 44)
!2379 = distinct !DILexicalBlock(scope: !2376, file: !3, line: 1201, column: 3)
!2380 = !DILocalVariable(name: "A", scope: !2381, file: !3, line: 1204, type: !13)
!2381 = distinct !DILexicalBlock(scope: !2378, file: !3, line: 1204, column: 5)
!2382 = !DILocation(line: 0, scope: !2364)
!2383 = !DILocation(line: 1188, column: 7, scope: !2370)
!2384 = !DILocation(line: 1188, column: 18, scope: !2370)
!2385 = !DILocation(line: 1188, column: 7, scope: !2364)
!2386 = !DILocation(line: 0, scope: !2368)
!2387 = !DILocation(line: 1190, column: 39, scope: !2373)
!2388 = !DILocation(line: 0, scope: !141, inlinedAt: !2389)
!2389 = distinct !DILocation(line: 1190, column: 39, scope: !2373)
!2390 = !DILocation(line: 0, scope: !124, inlinedAt: !2391)
!2391 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2389)
!2392 = !DILocation(line: 236, column: 18, scope: !124, inlinedAt: !2391)
!2393 = !DILocation(line: 1190, column: 55, scope: !2373)
!2394 = !DILocation(line: 1190, column: 5, scope: !2368)
!2395 = !DILocation(line: 0, scope: !207, inlinedAt: !2396)
!2396 = distinct !DILocation(line: 1191, column: 23, scope: !2372)
!2397 = !DILocation(line: 0, scope: !214, inlinedAt: !2398)
!2398 = distinct !DILocation(line: 364, column: 12, scope: !207, inlinedAt: !2396)
!2399 = !DILocation(line: 327, column: 24, scope: !214, inlinedAt: !2398)
!2400 = !DILocation(line: 0, scope: !2372)
!2401 = !DILocation(line: 1192, column: 11, scope: !2372)
!2402 = !DILocation(line: 0, scope: !172, inlinedAt: !2403)
!2403 = distinct !DILocation(line: 1190, column: 68, scope: !2373)
!2404 = !DILocation(line: 414, column: 24, scope: !172, inlinedAt: !2403)
!2405 = !DILocation(line: 0, scope: !141, inlinedAt: !2406)
!2406 = distinct !DILocation(line: 414, column: 40, scope: !172, inlinedAt: !2403)
!2407 = !DILocation(line: 0, scope: !124, inlinedAt: !2408)
!2408 = distinct !DILocation(line: 245, column: 12, scope: !141, inlinedAt: !2406)
!2409 = !DILocation(line: 414, column: 38, scope: !172, inlinedAt: !2403)
!2410 = !DILocation(line: 414, column: 12, scope: !172, inlinedAt: !2403)
!2411 = distinct !{!2411, !2394, !2412, !185}
!2412 = !DILocation(line: 1193, column: 5, scope: !2368)
!2413 = !DILocation(line: 0, scope: !2376)
!2414 = !DILocation(line: 0, scope: !2378)
!2415 = !DILocation(line: 0, scope: !2381)
!2416 = !DILocation(line: 1204, column: 46, scope: !2417)
!2417 = distinct !DILexicalBlock(scope: !2381, file: !3, line: 1204, column: 5)
!2418 = !DILocation(line: 1204, column: 5, scope: !2381)
!2419 = !DILocation(line: 1205, column: 17, scope: !2420)
!2420 = distinct !DILexicalBlock(scope: !2417, file: !3, line: 1204, column: 72)
!2421 = !DILocation(line: 1204, column: 62, scope: !2417)
!2422 = distinct !{!2422, !2418, !2423, !185}
!2423 = !DILocation(line: 1206, column: 5, scope: !2381)
!2424 = !DILocation(line: 1217, column: 21, scope: !2364)
!2425 = !DILocation(line: 1217, column: 3, scope: !2364)
