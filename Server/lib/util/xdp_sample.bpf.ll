; ModuleID = 'xdp_sample.bpf.c'
source_filename = "xdp_sample.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@____tp_xdp_cpumap_kthread.fmt = internal constant [23 x i8] c"Stats: %d %u %u %d %d\0A\00", align 1, !dbg !7
@"llvm.xdp_cpumap_stats:0:4$0:1" = external global i64, !llvm.preserve.access.index !17 #0
@llvm.compiler.used = appending global [2 x ptr] [ptr @_license, ptr @tp_xdp_cpumap_kthread], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @tp_xdp_cpumap_kthread(ptr nocapture noundef readonly %0) #1 section "tp_btf/xdp_cpumap_kthread" !dbg !59 {
  %2 = alloca [5 x i64], align 8
  call void @llvm.dbg.value(metadata ptr %0, metadata !63, metadata !DIExpression()), !dbg !64
  %3 = load i64, ptr %0, align 8, !dbg !65, !tbaa !66
  %4 = getelementptr inbounds i64, ptr %0, i64 1, !dbg !65
  %5 = load i64, ptr %4, align 8, !dbg !65, !tbaa !66
  %6 = getelementptr inbounds i64, ptr %0, i64 2, !dbg !65
  %7 = load i64, ptr %6, align 8, !dbg !65, !tbaa !66
  %8 = getelementptr inbounds i64, ptr %0, i64 3, !dbg !65
  %9 = load i64, ptr %8, align 8, !dbg !65, !tbaa !66
  %10 = getelementptr inbounds i64, ptr %0, i64 4, !dbg !65
  %11 = load i64, ptr %10, align 8, !dbg !65, !tbaa !66
  %12 = inttoptr i64 %11 to ptr, !dbg !65
  call void @llvm.dbg.value(metadata ptr %0, metadata !24, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata i64 %3, metadata !25, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !70
  call void @llvm.dbg.value(metadata i64 %5, metadata !26, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !70
  call void @llvm.dbg.value(metadata i64 %7, metadata !27, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !70
  call void @llvm.dbg.value(metadata i64 %9, metadata !28, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !70
  call void @llvm.dbg.value(metadata ptr %12, metadata !29, metadata !DIExpression()), !dbg !70
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %2) #6, !dbg !72
  call void @llvm.dbg.declare(metadata ptr %2, metadata !30, metadata !DIExpression()), !dbg !73
  %13 = shl i64 %3, 32, !dbg !74
  %14 = ashr exact i64 %13, 32, !dbg !74
  store i64 %14, ptr %2, align 8, !dbg !75, !tbaa !66
  %15 = getelementptr inbounds i64, ptr %2, i64 1, !dbg !75
  %16 = and i64 %5, 4294967295, !dbg !76
  store i64 %16, ptr %15, align 8, !dbg !75, !tbaa !66
  %17 = getelementptr inbounds i64, ptr %2, i64 2, !dbg !75
  %18 = and i64 %7, 4294967295, !dbg !77
  store i64 %18, ptr %17, align 8, !dbg !75, !tbaa !66
  %19 = getelementptr inbounds i64, ptr %2, i64 3, !dbg !75
  %20 = shl i64 %9, 32, !dbg !78
  %21 = ashr exact i64 %20, 32, !dbg !78
  store i64 %21, ptr %19, align 8, !dbg !75, !tbaa !66
  %22 = getelementptr inbounds i64, ptr %2, i64 4, !dbg !75
  %23 = load i64, ptr @"llvm.xdp_cpumap_stats:0:4$0:1", align 8
  %24 = getelementptr i8, ptr %12, i64 %23
  %25 = tail call ptr @llvm.bpf.passthrough.p0.p0(i32 0, ptr %24)
  %26 = load i32, ptr %25, align 4, !dbg !79, !tbaa !80
  %27 = zext i32 %26 to i64, !dbg !83
  store i64 %27, ptr %22, align 8, !dbg !75, !tbaa !66
  %28 = call i64 inttoptr (i64 177 to ptr)(ptr noundef nonnull @____tp_xdp_cpumap_kthread.fmt, i32 noundef 23, ptr noundef nonnull %2, i32 noundef 40) #6, !dbg !84
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %2) #6, !dbg !85
  ret i32 0, !dbg !65
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nofree nosync nounwind memory(none)
declare ptr @llvm.bpf.passthrough.p0.p0(i32, ptr) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { "btf_ama" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nofree nosync nounwind memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!54, !55, !56, !57}
!llvm.ident = !{!58}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 27, type: !51, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 16.0.6 (15)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_sample.bpf.c", directory: "/home/miguel/xdp-tools/lib/util", checksumkind: CSK_MD5, checksum: "f91a4ee55ed164997d5c3d47f0f529c4")
!4 = !{!5}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{!0, !7, !39}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "fmt", scope: !9, file: !3, line: 18, type: !34, isLocal: true, isDefinition: true)
!9 = distinct !DISubprogram(name: "____tp_xdp_cpumap_kthread", scope: !3, file: !3, line: 15, type: !10, scopeLine: 17, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !23)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !12, !15, !15, !12, !16}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_cpumap_stats", file: !18, line: 12, size: 96, elements: !19)
!18 = !DIFile(filename: "../../headers/bpf/vmlinux.h", directory: "/home/miguel/xdp-tools/lib/util", checksumkind: CSK_MD5, checksum: "0eca27369e78bb57f0efa8f077a30599")
!19 = !{!20, !21, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "redirect", scope: !17, file: !18, line: 13, baseType: !15, size: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "pass", scope: !17, file: !18, line: 14, baseType: !15, size: 32, offset: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "drop", scope: !17, file: !18, line: 15, baseType: !15, size: 32, offset: 64)
!23 = !{!24, !25, !26, !27, !28, !29, !30}
!24 = !DILocalVariable(name: "ctx", arg: 1, scope: !9, file: !3, line: 15, type: !13)
!25 = !DILocalVariable(name: "map_id", arg: 2, scope: !9, file: !3, line: 15, type: !12)
!26 = !DILocalVariable(name: "processed", arg: 3, scope: !9, file: !3, line: 15, type: !15)
!27 = !DILocalVariable(name: "drops", arg: 4, scope: !9, file: !3, line: 15, type: !15)
!28 = !DILocalVariable(name: "sched", arg: 5, scope: !9, file: !3, line: 15, type: !12)
!29 = !DILocalVariable(name: "xdp_stats", arg: 6, scope: !9, file: !3, line: 15, type: !16)
!30 = !DILocalVariable(name: "args", scope: !9, file: !3, line: 19, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 184, elements: !37)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!37 = !{!38}
!38 = !DISubrange(count: 23)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "bpf_trace_vprintk", scope: !2, file: !41, line: 4136, type: !42, isLocal: true, isDefinition: true)
!41 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !46, !47, !49, !47}
!45 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !48, line: 27, baseType: !15)
!48 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 32, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 4)
!54 = !{i32 7, !"Dwarf Version", i32 5}
!55 = !{i32 2, !"Debug Info Version", i32 3}
!56 = !{i32 1, !"wchar_size", i32 4}
!57 = !{i32 7, !"frame-pointer", i32 2}
!58 = !{!"Ubuntu clang version 16.0.6 (15)"}
!59 = distinct !DISubprogram(name: "tp_xdp_cpumap_kthread", scope: !3, file: !3, line: 15, type: !60, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !62)
!60 = !DISubroutineType(types: !61)
!61 = !{!12, !13}
!62 = !{!63}
!63 = !DILocalVariable(name: "ctx", arg: 1, scope: !59, file: !3, line: 15, type: !13)
!64 = !DILocation(line: 0, scope: !59)
!65 = !DILocation(line: 15, column: 5, scope: !59)
!66 = !{!67, !67, i64 0}
!67 = !{!"long long", !68, i64 0}
!68 = !{!"omnipotent char", !69, i64 0}
!69 = !{!"Simple C/C++ TBAA"}
!70 = !DILocation(line: 0, scope: !9, inlinedAt: !71)
!71 = distinct !DILocation(line: 15, column: 5, scope: !59)
!72 = !DILocation(line: 19, column: 2, scope: !9, inlinedAt: !71)
!73 = !DILocation(line: 19, column: 21, scope: !9, inlinedAt: !71)
!74 = !DILocation(line: 20, column: 3, scope: !9, inlinedAt: !71)
!75 = !DILocation(line: 19, column: 30, scope: !9, inlinedAt: !71)
!76 = !DILocation(line: 20, column: 11, scope: !9, inlinedAt: !71)
!77 = !DILocation(line: 20, column: 22, scope: !9, inlinedAt: !71)
!78 = !DILocation(line: 20, column: 29, scope: !9, inlinedAt: !71)
!79 = !DILocation(line: 20, column: 47, scope: !9, inlinedAt: !71)
!80 = !{!81, !82, i64 4}
!81 = !{!"xdp_cpumap_stats", !82, i64 0, !82, i64 4, !82, i64 8}
!82 = !{!"int", !68, i64 0}
!83 = !DILocation(line: 20, column: 36, scope: !9, inlinedAt: !71)
!84 = !DILocation(line: 23, column: 2, scope: !9, inlinedAt: !71)
!85 = !DILocation(line: 25, column: 1, scope: !9, inlinedAt: !71)
