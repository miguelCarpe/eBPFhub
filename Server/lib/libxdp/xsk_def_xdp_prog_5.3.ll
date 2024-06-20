; ModuleID = 'xsk_def_xdp_prog_5.3.c'
source_filename = "xsk_def_xdp_prog_5.3.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr }
%struct.anon.0 = type { ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@refcnt = dso_local global i32 1, align 4, !dbg !0
@xsks_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !21
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !15
@_xsk_def_prog = dso_local global %struct.anon.0 zeroinitializer, section ".xdp_run_config", align 8, !dbg !40
@xsk_prog_version = dso_local global ptr null, section "xdp_metadata", align 8, !dbg !54
@llvm.compiler.used = appending global [5 x ptr] [ptr @_license, ptr @_xsk_def_prog, ptr @xsk_def_prog, ptr @xsk_prog_version, ptr @xsks_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xsk_def_prog(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !80 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !94, metadata !DIExpression()), !dbg !96
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #3, !dbg !97
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 4, !dbg !98
  %4 = load i32, ptr %3, align 4, !dbg !98, !tbaa !99
  call void @llvm.dbg.value(metadata i32 %4, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 %4, ptr %2, align 4, !dbg !104, !tbaa !105
  %5 = load volatile i32, ptr @refcnt, align 4, !dbg !106, !tbaa !105
  %6 = icmp eq i32 %5, 0, !dbg !106
  br i1 %6, label %15, label %7, !dbg !108

7:                                                ; preds = %1
  call void @llvm.dbg.value(metadata ptr %2, metadata !95, metadata !DIExpression(DW_OP_deref)), !dbg !96
  %8 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xsks_map, ptr noundef nonnull %2) #3, !dbg !109
  %9 = icmp eq ptr %8, null, !dbg !109
  br i1 %9, label %15, label %10, !dbg !111

10:                                               ; preds = %7
  %11 = load i32, ptr %2, align 4, !dbg !112, !tbaa !105
  call void @llvm.dbg.value(metadata i32 %11, metadata !95, metadata !DIExpression()), !dbg !96
  %12 = sext i32 %11 to i64, !dbg !112
  %13 = call i64 inttoptr (i64 51 to ptr)(ptr noundef nonnull @xsks_map, i64 noundef %12, i64 noundef 0) #3, !dbg !113
  %14 = trunc i64 %13 to i32, !dbg !113
  br label %15, !dbg !114

15:                                               ; preds = %7, %1, %10
  %16 = phi i32 [ %14, %10 ], [ 2, %1 ], [ 2, %7 ], !dbg !96
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #3, !dbg !115
  ret i32 %16, !dbg !115
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!75, !76, !77, !78}
!llvm.ident = !{!79}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "refcnt", scope: !2, file: !3, line: 27, type: !74, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 16.0.6 (15)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xsk_def_xdp_prog_5.3.c", directory: "/home/miguel/xdp-tools/lib/libxdp", checksumkind: CSK_MD5, checksum: "bae3de4712c516b7b8ed19a2257b01b6")
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
!14 = !{!0, !15, !21, !40, !54, !56, !65}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 48, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "xsks_map", scope: !2, file: !3, line: 16, type: !23, isLocal: false, isDefinition: true)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 11, size: 256, elements: !24)
!24 = !{!25, !31, !34, !35}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !23, file: !3, line: 12, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 544, elements: !29)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !{!30}
!30 = !DISubrange(count: 17)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !23, file: !3, line: 13, baseType: !32, size: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 128, elements: !19)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !23, file: !3, line: 14, baseType: !32, size: 64, offset: 128)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !23, file: !3, line: 15, baseType: !36, size: 64, offset: 192)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 2048, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 64)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "_xsk_def_prog", scope: !2, file: !3, line: 21, type: !42, isLocal: false, isDefinition: true)
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 18, size: 128, elements: !43)
!43 = !{!44, !49}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !42, file: !3, line: 19, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 640, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 20)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "XDP_PASS", scope: !42, file: !3, line: 20, baseType: !50, size: 64, offset: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 32, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 1)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "xsk_prog_version", scope: !2, file: !3, line: 49, type: !50, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !58, line: 56, type: !59, isLocal: true, isDefinition: true)
!58 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !58, line: 1323, type: !67, isLocal: true, isDefinition: true)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !62, !71, !71}
!70 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !72, line: 31, baseType: !73)
!72 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!73 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!74 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !28)
!75 = !{i32 7, !"Dwarf Version", i32 5}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 7, !"frame-pointer", i32 2}
!79 = !{!"Ubuntu clang version 16.0.6 (15)"}
!80 = distinct !DISubprogram(name: "xsk_def_prog", scope: !3, file: !3, line: 31, type: !81, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !93)
!81 = !DISubroutineType(types: !82)
!82 = !{!28, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5944, size: 192, elements: !85)
!85 = !{!86, !88, !89, !90, !91, !92}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !84, file: !6, line: 5945, baseType: !87, size: 32)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !72, line: 27, baseType: !7)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !84, file: !6, line: 5946, baseType: !87, size: 32, offset: 32)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !84, file: !6, line: 5947, baseType: !87, size: 32, offset: 64)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !84, file: !6, line: 5949, baseType: !87, size: 32, offset: 96)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !84, file: !6, line: 5950, baseType: !87, size: 32, offset: 128)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !84, file: !6, line: 5952, baseType: !87, size: 32, offset: 160)
!93 = !{!94, !95}
!94 = !DILocalVariable(name: "ctx", arg: 1, scope: !80, file: !3, line: 31, type: !83)
!95 = !DILocalVariable(name: "index", scope: !80, file: !3, line: 33, type: !28)
!96 = !DILocation(line: 0, scope: !80)
!97 = !DILocation(line: 33, column: 2, scope: !80)
!98 = !DILocation(line: 33, column: 19, scope: !80)
!99 = !{!100, !101, i64 16}
!100 = !{!"xdp_md", !101, i64 0, !101, i64 4, !101, i64 8, !101, i64 12, !101, i64 16, !101, i64 20}
!101 = !{!"int", !102, i64 0}
!102 = !{!"omnipotent char", !103, i64 0}
!103 = !{!"Simple C/C++ TBAA"}
!104 = !DILocation(line: 33, column: 6, scope: !80)
!105 = !{!101, !101, i64 0}
!106 = !DILocation(line: 36, column: 7, scope: !107)
!107 = distinct !DILexicalBlock(scope: !80, file: !3, line: 36, column: 6)
!108 = !DILocation(line: 36, column: 6, scope: !80)
!109 = !DILocation(line: 42, column: 6, scope: !110)
!110 = distinct !DILexicalBlock(scope: !80, file: !3, line: 42, column: 6)
!111 = !DILocation(line: 42, column: 6, scope: !80)
!112 = !DILocation(line: 43, column: 38, scope: !110)
!113 = !DILocation(line: 43, column: 10, scope: !110)
!114 = !DILocation(line: 43, column: 3, scope: !110)
!115 = !DILocation(line: 46, column: 1, scope: !80)
