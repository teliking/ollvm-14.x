; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx900 < %s | FileCheck %s

define i16 @csh_16(i16 %a, i16 %b) {
; CHECK-LABEL: csh_16:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_lshlrev_b16_e32 v2, v1, v0
; CHECK-NEXT:    v_lshrrev_b16_e32 v3, v1, v0
; CHECK-NEXT:    v_ashrrev_i16_e32 v0, v1, v0
; CHECK-NEXT:    v_add_u16_e32 v1, v2, v3
; CHECK-NEXT:    v_add_u16_e32 v0, v1, v0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %and = and i16 %b, 15
  %shl = shl i16 %a, %and
  %lshr = lshr i16 %a, %and
  %ashr = ashr i16 %a, %and
  %ret.0 = add i16 %shl, %lshr
  %ret = add i16 %ret.0, %ashr
  ret i16 %ret
}

define i32 @csh_32(i32 %a, i32 %b) {
; CHECK-LABEL: csh_32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_lshlrev_b32_e32 v2, v1, v0
; CHECK-NEXT:    v_lshrrev_b32_e32 v3, v1, v0
; CHECK-NEXT:    v_ashrrev_i32_e32 v0, v1, v0
; CHECK-NEXT:    v_add3_u32 v0, v2, v3, v0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %and = and i32 %b, 31
  %shl = shl i32 %a, %and
  %lshr = lshr i32 %a, %and
  %ashr = ashr i32 %a, %and
  %ret.0 = add i32 %shl, %lshr
  %ret = add i32 %ret.0, %ashr
  ret i32 %ret
}

define amdgpu_ps i32 @s_csh_32(i32 inreg %a, i32 inreg %b) {
; CHECK-LABEL: s_csh_32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_lshl_b32 s2, s0, s1
; CHECK-NEXT:    s_lshr_b32 s3, s0, s1
; CHECK-NEXT:    s_ashr_i32 s0, s0, s1
; CHECK-NEXT:    s_add_i32 s1, s2, s3
; CHECK-NEXT:    s_add_i32 s0, s1, s0
; CHECK-NEXT:    ; return to shader part epilog
  %and = and i32 %b, 31
  %shl = shl i32 %a, %and
  %lshr = lshr i32 %a, %and
  %ashr = ashr i32 %a, %and
  %ret.0 = add i32 %shl, %lshr
  %ret = add i32 %ret.0, %ashr
  ret i32 %ret
}

define <4 x i32> @csh_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: csh_v4i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_lshlrev_b32_e32 v8, v7, v3
; CHECK-NEXT:    v_lshlrev_b32_e32 v9, v6, v2
; CHECK-NEXT:    v_lshlrev_b32_e32 v10, v5, v1
; CHECK-NEXT:    v_lshlrev_b32_e32 v11, v4, v0
; CHECK-NEXT:    v_lshrrev_b32_e32 v12, v7, v3
; CHECK-NEXT:    v_lshrrev_b32_e32 v13, v6, v2
; CHECK-NEXT:    v_lshrrev_b32_e32 v14, v5, v1
; CHECK-NEXT:    v_lshrrev_b32_e32 v15, v4, v0
; CHECK-NEXT:    v_ashrrev_i32_e32 v3, v7, v3
; CHECK-NEXT:    v_ashrrev_i32_e32 v2, v6, v2
; CHECK-NEXT:    v_ashrrev_i32_e32 v1, v5, v1
; CHECK-NEXT:    v_ashrrev_i32_e32 v0, v4, v0
; CHECK-NEXT:    v_add3_u32 v0, v11, v15, v0
; CHECK-NEXT:    v_add3_u32 v1, v10, v14, v1
; CHECK-NEXT:    v_add3_u32 v2, v9, v13, v2
; CHECK-NEXT:    v_add3_u32 v3, v8, v12, v3
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %and = and <4 x i32> %b, <i32 31, i32 31, i32 31, i32 31>
  %shl = shl <4 x i32> %a, %and
  %lshr = lshr <4 x i32> %a, %and
  %ashr = ashr <4 x i32> %a, %and
  %ret.0 = add <4 x i32> %shl, %lshr
  %ret = add <4 x i32> %ret.0, %ashr
  ret <4 x i32> %ret
}

define amdgpu_ps <4 x i32> @s_csh_v4i32(<4 x i32> inreg %a, <4 x i32> inreg %b) {
; CHECK-LABEL: s_csh_v4i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_lshl_b32 s8, s0, s4
; CHECK-NEXT:    s_lshl_b32 s9, s1, s5
; CHECK-NEXT:    s_lshl_b32 s10, s2, s6
; CHECK-NEXT:    s_lshl_b32 s11, s3, s7
; CHECK-NEXT:    s_lshr_b32 s12, s0, s4
; CHECK-NEXT:    s_lshr_b32 s13, s1, s5
; CHECK-NEXT:    s_lshr_b32 s14, s2, s6
; CHECK-NEXT:    s_lshr_b32 s15, s3, s7
; CHECK-NEXT:    s_ashr_i32 s3, s3, s7
; CHECK-NEXT:    s_ashr_i32 s2, s2, s6
; CHECK-NEXT:    s_ashr_i32 s1, s1, s5
; CHECK-NEXT:    s_ashr_i32 s0, s0, s4
; CHECK-NEXT:    s_add_i32 s4, s11, s15
; CHECK-NEXT:    s_add_i32 s5, s10, s14
; CHECK-NEXT:    s_add_i32 s6, s9, s13
; CHECK-NEXT:    s_add_i32 s7, s8, s12
; CHECK-NEXT:    s_add_i32 s0, s7, s0
; CHECK-NEXT:    s_add_i32 s1, s6, s1
; CHECK-NEXT:    s_add_i32 s2, s5, s2
; CHECK-NEXT:    s_add_i32 s3, s4, s3
; CHECK-NEXT:    ; return to shader part epilog
  %and = and <4 x i32> %b, <i32 31, i32 31, i32 31, i32 31>
  %shl = shl <4 x i32> %a, %and
  %lshr = lshr <4 x i32> %a, %and
  %ashr = ashr <4 x i32> %a, %and
  %ret.0 = add <4 x i32> %shl, %lshr
  %ret = add <4 x i32> %ret.0, %ashr
  ret <4 x i32> %ret
}

define i64 @csh_64(i64 %a, i64 %b) {
; CHECK-LABEL: csh_64:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_lshlrev_b64 v[3:4], v2, v[0:1]
; CHECK-NEXT:    v_lshrrev_b64 v[5:6], v2, v[0:1]
; CHECK-NEXT:    v_ashrrev_i64 v[0:1], v2, v[0:1]
; CHECK-NEXT:    v_add_co_u32_e32 v2, vcc, v3, v5
; CHECK-NEXT:    v_addc_co_u32_e32 v3, vcc, v4, v6, vcc
; CHECK-NEXT:    v_add_co_u32_e32 v0, vcc, v2, v0
; CHECK-NEXT:    v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %and = and i64 %b, 63
  %shl = shl i64 %a, %and
  %lshr = lshr i64 %a, %and
  %ashr = ashr i64 %a, %and
  %ret.0 = add i64 %shl, %lshr
  %ret = add i64 %ret.0, %ashr
  ret i64 %ret
}

define amdgpu_ps i64 @s_csh_64(i64 inreg %a, i64 inreg %b) {
; CHECK-LABEL: s_csh_64:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_lshl_b64 s[4:5], s[0:1], s2
; CHECK-NEXT:    s_lshr_b64 s[6:7], s[0:1], s2
; CHECK-NEXT:    s_ashr_i64 s[0:1], s[0:1], s2
; CHECK-NEXT:    s_add_u32 s2, s4, s6
; CHECK-NEXT:    s_addc_u32 s3, s5, s7
; CHECK-NEXT:    s_add_u32 s0, s2, s0
; CHECK-NEXT:    s_addc_u32 s1, s3, s1
; CHECK-NEXT:    ; return to shader part epilog
  %and = and i64 %b, 63
  %shl = shl i64 %a, %and
  %lshr = lshr i64 %a, %and
  %ashr = ashr i64 %a, %and
  %ret.0 = add i64 %shl, %lshr
  %ret = add i64 %ret.0, %ashr
  ret i64 %ret
}

define i32 @cshl_or(i32 %a, i32 %b) {
; CHECK-LABEL: cshl_or:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_lshl_or_b32 v0, v0, v1, v0
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %and = and i32 %b, 31
  %shl = shl i32 %a, %and
  %or = or i32 %shl, %a
  ret i32 %or
}

define i32 @cshl_add(i32 %a, i32 %b, i32 %c) {
; CHECK-LABEL: cshl_add:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_lshl_add_u32 v0, v0, v1, v2
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %and = and i32 %b, 31
  %shl = shl i32 %a, %and
  %add = add i32 %shl, %c
  ret i32 %add
}

define i32 @add_cshl(i32 %a, i32 %b) {
; CHECK-LABEL: add_cshl:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_add_lshl_u32 v0, v0, v1, v1
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %add = add i32 %a, %b
  %and = and i32 %b, 31
  %shl = shl i32 %add, %and
  ret i32 %shl
}
