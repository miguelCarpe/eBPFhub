; ModuleID = 'xsk_def_xdp_prog.c'
source_filename = "xsk_def_xdp_prog.c"
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
define dso_local i32 @xsk_def_prog(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !73 {
  call void @llvm.dbg.value(metadata ptr %0, metadata !87, metadata !DIExpression()), !dbg !88
  %2 = load volatile i32, ptr @refcnt, align 4, !dbg !89, !tbaa !91
  %3 = icmp eq i32 %2, 0, !dbg !89
  br i1 %3, label %10, label %4, !dbg !95

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 4, !dbg !96
  %6 = load i32, ptr %5, align 4, !dbg !96, !tbaa !97
  %7 = zext i32 %6 to i64, !dbg !99
  %8 = tail call i64 inttoptr (i64 51 to ptr)(ptr noundef nonnull @xsks_map, i64 noundef %7, i64 noundef 2) #2, !dbg !100
  %9 = trunc i64 %8 to i32, !dbg !100
  br label %10, !dbg !101

10:                                               ; preds = %1, %4
  %11 = phi i32 [ %9, %4 ], [ 2, %1 ], !dbg !88
  ret i32 %11, !dbg !102
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "refcnt", scope: !2, file: !3, line: 27, type: !67, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 16.0.6 (15)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xsk_def_xdp_prog.c", directory: "/home/miguel/xdp-tools/lib/libxdp", checksumkind: CSK_MD5, checksum: "bce97ec18904cb0cd5d271e48243b250")
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
!14 = !{!0, !15, !21, !40, !54, !56}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 43, type: !17, isLocal: false, isDefinition: true)
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
!55 = distinct !DIGlobalVariable(name: "xsk_prog_version", scope: !2, file: !3, line: 44, type: !50, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !58, line: 1323, type: !59, isLocal: true, isDefinition: true)
!58 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !63, !64, !64}
!62 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !65, line: 31, baseType: !66)
!65 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!66 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!67 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !28)
!68 = !{i32 7, !"Dwarf Version", i32 5}
!69 = !{i32 2, !"Debug Info Version", i32 3}
!70 = !{i32 1, !"wchar_size", i32 4}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"Ubuntu clang version 16.0.6 (15)"}
!73 = distinct !DISubprogram(name: "xsk_def_prog", scope: !3, file: !3, line: 31, type: !74, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !86)
!74 = !DISubroutineType(types: !75)
!75 = !{!28, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5944, size: 192, elements: !78)
!78 = !{!79, !81, !82, !83, !84, !85}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !77, file: !6, line: 5945, baseType: !80, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !65, line: 27, baseType: !7)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !77, file: !6, line: 5946, baseType: !80, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !77, file: !6, line: 5947, baseType: !80, size: 32, offset: 64)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !77, file: !6, line: 5949, baseType: !80, size: 32, offset: 96)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !77, file: !6, line: 5950, baseType: !80, size: 32, offset: 128)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !77, file: !6, line: 5952, baseType: !80, size: 32, offset: 160)
!86 = !{!87}
!87 = !DILocalVariable(name: "ctx", arg: 1, scope: !73, file: !3, line: 31, type: !76)
!88 = !DILocation(line: 0, scope: !73)
!89 = !DILocation(line: 34, column: 7, scope: !90)
!90 = distinct !DILexicalBlock(scope: !73, file: !3, line: 34, column: 6)
!91 = !{!92, !92, i64 0}
!92 = !{!"int", !93, i64 0}
!93 = !{!"omnipotent char", !94, i64 0}
!94 = !{!"Simple C/C++ TBAA"}
!95 = !DILocation(line: 34, column: 6, scope: !73)
!96 = !DILocation(line: 40, column: 42, scope: !73)
!97 = !{!98, !92, i64 16}
!98 = !{!"xdp_md", !92, i64 0, !92, i64 4, !92, i64 8, !92, i64 12, !92, i64 16, !92, i64 20}
!99 = !DILocation(line: 40, column: 37, scope: !73)
!100 = !DILocation(line: 40, column: 9, scope: !73)
!101 = !DILocation(line: 40, column: 2, scope: !73)
!102 = !DILocation(line: 41, column: 1, scope: !73)
