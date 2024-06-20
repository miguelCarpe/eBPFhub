; ModuleID = 'xdp-dispatcher.c'
source_filename = "xdp-dispatcher.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.xdp_dispatcher_config = type { i8, i8, i8, i8, [10 x i32], [10 x i32], [10 x i32] }

@conf = internal constant %struct.xdp_dispatcher_config zeroinitializer, align 4, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !15
@dispatcher_version = dso_local global ptr null, section "xdp_metadata", align 8, !dbg !21
@llvm.compiler.used = appending global [4 x ptr] [ptr @_license, ptr @dispatcher_version, ptr @xdp_dispatcher, ptr @xdp_pass], section "llvm.metadata"

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog0(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !52 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !65, metadata !DIExpression()), !dbg !68
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !69
  call void @llvm.dbg.declare(metadata ptr %2, metadata !66, metadata !DIExpression()), !dbg !70
  store volatile i32 31, ptr %2, align 4, !dbg !70, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !75
  br i1 %3, label %6, label %4, !dbg !77

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !78, !tbaa !71
  br label %6, !dbg !79

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !68
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !80
  ret i32 %7, !dbg !80
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog1(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !81 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %2, metadata !84, metadata !DIExpression()), !dbg !87
  store volatile i32 31, ptr %2, align 4, !dbg !87, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !88
  br i1 %3, label %6, label %4, !dbg !90

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !91, !tbaa !71
  br label %6, !dbg !92

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !85
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !93
  ret i32 %7, !dbg !93
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog2(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !94 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !96, metadata !DIExpression()), !dbg !98
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !99
  call void @llvm.dbg.declare(metadata ptr %2, metadata !97, metadata !DIExpression()), !dbg !100
  store volatile i32 31, ptr %2, align 4, !dbg !100, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !101
  br i1 %3, label %6, label %4, !dbg !103

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !104, !tbaa !71
  br label %6, !dbg !105

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !98
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !106
  ret i32 %7, !dbg !106
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog3(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !107 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !112
  call void @llvm.dbg.declare(metadata ptr %2, metadata !110, metadata !DIExpression()), !dbg !113
  store volatile i32 31, ptr %2, align 4, !dbg !113, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !114
  br i1 %3, label %6, label %4, !dbg !116

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !117, !tbaa !71
  br label %6, !dbg !118

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !111
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !119
  ret i32 %7, !dbg !119
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog4(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !120 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !125
  call void @llvm.dbg.declare(metadata ptr %2, metadata !123, metadata !DIExpression()), !dbg !126
  store volatile i32 31, ptr %2, align 4, !dbg !126, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !127
  br i1 %3, label %6, label %4, !dbg !129

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !130, !tbaa !71
  br label %6, !dbg !131

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !124
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !132
  ret i32 %7, !dbg !132
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog5(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !133 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !138
  call void @llvm.dbg.declare(metadata ptr %2, metadata !136, metadata !DIExpression()), !dbg !139
  store volatile i32 31, ptr %2, align 4, !dbg !139, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !140
  br i1 %3, label %6, label %4, !dbg !142

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !143, !tbaa !71
  br label %6, !dbg !144

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !137
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !145
  ret i32 %7, !dbg !145
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog6(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !146 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !151
  call void @llvm.dbg.declare(metadata ptr %2, metadata !149, metadata !DIExpression()), !dbg !152
  store volatile i32 31, ptr %2, align 4, !dbg !152, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !153
  br i1 %3, label %6, label %4, !dbg !155

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !156, !tbaa !71
  br label %6, !dbg !157

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !150
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !158
  ret i32 %7, !dbg !158
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog7(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !159 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !164
  call void @llvm.dbg.declare(metadata ptr %2, metadata !162, metadata !DIExpression()), !dbg !165
  store volatile i32 31, ptr %2, align 4, !dbg !165, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !166
  br i1 %3, label %6, label %4, !dbg !168

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !169, !tbaa !71
  br label %6, !dbg !170

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !163
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !171
  ret i32 %7, !dbg !171
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog8(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !172 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !174, metadata !DIExpression()), !dbg !176
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !177
  call void @llvm.dbg.declare(metadata ptr %2, metadata !175, metadata !DIExpression()), !dbg !178
  store volatile i32 31, ptr %2, align 4, !dbg !178, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !179
  br i1 %3, label %6, label %4, !dbg !181

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !182, !tbaa !71
  br label %6, !dbg !183

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !176
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !184
  ret i32 %7, !dbg !184
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @prog9(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !185 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !187, metadata !DIExpression()), !dbg !189
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !190
  call void @llvm.dbg.declare(metadata ptr %2, metadata !188, metadata !DIExpression()), !dbg !191
  store volatile i32 31, ptr %2, align 4, !dbg !191, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !192
  br i1 %3, label %6, label %4, !dbg !194

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !195, !tbaa !71
  br label %6, !dbg !196

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !189
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !197
  ret i32 %7, !dbg !197
}

; Function Attrs: nofree noinline nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @compat_test(ptr noundef readnone %0) local_unnamed_addr #0 !dbg !198 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !203
  call void @llvm.dbg.declare(metadata ptr %2, metadata !201, metadata !DIExpression()), !dbg !204
  store volatile i32 31, ptr %2, align 4, !dbg !204, !tbaa !71
  %3 = icmp eq ptr %0, null, !dbg !205
  br i1 %3, label %6, label %4, !dbg !207

4:                                                ; preds = %1
  %5 = load volatile i32, ptr %2, align 4, !dbg !208, !tbaa !71
  br label %6, !dbg !209

6:                                                ; preds = %1, %4
  %7 = phi i32 [ %5, %4 ], [ 0, %1 ], !dbg !202
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !210
  ret i32 %7, !dbg !210
}

; Function Attrs: nofree nounwind memory(inaccessiblemem: readwrite)
define dso_local i32 @xdp_dispatcher(ptr noundef %0) #3 section "xdp" !dbg !211 {
  call void @llvm.dbg.value(metadata ptr %0, metadata !213, metadata !DIExpression()), !dbg !217
  %2 = load volatile i8, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 2), align 2, !dbg !218, !tbaa !219
  call void @llvm.dbg.value(metadata i8 %2, metadata !214, metadata !DIExpression()), !dbg !217
  %3 = icmp eq i8 %2, 0, !dbg !221
  br i1 %3, label %86, label %4, !dbg !223

4:                                                ; preds = %1
  %5 = tail call i32 @prog0(ptr noundef %0), !dbg !224
  call void @llvm.dbg.value(metadata i32 %5, metadata !215, metadata !DIExpression()), !dbg !217
  %6 = shl nuw i32 1, %5, !dbg !225
  %7 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4), align 4, !dbg !227, !tbaa !71
  %8 = and i32 %6, %7, !dbg !228
  %9 = icmp eq i32 %8, 0, !dbg !228
  br i1 %9, label %86, label %10, !dbg !229

10:                                               ; preds = %4
  %11 = icmp ult i8 %2, 2, !dbg !230
  br i1 %11, label %86, label %12, !dbg !232

12:                                               ; preds = %10
  %13 = tail call i32 @prog1(ptr noundef %0), !dbg !233
  call void @llvm.dbg.value(metadata i32 %13, metadata !215, metadata !DIExpression()), !dbg !217
  %14 = shl nuw i32 1, %13, !dbg !234
  %15 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 1), align 4, !dbg !236, !tbaa !71
  %16 = and i32 %14, %15, !dbg !237
  %17 = icmp eq i32 %16, 0, !dbg !237
  br i1 %17, label %86, label %18, !dbg !238

18:                                               ; preds = %12
  %19 = icmp ult i8 %2, 3, !dbg !239
  br i1 %19, label %86, label %20, !dbg !241

20:                                               ; preds = %18
  %21 = tail call i32 @prog2(ptr noundef %0), !dbg !242
  call void @llvm.dbg.value(metadata i32 %21, metadata !215, metadata !DIExpression()), !dbg !217
  %22 = shl nuw i32 1, %21, !dbg !243
  %23 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 2), align 4, !dbg !245, !tbaa !71
  %24 = and i32 %22, %23, !dbg !246
  %25 = icmp eq i32 %24, 0, !dbg !246
  br i1 %25, label %86, label %26, !dbg !247

26:                                               ; preds = %20
  %27 = icmp ult i8 %2, 4, !dbg !248
  br i1 %27, label %86, label %28, !dbg !250

28:                                               ; preds = %26
  %29 = tail call i32 @prog3(ptr noundef %0), !dbg !251
  call void @llvm.dbg.value(metadata i32 %29, metadata !215, metadata !DIExpression()), !dbg !217
  %30 = shl nuw i32 1, %29, !dbg !252
  %31 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 3), align 4, !dbg !254, !tbaa !71
  %32 = and i32 %30, %31, !dbg !255
  %33 = icmp eq i32 %32, 0, !dbg !255
  br i1 %33, label %86, label %34, !dbg !256

34:                                               ; preds = %28
  %35 = icmp ult i8 %2, 5, !dbg !257
  br i1 %35, label %86, label %36, !dbg !259

36:                                               ; preds = %34
  %37 = tail call i32 @prog4(ptr noundef %0), !dbg !260
  call void @llvm.dbg.value(metadata i32 %37, metadata !215, metadata !DIExpression()), !dbg !217
  %38 = shl nuw i32 1, %37, !dbg !261
  %39 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 4), align 4, !dbg !263, !tbaa !71
  %40 = and i32 %38, %39, !dbg !264
  %41 = icmp eq i32 %40, 0, !dbg !264
  br i1 %41, label %86, label %42, !dbg !265

42:                                               ; preds = %36
  %43 = icmp ult i8 %2, 6, !dbg !266
  br i1 %43, label %86, label %44, !dbg !268

44:                                               ; preds = %42
  %45 = tail call i32 @prog5(ptr noundef %0), !dbg !269
  call void @llvm.dbg.value(metadata i32 %45, metadata !215, metadata !DIExpression()), !dbg !217
  %46 = shl nuw i32 1, %45, !dbg !270
  %47 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 5), align 4, !dbg !272, !tbaa !71
  %48 = and i32 %46, %47, !dbg !273
  %49 = icmp eq i32 %48, 0, !dbg !273
  br i1 %49, label %86, label %50, !dbg !274

50:                                               ; preds = %44
  %51 = icmp ult i8 %2, 7, !dbg !275
  br i1 %51, label %86, label %52, !dbg !277

52:                                               ; preds = %50
  %53 = tail call i32 @prog6(ptr noundef %0), !dbg !278
  call void @llvm.dbg.value(metadata i32 %53, metadata !215, metadata !DIExpression()), !dbg !217
  %54 = shl nuw i32 1, %53, !dbg !279
  %55 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 6), align 4, !dbg !281, !tbaa !71
  %56 = and i32 %54, %55, !dbg !282
  %57 = icmp eq i32 %56, 0, !dbg !282
  br i1 %57, label %86, label %58, !dbg !283

58:                                               ; preds = %52
  %59 = icmp ult i8 %2, 8, !dbg !284
  br i1 %59, label %86, label %60, !dbg !286

60:                                               ; preds = %58
  %61 = tail call i32 @prog7(ptr noundef %0), !dbg !287
  call void @llvm.dbg.value(metadata i32 %61, metadata !215, metadata !DIExpression()), !dbg !217
  %62 = shl nuw i32 1, %61, !dbg !288
  %63 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 7), align 4, !dbg !290, !tbaa !71
  %64 = and i32 %62, %63, !dbg !291
  %65 = icmp eq i32 %64, 0, !dbg !291
  br i1 %65, label %86, label %66, !dbg !292

66:                                               ; preds = %60
  %67 = icmp ult i8 %2, 9, !dbg !293
  br i1 %67, label %86, label %68, !dbg !295

68:                                               ; preds = %66
  %69 = tail call i32 @prog8(ptr noundef %0), !dbg !296
  call void @llvm.dbg.value(metadata i32 %69, metadata !215, metadata !DIExpression()), !dbg !217
  %70 = shl nuw i32 1, %69, !dbg !297
  %71 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 8), align 4, !dbg !299, !tbaa !71
  %72 = and i32 %70, %71, !dbg !300
  %73 = icmp eq i32 %72, 0, !dbg !300
  br i1 %73, label %86, label %74, !dbg !301

74:                                               ; preds = %68
  %75 = icmp ult i8 %2, 10, !dbg !302
  br i1 %75, label %86, label %76, !dbg !304

76:                                               ; preds = %74
  %77 = tail call i32 @prog9(ptr noundef %0), !dbg !305
  call void @llvm.dbg.value(metadata i32 %77, metadata !215, metadata !DIExpression()), !dbg !217
  %78 = shl nuw i32 1, %77, !dbg !306
  %79 = load volatile i32, ptr getelementptr inbounds (%struct.xdp_dispatcher_config, ptr @conf, i64 0, i32 4, i64 9), align 4, !dbg !308, !tbaa !71
  %80 = and i32 %78, %79, !dbg !309
  %81 = icmp eq i32 %80, 0, !dbg !309
  br i1 %81, label %86, label %82, !dbg !310

82:                                               ; preds = %76
  %83 = icmp ult i8 %2, 11, !dbg !311
  br i1 %83, label %86, label %84, !dbg !313

84:                                               ; preds = %82
  %85 = tail call i32 @compat_test(ptr noundef %0), !dbg !314
  call void @llvm.dbg.value(metadata i32 %85, metadata !215, metadata !DIExpression()), !dbg !217
  br label %86, !dbg !315

86:                                               ; preds = %84, %1, %10, %18, %26, %34, %42, %50, %58, %66, %74, %82, %76, %68, %60, %52, %44, %36, %28, %20, %12, %4
  %87 = phi i32 [ %5, %4 ], [ %13, %12 ], [ %21, %20 ], [ %29, %28 ], [ %37, %36 ], [ %45, %44 ], [ %53, %52 ], [ %61, %60 ], [ %69, %68 ], [ %77, %76 ], [ 2, %82 ], [ 2, %74 ], [ 2, %66 ], [ 2, %58 ], [ 2, %50 ], [ 2, %42 ], [ 2, %34 ], [ 2, %26 ], [ 2, %18 ], [ 2, %10 ], [ 2, %1 ], [ 2, %84 ], !dbg !217
  ret i32 %87, !dbg !316
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @xdp_pass(ptr nocapture readnone %0) #4 section "xdp" !dbg !317 {
  call void @llvm.dbg.value(metadata ptr poison, metadata !319, metadata !DIExpression()), !dbg !320
  ret i32 2, !dbg !321
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { nofree noinline nounwind memory(inaccessiblemem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree nounwind memory(inaccessiblemem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!47, !48, !49, !50}
!llvm.ident = !{!51}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "conf", scope: !2, file: !3, line: 20, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 16.0.6 (15)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp-dispatcher.c", directory: "/home/miguel/xdp-tools/lib/libxdp", checksumkind: CSK_MD5, checksum: "b6ed117e39c1c72628611da72a4d5f5d")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5933, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../../headers/linux/bpf.h", directory: "/home/miguel/xdp-tools/lib/libxdp", checksumkind: CSK_MD5, checksum: "19e7a278dd5e69adb087c419977e86e0")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !21, !0}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 199, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "dispatcher_version", scope: !2, file: !3, line: 200, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 64, elements: !26)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{!27}
!27 = !DISubrange(count: 2)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_dispatcher_config", file: !31, line: 24, size: 992, elements: !32)
!31 = !DIFile(filename: "../../headers/xdp/prog_dispatcher.h", directory: "/home/miguel/xdp-tools/lib/libxdp", checksumkind: CSK_MD5, checksum: "aaec112d5bc5c2d2bb62c79d8f95df8a")
!32 = !{!33, !37, !38, !39, !40, !45, !46}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "magic", scope: !30, file: !31, line: 25, baseType: !34, size: 8)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !35, line: 21, baseType: !36)
!35 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!36 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "dispatcher_version", scope: !30, file: !31, line: 26, baseType: !34, size: 8, offset: 8)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "num_progs_enabled", scope: !30, file: !31, line: 27, baseType: !34, size: 8, offset: 16)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "is_xdp_frags", scope: !30, file: !31, line: 28, baseType: !34, size: 8, offset: 24)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "chain_call_actions", scope: !30, file: !31, line: 29, baseType: !41, size: 320, offset: 32)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 320, elements: !43)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !35, line: 27, baseType: !7)
!43 = !{!44}
!44 = !DISubrange(count: 10)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "run_prios", scope: !30, file: !31, line: 30, baseType: !41, size: 320, offset: 352)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "program_flags", scope: !30, file: !31, line: 31, baseType: !41, size: 320, offset: 672)
!47 = !{i32 7, !"Dwarf Version", i32 5}
!48 = !{i32 2, !"Debug Info Version", i32 3}
!49 = !{i32 1, !"wchar_size", i32 4}
!50 = !{i32 7, !"frame-pointer", i32 2}
!51 = !{!"Ubuntu clang version 16.0.6 (15)"}
!52 = distinct !DISubprogram(name: "prog0", scope: !3, file: !3, line: 26, type: !53, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !64)
!53 = !DISubroutineType(types: !54)
!54 = !{!25, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5944, size: 192, elements: !57)
!57 = !{!58, !59, !60, !61, !62, !63}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !56, file: !6, line: 5945, baseType: !42, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !56, file: !6, line: 5946, baseType: !42, size: 32, offset: 32)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !56, file: !6, line: 5947, baseType: !42, size: 32, offset: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !56, file: !6, line: 5949, baseType: !42, size: 32, offset: 96)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !56, file: !6, line: 5950, baseType: !42, size: 32, offset: 128)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !56, file: !6, line: 5952, baseType: !42, size: 32, offset: 160)
!64 = !{!65, !66}
!65 = !DILocalVariable(name: "ctx", arg: 1, scope: !52, file: !3, line: 26, type: !55)
!66 = !DILocalVariable(name: "ret", scope: !52, file: !3, line: 27, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !25)
!68 = !DILocation(line: 0, scope: !52)
!69 = !DILocation(line: 27, column: 9, scope: !52)
!70 = !DILocation(line: 27, column: 22, scope: !52)
!71 = !{!72, !72, i64 0}
!72 = !{!"int", !73, i64 0}
!73 = !{!"omnipotent char", !74, i64 0}
!74 = !{!"Simple C/C++ TBAA"}
!75 = !DILocation(line: 29, column: 14, scope: !76)
!76 = distinct !DILexicalBlock(scope: !52, file: !3, line: 29, column: 13)
!77 = !DILocation(line: 29, column: 13, scope: !52)
!78 = !DILocation(line: 31, column: 16, scope: !52)
!79 = !DILocation(line: 31, column: 9, scope: !52)
!80 = !DILocation(line: 32, column: 1, scope: !52)
!81 = distinct !DISubprogram(name: "prog1", scope: !3, file: !3, line: 34, type: !53, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !82)
!82 = !{!83, !84}
!83 = !DILocalVariable(name: "ctx", arg: 1, scope: !81, file: !3, line: 34, type: !55)
!84 = !DILocalVariable(name: "ret", scope: !81, file: !3, line: 35, type: !67)
!85 = !DILocation(line: 0, scope: !81)
!86 = !DILocation(line: 35, column: 9, scope: !81)
!87 = !DILocation(line: 35, column: 22, scope: !81)
!88 = !DILocation(line: 37, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !3, line: 37, column: 13)
!90 = !DILocation(line: 37, column: 13, scope: !81)
!91 = !DILocation(line: 39, column: 16, scope: !81)
!92 = !DILocation(line: 39, column: 9, scope: !81)
!93 = !DILocation(line: 40, column: 1, scope: !81)
!94 = distinct !DISubprogram(name: "prog2", scope: !3, file: !3, line: 42, type: !53, scopeLine: 42, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !95)
!95 = !{!96, !97}
!96 = !DILocalVariable(name: "ctx", arg: 1, scope: !94, file: !3, line: 42, type: !55)
!97 = !DILocalVariable(name: "ret", scope: !94, file: !3, line: 43, type: !67)
!98 = !DILocation(line: 0, scope: !94)
!99 = !DILocation(line: 43, column: 9, scope: !94)
!100 = !DILocation(line: 43, column: 22, scope: !94)
!101 = !DILocation(line: 45, column: 14, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !3, line: 45, column: 13)
!103 = !DILocation(line: 45, column: 13, scope: !94)
!104 = !DILocation(line: 47, column: 16, scope: !94)
!105 = !DILocation(line: 47, column: 9, scope: !94)
!106 = !DILocation(line: 48, column: 1, scope: !94)
!107 = distinct !DISubprogram(name: "prog3", scope: !3, file: !3, line: 50, type: !53, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !108)
!108 = !{!109, !110}
!109 = !DILocalVariable(name: "ctx", arg: 1, scope: !107, file: !3, line: 50, type: !55)
!110 = !DILocalVariable(name: "ret", scope: !107, file: !3, line: 51, type: !67)
!111 = !DILocation(line: 0, scope: !107)
!112 = !DILocation(line: 51, column: 9, scope: !107)
!113 = !DILocation(line: 51, column: 22, scope: !107)
!114 = !DILocation(line: 53, column: 14, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !3, line: 53, column: 13)
!116 = !DILocation(line: 53, column: 13, scope: !107)
!117 = !DILocation(line: 55, column: 16, scope: !107)
!118 = !DILocation(line: 55, column: 9, scope: !107)
!119 = !DILocation(line: 56, column: 1, scope: !107)
!120 = distinct !DISubprogram(name: "prog4", scope: !3, file: !3, line: 58, type: !53, scopeLine: 58, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !121)
!121 = !{!122, !123}
!122 = !DILocalVariable(name: "ctx", arg: 1, scope: !120, file: !3, line: 58, type: !55)
!123 = !DILocalVariable(name: "ret", scope: !120, file: !3, line: 59, type: !67)
!124 = !DILocation(line: 0, scope: !120)
!125 = !DILocation(line: 59, column: 9, scope: !120)
!126 = !DILocation(line: 59, column: 22, scope: !120)
!127 = !DILocation(line: 61, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !3, line: 61, column: 13)
!129 = !DILocation(line: 61, column: 13, scope: !120)
!130 = !DILocation(line: 63, column: 16, scope: !120)
!131 = !DILocation(line: 63, column: 9, scope: !120)
!132 = !DILocation(line: 64, column: 1, scope: !120)
!133 = distinct !DISubprogram(name: "prog5", scope: !3, file: !3, line: 66, type: !53, scopeLine: 66, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !134)
!134 = !{!135, !136}
!135 = !DILocalVariable(name: "ctx", arg: 1, scope: !133, file: !3, line: 66, type: !55)
!136 = !DILocalVariable(name: "ret", scope: !133, file: !3, line: 67, type: !67)
!137 = !DILocation(line: 0, scope: !133)
!138 = !DILocation(line: 67, column: 9, scope: !133)
!139 = !DILocation(line: 67, column: 22, scope: !133)
!140 = !DILocation(line: 69, column: 14, scope: !141)
!141 = distinct !DILexicalBlock(scope: !133, file: !3, line: 69, column: 13)
!142 = !DILocation(line: 69, column: 13, scope: !133)
!143 = !DILocation(line: 71, column: 16, scope: !133)
!144 = !DILocation(line: 71, column: 9, scope: !133)
!145 = !DILocation(line: 72, column: 1, scope: !133)
!146 = distinct !DISubprogram(name: "prog6", scope: !3, file: !3, line: 74, type: !53, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !147)
!147 = !{!148, !149}
!148 = !DILocalVariable(name: "ctx", arg: 1, scope: !146, file: !3, line: 74, type: !55)
!149 = !DILocalVariable(name: "ret", scope: !146, file: !3, line: 75, type: !67)
!150 = !DILocation(line: 0, scope: !146)
!151 = !DILocation(line: 75, column: 9, scope: !146)
!152 = !DILocation(line: 75, column: 22, scope: !146)
!153 = !DILocation(line: 77, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !146, file: !3, line: 77, column: 13)
!155 = !DILocation(line: 77, column: 13, scope: !146)
!156 = !DILocation(line: 79, column: 16, scope: !146)
!157 = !DILocation(line: 79, column: 9, scope: !146)
!158 = !DILocation(line: 80, column: 1, scope: !146)
!159 = distinct !DISubprogram(name: "prog7", scope: !3, file: !3, line: 82, type: !53, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !160)
!160 = !{!161, !162}
!161 = !DILocalVariable(name: "ctx", arg: 1, scope: !159, file: !3, line: 82, type: !55)
!162 = !DILocalVariable(name: "ret", scope: !159, file: !3, line: 83, type: !67)
!163 = !DILocation(line: 0, scope: !159)
!164 = !DILocation(line: 83, column: 9, scope: !159)
!165 = !DILocation(line: 83, column: 22, scope: !159)
!166 = !DILocation(line: 85, column: 14, scope: !167)
!167 = distinct !DILexicalBlock(scope: !159, file: !3, line: 85, column: 13)
!168 = !DILocation(line: 85, column: 13, scope: !159)
!169 = !DILocation(line: 87, column: 16, scope: !159)
!170 = !DILocation(line: 87, column: 9, scope: !159)
!171 = !DILocation(line: 88, column: 1, scope: !159)
!172 = distinct !DISubprogram(name: "prog8", scope: !3, file: !3, line: 90, type: !53, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !173)
!173 = !{!174, !175}
!174 = !DILocalVariable(name: "ctx", arg: 1, scope: !172, file: !3, line: 90, type: !55)
!175 = !DILocalVariable(name: "ret", scope: !172, file: !3, line: 91, type: !67)
!176 = !DILocation(line: 0, scope: !172)
!177 = !DILocation(line: 91, column: 9, scope: !172)
!178 = !DILocation(line: 91, column: 22, scope: !172)
!179 = !DILocation(line: 93, column: 14, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !3, line: 93, column: 13)
!181 = !DILocation(line: 93, column: 13, scope: !172)
!182 = !DILocation(line: 95, column: 16, scope: !172)
!183 = !DILocation(line: 95, column: 9, scope: !172)
!184 = !DILocation(line: 96, column: 1, scope: !172)
!185 = distinct !DISubprogram(name: "prog9", scope: !3, file: !3, line: 98, type: !53, scopeLine: 98, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !186)
!186 = !{!187, !188}
!187 = !DILocalVariable(name: "ctx", arg: 1, scope: !185, file: !3, line: 98, type: !55)
!188 = !DILocalVariable(name: "ret", scope: !185, file: !3, line: 99, type: !67)
!189 = !DILocation(line: 0, scope: !185)
!190 = !DILocation(line: 99, column: 9, scope: !185)
!191 = !DILocation(line: 99, column: 22, scope: !185)
!192 = !DILocation(line: 101, column: 14, scope: !193)
!193 = distinct !DILexicalBlock(scope: !185, file: !3, line: 101, column: 13)
!194 = !DILocation(line: 101, column: 13, scope: !185)
!195 = !DILocation(line: 103, column: 16, scope: !185)
!196 = !DILocation(line: 103, column: 9, scope: !185)
!197 = !DILocation(line: 104, column: 1, scope: !185)
!198 = distinct !DISubprogram(name: "compat_test", scope: !3, file: !3, line: 108, type: !53, scopeLine: 108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !199)
!199 = !{!200, !201}
!200 = !DILocalVariable(name: "ctx", arg: 1, scope: !198, file: !3, line: 108, type: !55)
!201 = !DILocalVariable(name: "ret", scope: !198, file: !3, line: 109, type: !67)
!202 = !DILocation(line: 0, scope: !198)
!203 = !DILocation(line: 109, column: 9, scope: !198)
!204 = !DILocation(line: 109, column: 22, scope: !198)
!205 = !DILocation(line: 111, column: 14, scope: !206)
!206 = distinct !DILexicalBlock(scope: !198, file: !3, line: 111, column: 13)
!207 = !DILocation(line: 111, column: 13, scope: !198)
!208 = !DILocation(line: 113, column: 16, scope: !198)
!209 = !DILocation(line: 113, column: 9, scope: !198)
!210 = !DILocation(line: 114, column: 1, scope: !198)
!211 = distinct !DISubprogram(name: "xdp_dispatcher", scope: !3, file: !3, line: 118, type: !53, scopeLine: 119, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !212)
!212 = !{!213, !214, !215, !216}
!213 = !DILocalVariable(name: "ctx", arg: 1, scope: !211, file: !3, line: 118, type: !55)
!214 = !DILocalVariable(name: "num_progs_enabled", scope: !211, file: !3, line: 120, type: !34)
!215 = !DILocalVariable(name: "ret", scope: !211, file: !3, line: 121, type: !25)
!216 = !DILabel(scope: !211, name: "out", file: !3, line: 189)
!217 = !DILocation(line: 0, scope: !211)
!218 = !DILocation(line: 120, column: 39, scope: !211)
!219 = !{!220, !73, i64 2}
!220 = !{!"xdp_dispatcher_config", !73, i64 0, !73, i64 1, !73, i64 2, !73, i64 3, !73, i64 4, !73, i64 44, !73, i64 84}
!221 = !DILocation(line: 123, column: 31, scope: !222)
!222 = distinct !DILexicalBlock(scope: !211, file: !3, line: 123, column: 13)
!223 = !DILocation(line: 123, column: 13, scope: !211)
!224 = !DILocation(line: 125, column: 15, scope: !211)
!225 = !DILocation(line: 126, column: 19, scope: !226)
!226 = distinct !DILexicalBlock(scope: !211, file: !3, line: 126, column: 13)
!227 = !DILocation(line: 126, column: 29, scope: !226)
!228 = !DILocation(line: 126, column: 27, scope: !226)
!229 = !DILocation(line: 126, column: 13, scope: !211)
!230 = !DILocation(line: 129, column: 31, scope: !231)
!231 = distinct !DILexicalBlock(scope: !211, file: !3, line: 129, column: 13)
!232 = !DILocation(line: 129, column: 13, scope: !211)
!233 = !DILocation(line: 131, column: 15, scope: !211)
!234 = !DILocation(line: 132, column: 19, scope: !235)
!235 = distinct !DILexicalBlock(scope: !211, file: !3, line: 132, column: 13)
!236 = !DILocation(line: 132, column: 29, scope: !235)
!237 = !DILocation(line: 132, column: 27, scope: !235)
!238 = !DILocation(line: 132, column: 13, scope: !211)
!239 = !DILocation(line: 135, column: 31, scope: !240)
!240 = distinct !DILexicalBlock(scope: !211, file: !3, line: 135, column: 13)
!241 = !DILocation(line: 135, column: 13, scope: !211)
!242 = !DILocation(line: 137, column: 15, scope: !211)
!243 = !DILocation(line: 138, column: 19, scope: !244)
!244 = distinct !DILexicalBlock(scope: !211, file: !3, line: 138, column: 13)
!245 = !DILocation(line: 138, column: 29, scope: !244)
!246 = !DILocation(line: 138, column: 27, scope: !244)
!247 = !DILocation(line: 138, column: 13, scope: !211)
!248 = !DILocation(line: 141, column: 31, scope: !249)
!249 = distinct !DILexicalBlock(scope: !211, file: !3, line: 141, column: 13)
!250 = !DILocation(line: 141, column: 13, scope: !211)
!251 = !DILocation(line: 143, column: 15, scope: !211)
!252 = !DILocation(line: 144, column: 19, scope: !253)
!253 = distinct !DILexicalBlock(scope: !211, file: !3, line: 144, column: 13)
!254 = !DILocation(line: 144, column: 29, scope: !253)
!255 = !DILocation(line: 144, column: 27, scope: !253)
!256 = !DILocation(line: 144, column: 13, scope: !211)
!257 = !DILocation(line: 147, column: 31, scope: !258)
!258 = distinct !DILexicalBlock(scope: !211, file: !3, line: 147, column: 13)
!259 = !DILocation(line: 147, column: 13, scope: !211)
!260 = !DILocation(line: 149, column: 15, scope: !211)
!261 = !DILocation(line: 150, column: 19, scope: !262)
!262 = distinct !DILexicalBlock(scope: !211, file: !3, line: 150, column: 13)
!263 = !DILocation(line: 150, column: 29, scope: !262)
!264 = !DILocation(line: 150, column: 27, scope: !262)
!265 = !DILocation(line: 150, column: 13, scope: !211)
!266 = !DILocation(line: 153, column: 31, scope: !267)
!267 = distinct !DILexicalBlock(scope: !211, file: !3, line: 153, column: 13)
!268 = !DILocation(line: 153, column: 13, scope: !211)
!269 = !DILocation(line: 155, column: 15, scope: !211)
!270 = !DILocation(line: 156, column: 19, scope: !271)
!271 = distinct !DILexicalBlock(scope: !211, file: !3, line: 156, column: 13)
!272 = !DILocation(line: 156, column: 29, scope: !271)
!273 = !DILocation(line: 156, column: 27, scope: !271)
!274 = !DILocation(line: 156, column: 13, scope: !211)
!275 = !DILocation(line: 159, column: 31, scope: !276)
!276 = distinct !DILexicalBlock(scope: !211, file: !3, line: 159, column: 13)
!277 = !DILocation(line: 159, column: 13, scope: !211)
!278 = !DILocation(line: 161, column: 15, scope: !211)
!279 = !DILocation(line: 162, column: 19, scope: !280)
!280 = distinct !DILexicalBlock(scope: !211, file: !3, line: 162, column: 13)
!281 = !DILocation(line: 162, column: 29, scope: !280)
!282 = !DILocation(line: 162, column: 27, scope: !280)
!283 = !DILocation(line: 162, column: 13, scope: !211)
!284 = !DILocation(line: 165, column: 31, scope: !285)
!285 = distinct !DILexicalBlock(scope: !211, file: !3, line: 165, column: 13)
!286 = !DILocation(line: 165, column: 13, scope: !211)
!287 = !DILocation(line: 167, column: 15, scope: !211)
!288 = !DILocation(line: 168, column: 19, scope: !289)
!289 = distinct !DILexicalBlock(scope: !211, file: !3, line: 168, column: 13)
!290 = !DILocation(line: 168, column: 29, scope: !289)
!291 = !DILocation(line: 168, column: 27, scope: !289)
!292 = !DILocation(line: 168, column: 13, scope: !211)
!293 = !DILocation(line: 171, column: 31, scope: !294)
!294 = distinct !DILexicalBlock(scope: !211, file: !3, line: 171, column: 13)
!295 = !DILocation(line: 171, column: 13, scope: !211)
!296 = !DILocation(line: 173, column: 15, scope: !211)
!297 = !DILocation(line: 174, column: 19, scope: !298)
!298 = distinct !DILexicalBlock(scope: !211, file: !3, line: 174, column: 13)
!299 = !DILocation(line: 174, column: 29, scope: !298)
!300 = !DILocation(line: 174, column: 27, scope: !298)
!301 = !DILocation(line: 174, column: 13, scope: !211)
!302 = !DILocation(line: 177, column: 31, scope: !303)
!303 = distinct !DILexicalBlock(scope: !211, file: !3, line: 177, column: 13)
!304 = !DILocation(line: 177, column: 13, scope: !211)
!305 = !DILocation(line: 179, column: 15, scope: !211)
!306 = !DILocation(line: 180, column: 19, scope: !307)
!307 = distinct !DILexicalBlock(scope: !211, file: !3, line: 180, column: 13)
!308 = !DILocation(line: 180, column: 29, scope: !307)
!309 = !DILocation(line: 180, column: 27, scope: !307)
!310 = !DILocation(line: 180, column: 13, scope: !211)
!311 = !DILocation(line: 186, column: 31, scope: !312)
!312 = distinct !DILexicalBlock(scope: !211, file: !3, line: 186, column: 13)
!313 = !DILocation(line: 186, column: 13, scope: !211)
!314 = !DILocation(line: 188, column: 15, scope: !211)
!315 = !DILocation(line: 188, column: 9, scope: !211)
!316 = !DILocation(line: 191, column: 1, scope: !211)
!317 = distinct !DISubprogram(name: "xdp_pass", scope: !3, file: !3, line: 194, type: !53, scopeLine: 195, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !318)
!318 = !{!319}
!319 = !DILocalVariable(name: "ctx", arg: 1, scope: !317, file: !3, line: 194, type: !55)
!320 = !DILocation(line: 0, scope: !317)
!321 = !DILocation(line: 196, column: 9, scope: !317)
