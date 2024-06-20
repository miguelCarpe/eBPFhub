; ModuleID = 'xdp_load_bytes.bpf.c'
source_filename = "xdp_load_bytes.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.compiler.used = appending global [2 x ptr] [ptr @_license, ptr @xdp_probe_prog], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_probe_prog(ptr noundef %0) #0 section "xdp" !dbg !43 {
  %2 = alloca [10 x i8], align 1
  call void @llvm.dbg.value(metadata ptr %0, metadata !48, metadata !DIExpression()), !dbg !56
  call void @llvm.lifetime.start.p0(i64 10, ptr nonnull %2) #4, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %2, metadata !49, metadata !DIExpression()), !dbg !58
  %3 = call i64 inttoptr (i64 189 to ptr)(ptr noundef %0, i32 noundef 0, ptr noundef nonnull %2, i32 noundef 10) #4, !dbg !59
  call void @llvm.dbg.value(metadata i64 %3, metadata !55, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !56
  %4 = and i64 %3, 4294967295, !dbg !60
  %5 = icmp eq i64 %4, 0, !dbg !60
  %6 = select i1 %5, i32 2, i32 0, !dbg !56
  call void @llvm.lifetime.end.p0(i64 10, ptr nonnull %2) #4, !dbg !62
  ret i32 %6, !dbg !62
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!38, !39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 23, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 16.0.6 (15)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_load_bytes.bpf.c", directory: "/home/miguel/xdp-tools/lib/util", checksumkind: CSK_MD5, checksum: "352715819f9731761c8faa75938f1edf")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5933, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../../headers/linux/bpf.h", directory: "/home/miguel/xdp-tools/lib/util", checksumkind: CSK_MD5, checksum: "19e7a278dd5e69adb087c419977e86e0")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "bpf_xdp_load_bytes", scope: !2, file: !17, line: 4327, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !22, !26, !33, !26}
!21 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5944, size: 192, elements: !24)
!24 = !{!25, !28, !29, !30, !31, !32}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !23, file: !6, line: 5945, baseType: !26, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !27, line: 27, baseType: !7)
!27 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!28 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !23, file: !6, line: 5946, baseType: !26, size: 32, offset: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !23, file: !6, line: 5947, baseType: !26, size: 32, offset: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !23, file: !6, line: 5949, baseType: !26, size: 32, offset: 96)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !23, file: !6, line: 5950, baseType: !26, size: 32, offset: 128)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !23, file: !6, line: 5952, baseType: !26, size: 32, offset: 160)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 32, elements: !36)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !{!37}
!37 = !DISubrange(count: 4)
!38 = !{i32 7, !"Dwarf Version", i32 5}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{i32 7, !"frame-pointer", i32 2}
!42 = !{!"Ubuntu clang version 16.0.6 (15)"}
!43 = distinct !DISubprogram(name: "xdp_probe_prog", scope: !3, file: !3, line: 11, type: !44, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !47)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !22}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !{!48, !49, !55}
!48 = !DILocalVariable(name: "ctx", arg: 1, scope: !43, file: !3, line: 11, type: !22)
!49 = !DILocalVariable(name: "buf", scope: !43, file: !3, line: 13, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 80, elements: !53)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !27, line: 21, baseType: !52)
!52 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!53 = !{!54}
!54 = !DISubrange(count: 10)
!55 = !DILocalVariable(name: "err", scope: !43, file: !3, line: 14, type: !46)
!56 = !DILocation(line: 0, scope: !43)
!57 = !DILocation(line: 13, column: 2, scope: !43)
!58 = !DILocation(line: 13, column: 7, scope: !43)
!59 = !DILocation(line: 16, column: 8, scope: !43)
!60 = !DILocation(line: 17, column: 6, scope: !61)
!61 = distinct !DILexicalBlock(scope: !43, file: !3, line: 17, column: 6)
!62 = !DILocation(line: 21, column: 1, scope: !43)
