; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=fiji -stop-after=instruction-select -verify-machineinstrs -o - %s | FileCheck -check-prefix=UNPACKED %s
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx810 -stop-after=instruction-select -verify-machineinstrs -o - %s | FileCheck -check-prefix=PACKED %s

define amdgpu_ps void @struct_buffer_store_format_f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset(half %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; UNPACKED-LABEL: name: struct_buffer_store_format_f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; UNPACKED: bb.1 (%ir-block.0):
  ; UNPACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2
  ; UNPACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; UNPACKED:   [[COPY1:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; UNPACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; UNPACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; UNPACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; UNPACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; UNPACKED:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; UNPACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; UNPACKED:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; UNPACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY6]], %subreg.sub1
  ; UNPACKED:   BUFFER_STORE_FORMAT_D16_X_gfx80_BOTHEN_exact [[COPY]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], [[COPY7]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (s16), align 1, addrspace 4)
  ; UNPACKED:   S_ENDPGM 0
  ; PACKED-LABEL: name: struct_buffer_store_format_f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; PACKED: bb.1 (%ir-block.0):
  ; PACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2
  ; PACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; PACKED:   [[COPY1:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; PACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; PACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; PACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; PACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; PACKED:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; PACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; PACKED:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; PACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY6]], %subreg.sub1
  ; PACKED:   BUFFER_STORE_FORMAT_D16_X_BOTHEN_exact [[COPY]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], [[COPY7]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (s16), align 1, addrspace 4)
  ; PACKED:   S_ENDPGM 0
  call void @llvm.amdgcn.struct.buffer.store.format.f16(half %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @struct_buffer_store_format_v2f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset(<2 x half> %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; UNPACKED-LABEL: name: struct_buffer_store_format_v2f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; UNPACKED: bb.1 (%ir-block.0):
  ; UNPACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2
  ; UNPACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; UNPACKED:   [[COPY1:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; UNPACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; UNPACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; UNPACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; UNPACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; UNPACKED:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; UNPACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; UNPACKED:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; UNPACKED:   [[S_MOV_B32_:%[0-9]+]]:sreg_32 = S_MOV_B32 16
  ; UNPACKED:   [[COPY8:%[0-9]+]]:vgpr_32 = COPY [[S_MOV_B32_]]
  ; UNPACKED:   [[V_LSHRREV_B32_e64_:%[0-9]+]]:vgpr_32 = V_LSHRREV_B32_e64 [[COPY8]], [[COPY]], implicit $exec
  ; UNPACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[V_LSHRREV_B32_e64_]], %subreg.sub1
  ; UNPACKED:   [[REG_SEQUENCE2:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY6]], %subreg.sub1
  ; UNPACKED:   BUFFER_STORE_FORMAT_D16_XY_gfx80_BOTHEN_exact [[REG_SEQUENCE1]], [[REG_SEQUENCE2]], [[REG_SEQUENCE]], [[COPY7]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (<2 x s16>), align 1, addrspace 4)
  ; UNPACKED:   S_ENDPGM 0
  ; PACKED-LABEL: name: struct_buffer_store_format_v2f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; PACKED: bb.1 (%ir-block.0):
  ; PACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2
  ; PACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; PACKED:   [[COPY1:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; PACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; PACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; PACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; PACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; PACKED:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; PACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; PACKED:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; PACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY6]], %subreg.sub1
  ; PACKED:   BUFFER_STORE_FORMAT_D16_XY_BOTHEN_exact [[COPY]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], [[COPY7]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (<2 x s16>), align 1, addrspace 4)
  ; PACKED:   S_ENDPGM 0
  call void @llvm.amdgcn.struct.buffer.store.format.v2f16(<2 x half> %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

; FIXME:
; define amdgpu_ps void @struct_buffer_store_format_v3f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset(<3 x half> %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
;   call void @llvm.amdgcn.struct.buffer.store.format.v3f16(<3 x half> %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
;   ret void
; }

define amdgpu_ps void @struct_buffer_store_format_v4f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset(<4 x half> %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; UNPACKED-LABEL: name: struct_buffer_store_format_v4f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; UNPACKED: bb.1 (%ir-block.0):
  ; UNPACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; UNPACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; UNPACKED:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; UNPACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; UNPACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; UNPACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; UNPACKED:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; UNPACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; UNPACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; UNPACKED:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr3
  ; UNPACKED:   [[COPY8:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; UNPACKED:   [[S_MOV_B32_:%[0-9]+]]:sreg_32 = S_MOV_B32 16
  ; UNPACKED:   [[COPY9:%[0-9]+]]:vgpr_32 = COPY [[S_MOV_B32_]]
  ; UNPACKED:   [[V_LSHRREV_B32_e64_:%[0-9]+]]:vgpr_32 = V_LSHRREV_B32_e64 [[COPY9]], [[COPY]], implicit $exec
  ; UNPACKED:   [[COPY10:%[0-9]+]]:vgpr_32 = COPY [[S_MOV_B32_]]
  ; UNPACKED:   [[V_LSHRREV_B32_e64_1:%[0-9]+]]:vgpr_32 = V_LSHRREV_B32_e64 [[COPY10]], [[COPY1]], implicit $exec
  ; UNPACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_128 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[V_LSHRREV_B32_e64_]], %subreg.sub1, [[COPY1]], %subreg.sub2, [[V_LSHRREV_B32_e64_1]], %subreg.sub3
  ; UNPACKED:   [[REG_SEQUENCE2:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY6]], %subreg.sub0, [[COPY7]], %subreg.sub1
  ; UNPACKED:   BUFFER_STORE_FORMAT_D16_XYZW_gfx80_BOTHEN_exact [[REG_SEQUENCE1]], [[REG_SEQUENCE2]], [[REG_SEQUENCE]], [[COPY8]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (<4 x s16>), align 1, addrspace 4)
  ; UNPACKED:   S_ENDPGM 0
  ; PACKED-LABEL: name: struct_buffer_store_format_v4f16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; PACKED: bb.1 (%ir-block.0):
  ; PACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; PACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; PACKED:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; PACKED:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; PACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; PACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; PACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; PACKED:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; PACKED:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; PACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; PACKED:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr3
  ; PACKED:   [[COPY8:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; PACKED:   [[REG_SEQUENCE2:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY6]], %subreg.sub0, [[COPY7]], %subreg.sub1
  ; PACKED:   BUFFER_STORE_FORMAT_D16_XYZW_BOTHEN_exact [[REG_SEQUENCE]], [[REG_SEQUENCE2]], [[REG_SEQUENCE1]], [[COPY8]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (<4 x s16>), align 1, addrspace 4)
  ; PACKED:   S_ENDPGM 0
  call void @llvm.amdgcn.struct.buffer.store.format.v4f16(<4 x half> %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @struct_buffer_store_format_f16__sgpr_val__vgpr_rsrc__sgpr_vindex__sgpr_voffset__vgpr_soffset(half inreg %val, <4 x i32> %rsrc, i32 inreg %vindex, i32 inreg %voffset, i32 %soffset) {
  ; UNPACKED-LABEL: name: struct_buffer_store_format_f16__sgpr_val__vgpr_rsrc__sgpr_vindex__sgpr_voffset__vgpr_soffset
  ; UNPACKED: bb.1 (%ir-block.0):
  ; UNPACKED:   successors: %bb.2(0x80000000)
  ; UNPACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4
  ; UNPACKED:   [[COPY:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; UNPACKED:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; UNPACKED:   [[COPY2:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; UNPACKED:   [[COPY3:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; UNPACKED:   [[COPY4:%[0-9]+]]:vgpr_32 = COPY $vgpr3
  ; UNPACKED:   [[REG_SEQUENCE:%[0-9]+]]:vreg_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; UNPACKED:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; UNPACKED:   [[COPY6:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; UNPACKED:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr4
  ; UNPACKED:   [[COPY8:%[0-9]+]]:vgpr_32 = COPY [[COPY]]
  ; UNPACKED:   [[COPY9:%[0-9]+]]:vgpr_32 = COPY [[COPY5]]
  ; UNPACKED:   [[COPY10:%[0-9]+]]:vgpr_32 = COPY [[COPY6]]
  ; UNPACKED:   [[COPY11:%[0-9]+]]:vreg_64 = COPY [[REG_SEQUENCE]].sub0_sub1
  ; UNPACKED:   [[COPY12:%[0-9]+]]:vreg_64 = COPY [[REG_SEQUENCE]].sub2_sub3
  ; UNPACKED:   [[S_MOV_B64_term:%[0-9]+]]:sreg_64_xexec = S_MOV_B64_term $exec
  ; UNPACKED: bb.2:
  ; UNPACKED:   successors: %bb.3(0x40000000), %bb.2(0x40000000)
  ; UNPACKED:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY11]].sub0, implicit $exec
  ; UNPACKED:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY11]].sub1, implicit $exec
  ; UNPACKED:   [[REG_SEQUENCE1:%[0-9]+]]:sreg_64_xexec = REG_SEQUENCE [[V_READFIRSTLANE_B32_]], %subreg.sub0, [[V_READFIRSTLANE_B32_1]], %subreg.sub1
  ; UNPACKED:   [[V_CMP_EQ_U64_e64_:%[0-9]+]]:sreg_64_xexec = V_CMP_EQ_U64_e64 [[REG_SEQUENCE1]], [[COPY11]], implicit $exec
  ; UNPACKED:   [[V_READFIRSTLANE_B32_2:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY12]].sub0, implicit $exec
  ; UNPACKED:   [[V_READFIRSTLANE_B32_3:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY12]].sub1, implicit $exec
  ; UNPACKED:   [[REG_SEQUENCE2:%[0-9]+]]:sreg_64_xexec = REG_SEQUENCE [[V_READFIRSTLANE_B32_2]], %subreg.sub0, [[V_READFIRSTLANE_B32_3]], %subreg.sub1
  ; UNPACKED:   [[V_CMP_EQ_U64_e64_1:%[0-9]+]]:sreg_64_xexec = V_CMP_EQ_U64_e64 [[REG_SEQUENCE2]], [[COPY12]], implicit $exec
  ; UNPACKED:   [[S_AND_B64_:%[0-9]+]]:sreg_64_xexec = S_AND_B64 [[V_CMP_EQ_U64_e64_1]], [[V_CMP_EQ_U64_e64_]], implicit-def $scc
  ; UNPACKED:   [[REG_SEQUENCE3:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[V_READFIRSTLANE_B32_]], %subreg.sub0, [[V_READFIRSTLANE_B32_1]], %subreg.sub1, [[V_READFIRSTLANE_B32_2]], %subreg.sub2, [[V_READFIRSTLANE_B32_3]], %subreg.sub3
  ; UNPACKED:   [[V_READFIRSTLANE_B32_4:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY7]], implicit $exec
  ; UNPACKED:   [[V_CMP_EQ_U32_e64_:%[0-9]+]]:sreg_64_xexec = V_CMP_EQ_U32_e64 [[V_READFIRSTLANE_B32_4]], [[COPY7]], implicit $exec
  ; UNPACKED:   [[S_AND_B64_1:%[0-9]+]]:sreg_64_xexec = S_AND_B64 [[V_CMP_EQ_U32_e64_]], [[S_AND_B64_]], implicit-def $scc
  ; UNPACKED:   [[S_AND_SAVEEXEC_B64_:%[0-9]+]]:sreg_64_xexec = S_AND_SAVEEXEC_B64 killed [[S_AND_B64_1]], implicit-def $exec, implicit-def $scc, implicit $exec
  ; UNPACKED:   [[REG_SEQUENCE4:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY9]], %subreg.sub0, [[COPY10]], %subreg.sub1
  ; UNPACKED:   BUFFER_STORE_FORMAT_D16_X_gfx80_BOTHEN_exact [[COPY8]], [[REG_SEQUENCE4]], [[REG_SEQUENCE3]], [[V_READFIRSTLANE_B32_4]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (s16), align 1, addrspace 4)
  ; UNPACKED:   $exec = S_XOR_B64_term $exec, [[S_AND_SAVEEXEC_B64_]], implicit-def $scc
  ; UNPACKED:   SI_WATERFALL_LOOP %bb.2, implicit $exec
  ; UNPACKED: bb.3:
  ; UNPACKED:   successors: %bb.4(0x80000000)
  ; UNPACKED:   $exec = S_MOV_B64_term [[S_MOV_B64_term]]
  ; UNPACKED: bb.4:
  ; UNPACKED:   S_ENDPGM 0
  ; PACKED-LABEL: name: struct_buffer_store_format_f16__sgpr_val__vgpr_rsrc__sgpr_vindex__sgpr_voffset__vgpr_soffset
  ; PACKED: bb.1 (%ir-block.0):
  ; PACKED:   successors: %bb.2(0x80000000)
  ; PACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4
  ; PACKED:   [[COPY:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; PACKED:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; PACKED:   [[COPY2:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; PACKED:   [[COPY3:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; PACKED:   [[COPY4:%[0-9]+]]:vgpr_32 = COPY $vgpr3
  ; PACKED:   [[REG_SEQUENCE:%[0-9]+]]:vreg_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; PACKED:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; PACKED:   [[COPY6:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; PACKED:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr4
  ; PACKED:   [[COPY8:%[0-9]+]]:vgpr_32 = COPY [[COPY]]
  ; PACKED:   [[COPY9:%[0-9]+]]:vgpr_32 = COPY [[COPY5]]
  ; PACKED:   [[COPY10:%[0-9]+]]:vgpr_32 = COPY [[COPY6]]
  ; PACKED:   [[COPY11:%[0-9]+]]:vreg_64 = COPY [[REG_SEQUENCE]].sub0_sub1
  ; PACKED:   [[COPY12:%[0-9]+]]:vreg_64 = COPY [[REG_SEQUENCE]].sub2_sub3
  ; PACKED:   [[S_MOV_B64_term:%[0-9]+]]:sreg_64_xexec = S_MOV_B64_term $exec
  ; PACKED: bb.2:
  ; PACKED:   successors: %bb.3(0x40000000), %bb.2(0x40000000)
  ; PACKED:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY11]].sub0, implicit $exec
  ; PACKED:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY11]].sub1, implicit $exec
  ; PACKED:   [[REG_SEQUENCE1:%[0-9]+]]:sreg_64_xexec = REG_SEQUENCE [[V_READFIRSTLANE_B32_]], %subreg.sub0, [[V_READFIRSTLANE_B32_1]], %subreg.sub1
  ; PACKED:   [[V_CMP_EQ_U64_e64_:%[0-9]+]]:sreg_64_xexec = V_CMP_EQ_U64_e64 [[REG_SEQUENCE1]], [[COPY11]], implicit $exec
  ; PACKED:   [[V_READFIRSTLANE_B32_2:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY12]].sub0, implicit $exec
  ; PACKED:   [[V_READFIRSTLANE_B32_3:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY12]].sub1, implicit $exec
  ; PACKED:   [[REG_SEQUENCE2:%[0-9]+]]:sreg_64_xexec = REG_SEQUENCE [[V_READFIRSTLANE_B32_2]], %subreg.sub0, [[V_READFIRSTLANE_B32_3]], %subreg.sub1
  ; PACKED:   [[V_CMP_EQ_U64_e64_1:%[0-9]+]]:sreg_64_xexec = V_CMP_EQ_U64_e64 [[REG_SEQUENCE2]], [[COPY12]], implicit $exec
  ; PACKED:   [[S_AND_B64_:%[0-9]+]]:sreg_64_xexec = S_AND_B64 [[V_CMP_EQ_U64_e64_1]], [[V_CMP_EQ_U64_e64_]], implicit-def $scc
  ; PACKED:   [[REG_SEQUENCE3:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[V_READFIRSTLANE_B32_]], %subreg.sub0, [[V_READFIRSTLANE_B32_1]], %subreg.sub1, [[V_READFIRSTLANE_B32_2]], %subreg.sub2, [[V_READFIRSTLANE_B32_3]], %subreg.sub3
  ; PACKED:   [[V_READFIRSTLANE_B32_4:%[0-9]+]]:sreg_32_xm0 = V_READFIRSTLANE_B32 [[COPY7]], implicit $exec
  ; PACKED:   [[V_CMP_EQ_U32_e64_:%[0-9]+]]:sreg_64_xexec = V_CMP_EQ_U32_e64 [[V_READFIRSTLANE_B32_4]], [[COPY7]], implicit $exec
  ; PACKED:   [[S_AND_B64_1:%[0-9]+]]:sreg_64_xexec = S_AND_B64 [[V_CMP_EQ_U32_e64_]], [[S_AND_B64_]], implicit-def $scc
  ; PACKED:   [[S_AND_SAVEEXEC_B64_:%[0-9]+]]:sreg_64_xexec = S_AND_SAVEEXEC_B64 killed [[S_AND_B64_1]], implicit-def $exec, implicit-def $scc, implicit $exec
  ; PACKED:   [[REG_SEQUENCE4:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY9]], %subreg.sub0, [[COPY10]], %subreg.sub1
  ; PACKED:   BUFFER_STORE_FORMAT_D16_X_BOTHEN_exact [[COPY8]], [[REG_SEQUENCE4]], [[REG_SEQUENCE3]], [[V_READFIRSTLANE_B32_4]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (s16), align 1, addrspace 4)
  ; PACKED:   $exec = S_XOR_B64_term $exec, [[S_AND_SAVEEXEC_B64_]], implicit-def $scc
  ; PACKED:   SI_WATERFALL_LOOP %bb.2, implicit $exec
  ; PACKED: bb.3:
  ; PACKED:   successors: %bb.4(0x80000000)
  ; PACKED:   $exec = S_MOV_B64_term [[S_MOV_B64_term]]
  ; PACKED: bb.4:
  ; PACKED:   S_ENDPGM 0
  call void @llvm.amdgcn.struct.buffer.store.format.f16(half %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @struct_buffer_store_format_i16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset(i16 %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; UNPACKED-LABEL: name: struct_buffer_store_format_i16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; UNPACKED: bb.1 (%ir-block.0):
  ; UNPACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2
  ; UNPACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; UNPACKED:   [[COPY1:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; UNPACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; UNPACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; UNPACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; UNPACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; UNPACKED:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; UNPACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; UNPACKED:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; UNPACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY6]], %subreg.sub1
  ; UNPACKED:   BUFFER_STORE_FORMAT_D16_X_gfx80_BOTHEN_exact [[COPY]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], [[COPY7]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (s16), align 1, addrspace 4)
  ; UNPACKED:   S_ENDPGM 0
  ; PACKED-LABEL: name: struct_buffer_store_format_i16__vgpr_val__sgpr_rsrc__vgpr_vindex__vgpr_voffset__sgpr_soffset
  ; PACKED: bb.1 (%ir-block.0):
  ; PACKED:   liveins: $sgpr2, $sgpr3, $sgpr4, $sgpr5, $sgpr6, $vgpr0, $vgpr1, $vgpr2
  ; PACKED:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; PACKED:   [[COPY1:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; PACKED:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; PACKED:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; PACKED:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr5
  ; PACKED:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY1]], %subreg.sub0, [[COPY2]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY4]], %subreg.sub3
  ; PACKED:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; PACKED:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; PACKED:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr6
  ; PACKED:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY6]], %subreg.sub1
  ; PACKED:   BUFFER_STORE_FORMAT_D16_X_BOTHEN_exact [[COPY]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], [[COPY7]], 0, 0, 0, 0, implicit $exec :: (dereferenceable store (s16), align 1, addrspace 4)
  ; PACKED:   S_ENDPGM 0
  call void @llvm.amdgcn.struct.buffer.store.format.i16(i16 %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

declare void @llvm.amdgcn.struct.buffer.store.format.f16(half, <4 x i32>, i32, i32, i32, i32 immarg)
declare void @llvm.amdgcn.struct.buffer.store.format.v2f16(<2 x half>, <4 x i32>, i32, i32, i32, i32 immarg)
declare void @llvm.amdgcn.struct.buffer.store.format.v3f16(<3 x half>, <4 x i32>, i32, i32, i32, i32 immarg)
declare void @llvm.amdgcn.struct.buffer.store.format.v4f16(<4 x half>, <4 x i32>, i32, i32, i32, i32 immarg)
declare void @llvm.amdgcn.struct.buffer.store.format.i16(i16, <4 x i32>, i32, i32, i32, i32 immarg)
