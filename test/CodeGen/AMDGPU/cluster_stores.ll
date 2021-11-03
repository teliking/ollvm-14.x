; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx900 -mattr=-xnack -verify-machineinstrs -debug-only=machine-scheduler < %s 2> %t | FileCheck --enable-var-scope --check-prefix=GFX9 %s
; RUN: FileCheck --enable-var-scope --check-prefix=DBG %s < %t
; RUN: llc -march=amdgcn -mcpu=gfx1010 -verify-machineinstrs -debug-only=machine-scheduler < %s 2> %t | FileCheck --enable-var-scope --check-prefix=GFX10 %s
; RUN: FileCheck --enable-var-scope --check-prefix=DBG %s < %t
; REQUIRES: asserts

; FIXME: Verifier error with xnack enabled.

; DBG-LABEL: cluster_load_cluster_store:

; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 8
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 8
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4

; DBG: Cluster ld/st SU(1) - SU(2)

; DBG: Cluster ld/st SU([[L1:[0-9]+]]) - SU([[L2:[0-9]+]])
; DBG: Cluster ld/st SU([[L2]]) - SU([[L3:[0-9]+]])
; DBG: Cluster ld/st SU([[L3]]) - SU([[L4:[0-9]+]])

; DBG-NOT: Cluster ld/st

define amdgpu_kernel void @cluster_load_cluster_store(i32* noalias %lb, i32* noalias %sb) {
; GFX9-LABEL: cluster_load_cluster_store:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x2c
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v0, s2
; GFX9-NEXT:    v_mov_b32_e32 v1, s3
; GFX9-NEXT:    flat_load_dword v2, v[0:1]
; GFX9-NEXT:    flat_load_dword v3, v[0:1] offset:8
; GFX9-NEXT:    flat_load_dword v4, v[0:1] offset:16
; GFX9-NEXT:    flat_load_dword v5, v[0:1] offset:24
; GFX9-NEXT:    v_mov_b32_e32 v0, s0
; GFX9-NEXT:    v_mov_b32_e32 v1, s1
; GFX9-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(0)
; GFX9-NEXT:    flat_store_dword v[0:1], v2
; GFX9-NEXT:    flat_store_dword v[0:1], v3 offset:8
; GFX9-NEXT:    flat_store_dword v[0:1], v4 offset:16
; GFX9-NEXT:    flat_store_dword v[0:1], v5 offset:24
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: cluster_load_cluster_store:
; GFX10:       ; %bb.0: ; %bb
; GFX10-NEXT:    s_clause 0x1
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX10-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_add_u32 s0, s2, 8
; GFX10-NEXT:    s_addc_u32 s1, s3, 0
; GFX10-NEXT:    s_add_u32 s6, s2, 16
; GFX10-NEXT:    v_mov_b32_e32 v3, s1
; GFX10-NEXT:    s_addc_u32 s7, s3, 0
; GFX10-NEXT:    v_mov_b32_e32 v0, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, s0
; GFX10-NEXT:    s_add_u32 s0, s2, 24
; GFX10-NEXT:    v_mov_b32_e32 v1, s3
; GFX10-NEXT:    s_addc_u32 s1, s3, 0
; GFX10-NEXT:    v_mov_b32_e32 v4, s6
; GFX10-NEXT:    v_mov_b32_e32 v5, s7
; GFX10-NEXT:    v_mov_b32_e32 v7, s1
; GFX10-NEXT:    v_mov_b32_e32 v6, s0
; GFX10-NEXT:    s_clause 0x3
; GFX10-NEXT:    flat_load_dword v8, v[0:1]
; GFX10-NEXT:    flat_load_dword v9, v[2:3]
; GFX10-NEXT:    flat_load_dword v10, v[4:5]
; GFX10-NEXT:    flat_load_dword v11, v[6:7]
; GFX10-NEXT:    s_add_u32 s0, s4, 8
; GFX10-NEXT:    s_addc_u32 s1, s5, 0
; GFX10-NEXT:    v_mov_b32_e32 v0, s4
; GFX10-NEXT:    v_mov_b32_e32 v3, s1
; GFX10-NEXT:    v_mov_b32_e32 v2, s0
; GFX10-NEXT:    s_add_u32 s0, s4, 16
; GFX10-NEXT:    s_addc_u32 s1, s5, 0
; GFX10-NEXT:    s_add_u32 s2, s4, 24
; GFX10-NEXT:    v_mov_b32_e32 v1, s5
; GFX10-NEXT:    s_addc_u32 s3, s5, 0
; GFX10-NEXT:    v_mov_b32_e32 v5, s1
; GFX10-NEXT:    v_mov_b32_e32 v4, s0
; GFX10-NEXT:    v_mov_b32_e32 v7, s3
; GFX10-NEXT:    v_mov_b32_e32 v6, s2
; GFX10-NEXT:    s_waitcnt vmcnt(3) lgkmcnt(3)
; GFX10-NEXT:    flat_store_dword v[0:1], v8
; GFX10-NEXT:    s_waitcnt vmcnt(2) lgkmcnt(3)
; GFX10-NEXT:    flat_store_dword v[2:3], v9
; GFX10-NEXT:    s_waitcnt vmcnt(1) lgkmcnt(3)
; GFX10-NEXT:    flat_store_dword v[4:5], v10
; GFX10-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(3)
; GFX10-NEXT:    flat_store_dword v[6:7], v11
; GFX10-NEXT:    s_endpgm
bb:
  %la0 = getelementptr inbounds i32, i32* %lb, i32 0
  %ld0 = load i32, i32* %la0
  %la1 = getelementptr inbounds i32, i32* %lb, i32 2
  %ld1 = load i32, i32* %la1
  %la2 = getelementptr inbounds i32, i32* %lb, i32 4
  %ld2 = load i32, i32* %la2
  %la3 = getelementptr inbounds i32, i32* %lb, i32 6
  %ld3 = load i32, i32* %la3

  %sa0 = getelementptr inbounds i32, i32* %sb, i32 0
  store i32 %ld0, i32* %sa0
  %sa1 = getelementptr inbounds i32, i32* %sb, i32 2
  store i32 %ld1, i32* %sa1
  %sa2 = getelementptr inbounds i32, i32* %sb, i32 4
  store i32 %ld2, i32* %sa2
  %sa3 = getelementptr inbounds i32, i32* %sb, i32 6
  store i32 %ld3, i32* %sa3

  ret void
}

; DBG-LABEL: cluster_load_valu_cluster_store:

; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 8
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 8
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 4

; DBG: Cluster ld/st SU(1) - SU(2)

; DBG: Cluster ld/st SU([[L1:[0-9]+]]) - SU([[L2:[0-9]+]])
; DBG: Cluster ld/st SU([[L2]]) - SU([[L3:[0-9]+]])
; DBG: Cluster ld/st SU([[L3]]) - SU([[L4:[0-9]+]])

; DBG-NOT: Cluster ld/st

define amdgpu_kernel void @cluster_load_valu_cluster_store(i32* noalias %lb, i32* noalias %sb) {
; GFX9-LABEL: cluster_load_valu_cluster_store:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x2c
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v0, s2
; GFX9-NEXT:    v_mov_b32_e32 v1, s3
; GFX9-NEXT:    flat_load_dword v2, v[0:1]
; GFX9-NEXT:    flat_load_dword v3, v[0:1] offset:8
; GFX9-NEXT:    flat_load_dword v4, v[0:1] offset:16
; GFX9-NEXT:    flat_load_dword v5, v[0:1] offset:24
; GFX9-NEXT:    v_mov_b32_e32 v0, s0
; GFX9-NEXT:    v_mov_b32_e32 v1, s1
; GFX9-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(0)
; GFX9-NEXT:    flat_store_dword v[0:1], v2
; GFX9-NEXT:    v_add_u32_e32 v2, 1, v3
; GFX9-NEXT:    flat_store_dword v[0:1], v4 offset:16
; GFX9-NEXT:    flat_store_dword v[0:1], v2 offset:8
; GFX9-NEXT:    flat_store_dword v[0:1], v5 offset:24
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: cluster_load_valu_cluster_store:
; GFX10:       ; %bb.0: ; %bb
; GFX10-NEXT:    s_clause 0x1
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX10-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_add_u32 s0, s2, 8
; GFX10-NEXT:    s_addc_u32 s1, s3, 0
; GFX10-NEXT:    s_add_u32 s6, s2, 16
; GFX10-NEXT:    v_mov_b32_e32 v3, s1
; GFX10-NEXT:    v_mov_b32_e32 v2, s0
; GFX10-NEXT:    s_addc_u32 s7, s3, 0
; GFX10-NEXT:    s_add_u32 s0, s2, 24
; GFX10-NEXT:    v_mov_b32_e32 v0, s2
; GFX10-NEXT:    s_addc_u32 s1, s3, 0
; GFX10-NEXT:    v_mov_b32_e32 v1, s3
; GFX10-NEXT:    v_mov_b32_e32 v4, s6
; GFX10-NEXT:    v_mov_b32_e32 v5, s7
; GFX10-NEXT:    flat_load_dword v6, v[2:3]
; GFX10-NEXT:    v_mov_b32_e32 v3, s1
; GFX10-NEXT:    v_mov_b32_e32 v2, s0
; GFX10-NEXT:    s_clause 0x2
; GFX10-NEXT:    flat_load_dword v8, v[0:1]
; GFX10-NEXT:    flat_load_dword v9, v[4:5]
; GFX10-NEXT:    flat_load_dword v10, v[2:3]
; GFX10-NEXT:    s_add_u32 s0, s4, 8
; GFX10-NEXT:    s_addc_u32 s1, s5, 0
; GFX10-NEXT:    s_add_u32 s2, s4, 16
; GFX10-NEXT:    v_mov_b32_e32 v3, s1
; GFX10-NEXT:    s_addc_u32 s3, s5, 0
; GFX10-NEXT:    v_mov_b32_e32 v0, s4
; GFX10-NEXT:    v_mov_b32_e32 v2, s0
; GFX10-NEXT:    s_add_u32 s0, s4, 24
; GFX10-NEXT:    v_mov_b32_e32 v1, s5
; GFX10-NEXT:    v_mov_b32_e32 v5, s3
; GFX10-NEXT:    s_addc_u32 s1, s5, 0
; GFX10-NEXT:    v_mov_b32_e32 v4, s2
; GFX10-NEXT:    s_waitcnt vmcnt(3) lgkmcnt(3)
; GFX10-NEXT:    v_add_nc_u32_e32 v11, 1, v6
; GFX10-NEXT:    v_mov_b32_e32 v7, s1
; GFX10-NEXT:    v_mov_b32_e32 v6, s0
; GFX10-NEXT:    s_waitcnt vmcnt(2) lgkmcnt(2)
; GFX10-NEXT:    flat_store_dword v[0:1], v8
; GFX10-NEXT:    s_waitcnt vmcnt(1) lgkmcnt(2)
; GFX10-NEXT:    flat_store_dword v[4:5], v9
; GFX10-NEXT:    flat_store_dword v[2:3], v11
; GFX10-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(3)
; GFX10-NEXT:    flat_store_dword v[6:7], v10
; GFX10-NEXT:    s_endpgm
bb:
  %la0 = getelementptr inbounds i32, i32* %lb, i32 0
  %ld0 = load i32, i32* %la0
  %la1 = getelementptr inbounds i32, i32* %lb, i32 2
  %ld1 = load i32, i32* %la1
  %la2 = getelementptr inbounds i32, i32* %lb, i32 4
  %ld2 = load i32, i32* %la2
  %la3 = getelementptr inbounds i32, i32* %lb, i32 6
  %ld3 = load i32, i32* %la3

  %sa0 = getelementptr inbounds i32, i32* %sb, i32 0
  store i32 %ld0, i32* %sa0
  %sa1 = getelementptr inbounds i32, i32* %sb, i32 2
  %add = add i32 %ld1, 1
  store i32 %add, i32* %sa1
  %sa2 = getelementptr inbounds i32, i32* %sb, i32 4
  store i32 %ld2, i32* %sa2
  %sa3 = getelementptr inbounds i32, i32* %sb, i32 6
  store i32 %ld3, i32* %sa3

  ret void
}

; Cluster loads from the same texture with different coordinates
; DBG-LABEL: cluster_image_load:
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 16
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 16
; DBG: {{^}}Cluster ld/st [[SU1:SU\([0-9]+\)]] - [[SU2:SU\([0-9]+\)]]
; DBG: {{^}}[[SU1]]: {{.*}} IMAGE_LOAD
; DBG: {{^}}[[SU2]]: {{.*}} IMAGE_LOAD
define amdgpu_ps void @cluster_image_load(<8 x i32> inreg %src, <8 x i32> inreg %dst, i32 %x, i32 %y) {
; GFX9-LABEL: cluster_image_load:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    v_add_u32_e32 v2, 1, v0
; GFX9-NEXT:    v_add_u32_e32 v3, 1, v1
; GFX9-NEXT:    v_add_u32_e32 v6, 2, v0
; GFX9-NEXT:    v_add_u32_e32 v7, 2, v1
; GFX9-NEXT:    image_load v[2:5], v[2:3], s[0:7] dmask:0xf unorm
; GFX9-NEXT:    image_load v[6:9], v[6:7], s[0:7] dmask:0xf unorm
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_add_f32_e32 v5, v5, v9
; GFX9-NEXT:    v_add_f32_e32 v4, v4, v8
; GFX9-NEXT:    v_add_f32_e32 v3, v3, v7
; GFX9-NEXT:    v_add_f32_e32 v2, v2, v6
; GFX9-NEXT:    image_store v[2:5], v[0:1], s[8:15] dmask:0xf unorm
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: cluster_image_load:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    v_add_nc_u32_e32 v10, 1, v0
; GFX10-NEXT:    v_add_nc_u32_e32 v11, 1, v1
; GFX10-NEXT:    v_add_nc_u32_e32 v12, 2, v0
; GFX10-NEXT:    v_add_nc_u32_e32 v13, 2, v1
; GFX10-NEXT:    s_clause 0x1
; GFX10-NEXT:    image_load v[2:5], v[10:11], s[0:7] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    image_load v[6:9], v[12:13], s[0:7] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    v_add_f32_e32 v5, v5, v9
; GFX10-NEXT:    v_add_f32_e32 v4, v4, v8
; GFX10-NEXT:    v_add_f32_e32 v3, v3, v7
; GFX10-NEXT:    v_add_f32_e32 v2, v2, v6
; GFX10-NEXT:    image_store v[2:5], v[0:1], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    s_endpgm
entry:
  %x1 = add i32 %x, 1
  %y1 = add i32 %y, 1
  %val1 = call <4 x float> @llvm.amdgcn.image.load.mip.2d.v4f32.i32(i32 15, i32 %x1, i32 %y1, i32 0, <8 x i32> %src, i32 0, i32 0)
  %x2 = add i32 %x, 2
  %y2 = add i32 %y, 2
  %val2 = call <4 x float> @llvm.amdgcn.image.load.mip.2d.v4f32.i32(i32 15, i32 %x2, i32 %y2, i32 0, <8 x i32> %src, i32 0, i32 0)
  %val = fadd fast <4 x float> %val1, %val2
  call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %val, i32 15, i32 %x, i32 %y, <8 x i32> %dst, i32 0, i32 0)
  ret void
}

; Don't cluster loads from different textures
; DBG-LABEL: no_cluster_image_load:
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 16
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 16
; DBG-NOT: {{^}}Cluster ld/st
define amdgpu_ps void @no_cluster_image_load(<8 x i32> inreg %src1, <8 x i32> inreg %src2, <8 x i32> inreg %dst, i32 %x, i32 %y) {
; GFX9-LABEL: no_cluster_image_load:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    image_load v[2:5], v[0:1], s[0:7] dmask:0xf unorm
; GFX9-NEXT:    image_load v[6:9], v[0:1], s[8:15] dmask:0xf unorm
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_add_f32_e32 v5, v5, v9
; GFX9-NEXT:    v_add_f32_e32 v4, v4, v8
; GFX9-NEXT:    v_add_f32_e32 v3, v3, v7
; GFX9-NEXT:    v_add_f32_e32 v2, v2, v6
; GFX9-NEXT:    image_store v[2:5], v[0:1], s[16:23] dmask:0xf unorm
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: no_cluster_image_load:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    image_load v[2:5], v[0:1], s[0:7] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    image_load v[6:9], v[0:1], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    v_add_f32_e32 v5, v5, v9
; GFX10-NEXT:    v_add_f32_e32 v4, v4, v8
; GFX10-NEXT:    v_add_f32_e32 v3, v3, v7
; GFX10-NEXT:    v_add_f32_e32 v2, v2, v6
; GFX10-NEXT:    image_store v[2:5], v[0:1], s[16:23] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    s_endpgm
entry:
  %val1 = call <4 x float> @llvm.amdgcn.image.load.mip.2d.v4f32.i32(i32 15, i32 %x, i32 %y, i32 0, <8 x i32> %src1, i32 0, i32 0)
  %val2 = call <4 x float> @llvm.amdgcn.image.load.mip.2d.v4f32.i32(i32 15, i32 %x, i32 %y, i32 0, <8 x i32> %src2, i32 0, i32 0)
  %val = fadd fast <4 x float> %val1, %val2
  call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %val, i32 15, i32 %x, i32 %y, <8 x i32> %dst, i32 0, i32 0)
  ret void
}

; Cluster loads from the same texture and sampler with different coordinates
; DBG-LABEL: cluster_image_sample:
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 16
; DBG: Num BaseOps: {{[1-9]+}}, Offset: {{[0-9]+}}, OffsetIsScalable: {{[01]}}, Width: 16
; DBG: {{^}}Cluster ld/st [[SU1:SU\([0-9]+\)]] - [[SU2:SU\([0-9]+\)]]
; DBG: {{^}}[[SU1]]: {{.*}} IMAGE_SAMPLE
; DBG: {{^}}[[SU2]]: {{.*}} IMAGE_SAMPLE
define amdgpu_ps void @cluster_image_sample(<8 x i32> inreg %src, <4 x i32> inreg %smp, <8 x i32> inreg %dst, i32 %x, i32 %y) {
; GFX9-LABEL: cluster_image_sample:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    v_cvt_f32_i32_e32 v8, v0
; GFX9-NEXT:    v_cvt_f32_i32_e32 v9, v1
; GFX9-NEXT:    v_mov_b32_e32 v4, 0
; GFX9-NEXT:    v_mov_b32_e32 v5, v4
; GFX9-NEXT:    v_add_f32_e32 v2, 1.0, v8
; GFX9-NEXT:    v_add_f32_e32 v3, 1.0, v9
; GFX9-NEXT:    v_mov_b32_e32 v6, v4
; GFX9-NEXT:    v_mov_b32_e32 v7, v4
; GFX9-NEXT:    v_add_f32_e32 v8, 2.0, v8
; GFX9-NEXT:    v_add_f32_e32 v9, 2.0, v9
; GFX9-NEXT:    v_mov_b32_e32 v10, 1.0
; GFX9-NEXT:    v_mov_b32_e32 v11, v10
; GFX9-NEXT:    v_mov_b32_e32 v12, v10
; GFX9-NEXT:    v_mov_b32_e32 v13, v10
; GFX9-NEXT:    image_sample_d v[2:5], v[2:7], s[0:7], s[8:11] dmask:0xf
; GFX9-NEXT:    image_sample_d v[6:9], v[8:13], s[0:7], s[8:11] dmask:0xf
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_add_f32_e32 v5, v5, v9
; GFX9-NEXT:    v_add_f32_e32 v4, v4, v8
; GFX9-NEXT:    v_add_f32_e32 v3, v3, v7
; GFX9-NEXT:    v_add_f32_e32 v2, v2, v6
; GFX9-NEXT:    image_store v[2:5], v[0:1], s[12:19] dmask:0xf unorm
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: cluster_image_sample:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    v_cvt_f32_i32_e32 v8, v0
; GFX10-NEXT:    v_cvt_f32_i32_e32 v9, v1
; GFX10-NEXT:    v_mov_b32_e32 v4, 0
; GFX10-NEXT:    v_mov_b32_e32 v10, 1.0
; GFX10-NEXT:    v_add_f32_e32 v2, 1.0, v8
; GFX10-NEXT:    v_add_f32_e32 v3, 1.0, v9
; GFX10-NEXT:    v_mov_b32_e32 v5, v4
; GFX10-NEXT:    v_mov_b32_e32 v6, v4
; GFX10-NEXT:    v_mov_b32_e32 v7, v4
; GFX10-NEXT:    v_add_f32_e32 v8, 2.0, v8
; GFX10-NEXT:    v_add_f32_e32 v9, 2.0, v9
; GFX10-NEXT:    v_mov_b32_e32 v11, v10
; GFX10-NEXT:    v_mov_b32_e32 v12, v10
; GFX10-NEXT:    v_mov_b32_e32 v13, v10
; GFX10-NEXT:    s_clause 0x1
; GFX10-NEXT:    image_sample_d v[14:17], v[2:7], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D
; GFX10-NEXT:    image_sample_d v[18:21], v[8:13], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    v_add_f32_e32 v5, v17, v21
; GFX10-NEXT:    v_add_f32_e32 v4, v16, v20
; GFX10-NEXT:    v_add_f32_e32 v3, v15, v19
; GFX10-NEXT:    v_add_f32_e32 v2, v14, v18
; GFX10-NEXT:    image_store v[2:5], v[0:1], s[12:19] dmask:0xf dim:SQ_RSRC_IMG_2D unorm
; GFX10-NEXT:    s_endpgm
entry:
  %s = sitofp i32 %x to float
  %t = sitofp i32 %y to float
  %s1 = fadd float %s, 1.0
  %t1 = fadd float %t, 1.0
  %val1 = call <4 x float> @llvm.amdgcn.image.sample.d.2d.v4f32.f32(i32 15, float %s1, float %t1, float 0.0, float 0.0, float 0.0, float 0.0, <8 x i32> %src, <4 x i32> %smp, i1 false, i32 0, i32 0)
  %s2 = fadd float %s, 2.0
  %t2 = fadd float %t, 2.0
  %val2 = call <4 x float> @llvm.amdgcn.image.sample.d.2d.v4f32.f32(i32 15, float %s2, float %t2, float 1.0, float 1.0, float 1.0, float 1.0, <8 x i32> %src, <4 x i32> %smp, i1 false, i32 0, i32 0)
  %val = fadd fast <4 x float> %val1, %val2
  call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %val, i32 15, i32 %x, i32 %y, <8 x i32> %dst, i32 0, i32 0)
  ret void
}

declare <4 x float> @llvm.amdgcn.image.load.mip.2d.v4f32.i32(i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg)
declare <4 x float> @llvm.amdgcn.image.sample.d.2d.v4f32.f32(i32, float, float, float, float, float, float, <8 x i32>, <4 x i32>, i1, i32, i32)
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg)
