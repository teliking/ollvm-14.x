; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -march=amdgcn -verify-machineinstrs < %s | FileCheck %s

define amdgpu_cs i32 @test_shl_1(i32 inreg %arg1) {
; CHECK-LABEL: test_shl_1:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_lshl_b32 s0, s0, 5
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = shl i32 %arg1, 2
  %z2 = shl i32 %z1, 3
  ret i32 %z2
}

define amdgpu_cs i32 @test_shl_2(i32 inreg %arg1) {
; CHECK-LABEL: test_shl_2:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_lshl_b32 s0, s0, 10
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = shl i32 %arg1, 1
  %z2 = shl i32 %z1, 2
  %z3 = shl i32 %z2, 3
  %z4 = shl i32 %z3, 4
  ret i32 %z4
}

define amdgpu_cs i32 @test_shl_i32(i32 inreg %arg1) {
; CHECK-LABEL: test_shl_i32:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_mov_b32 s0, 0
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = shl i32 %arg1, 10
  %z2 = shl i32 %z1, 10
  %z3 = shl i32 %z2, 10
  %z4 = shl i32 %z3, 10
  ret i32 %z4
}

define amdgpu_cs i64 @test_shl_i64(i64 inreg %arg1) {
; CHECK-LABEL: test_shl_i64:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_mov_b32 s0, 0
; CHECK-NEXT:    s_mov_b32 s1, 0
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = shl i64 %arg1, 10
  %z2 = shl i64 %z1, 10
  %z3 = shl i64 %z2, 10
  %z4 = shl i64 %z3, 10
  %z5 = shl i64 %z4, 10
  %z6 = shl i64 %z5, 10
  %z7 = shl i64 %z6, 10
  ret i64 %z7
}

define amdgpu_cs i32 @test_ashr_1(i32 inreg %arg1) {
; CHECK-LABEL: test_ashr_1:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_ashr_i32 s0, s0, 5
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = ashr i32 %arg1, 2
  %z2 = ashr i32 %z1, 3
  ret i32 %z2
}

define amdgpu_cs i32 @test_ashr_2(i32 inreg %arg1) {
; CHECK-LABEL: test_ashr_2:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_ashr_i32 s0, s0, 10
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = ashr i32 %arg1, 1
  %z2 = ashr i32 %z1, 2
  %z3 = ashr i32 %z2, 3
  %z4 = ashr i32 %z3, 4
  ret i32 %z4
}

define amdgpu_cs i32 @test_ashr_i32(i32 inreg %arg1) {
; CHECK-LABEL: test_ashr_i32:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_ashr_i32 s0, s0, 31
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = ashr i32 %arg1, 10
  %z2 = ashr i32 %z1, 10
  %z3 = ashr i32 %z2, 10
  %z4 = ashr i32 %z3, 10
  ret i32 %z4
}

define amdgpu_cs i64 @test_ashr_i64(i64 inreg %arg1) {
; CHECK-LABEL: test_ashr_i64:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_ashr_i32 s0, s1, 31
; CHECK-NEXT:    s_mov_b32 s1, s0
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = ashr i64 %arg1, 10
  %z2 = ashr i64 %z1, 10
  %z3 = ashr i64 %z2, 10
  %z4 = ashr i64 %z3, 10
  %z5 = ashr i64 %z4, 10
  %z6 = ashr i64 %z5, 10
  %z7 = ashr i64 %z6, 10
  ret i64 %z7
}

define amdgpu_cs i32 @test_lshr_1(i32 inreg %arg1) {
; CHECK-LABEL: test_lshr_1:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_lshr_b32 s0, s0, 5
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = lshr i32 %arg1, 2
  %z2 = lshr i32 %z1, 3
  ret i32 %z2
}

define amdgpu_cs i32 @test_lshr_2(i32 inreg %arg1) {
; CHECK-LABEL: test_lshr_2:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_lshr_b32 s0, s0, 10
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = lshr i32 %arg1, 1
  %z2 = lshr i32 %z1, 2
  %z3 = lshr i32 %z2, 3
  %z4 = lshr i32 %z3, 4
  ret i32 %z4
}

define amdgpu_cs i32 @test_lshr_i32(i32 inreg %arg1) {
; CHECK-LABEL: test_lshr_i32:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_mov_b32 s0, 0
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = lshr i32 %arg1, 10
  %z2 = lshr i32 %z1, 10
  %z3 = lshr i32 %z2, 10
  %z4 = lshr i32 %z3, 10
  ret i32 %z4
}

define amdgpu_cs i64 @test_lshr_i64(i64 inreg %arg1) {
; CHECK-LABEL: test_lshr_i64:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    s_mov_b32 s0, 0
; CHECK-NEXT:    s_mov_b32 s1, 0
; CHECK-NEXT:    ; return to shader part epilog
.entry:
  %z1 = lshr i64 %arg1, 10
  %z2 = lshr i64 %z1, 10
  %z3 = lshr i64 %z2, 10
  %z4 = lshr i64 %z3, 10
  %z5 = lshr i64 %z4, 10
  %z6 = lshr i64 %z5, 10
  %z7 = lshr i64 %z6, 10
  ret i64 %z7
}
