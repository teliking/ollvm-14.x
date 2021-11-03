; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-zfh -verify-machineinstrs \
; RUN:   -target-abi ilp32f < %s | FileCheck -check-prefix=RV32IZFH %s
; RUN: llc -mtriple=riscv32 -mattr=+d,+experimental-zfh -verify-machineinstrs \
; RUN:   -target-abi ilp32d < %s | FileCheck -check-prefix=RV32IDZFH %s
; RUN: llc -mtriple=riscv64 -mattr=+experimental-zfh -verify-machineinstrs \
; RUN:   -target-abi lp64f < %s | FileCheck -check-prefix=RV64IZFH %s
; RUN: llc -mtriple=riscv64 -mattr=+d,+experimental-zfh -verify-machineinstrs \
; RUN:   -target-abi lp64d < %s | FileCheck -check-prefix=RV64IDZFH %s

define i16 @fcvt_si_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_si_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_si_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_si_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.l.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_si_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.l.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
  %1 = fptosi half %a to i16
  ret i16 %1
}

define i16 @fcvt_si_h_sat(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_si_h_sat:
; RV32IZFH:       # %bb.0: # %start
; RV32IZFH-NEXT:    fcvt.s.h ft0, fa0
; RV32IZFH-NEXT:    feq.s a0, ft0, ft0
; RV32IZFH-NEXT:    bnez a0, .LBB1_2
; RV32IZFH-NEXT:  # %bb.1: # %start
; RV32IZFH-NEXT:    mv a0, zero
; RV32IZFH-NEXT:    ret
; RV32IZFH-NEXT:  .LBB1_2:
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI1_0)
; RV32IZFH-NEXT:    flw ft1, %lo(.LCPI1_0)(a0)
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI1_1)
; RV32IZFH-NEXT:    flw ft2, %lo(.LCPI1_1)(a0)
; RV32IZFH-NEXT:    fmax.s ft0, ft0, ft1
; RV32IZFH-NEXT:    fmin.s ft0, ft0, ft2
; RV32IZFH-NEXT:    fcvt.w.s a0, ft0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_si_h_sat:
; RV32IDZFH:       # %bb.0: # %start
; RV32IDZFH-NEXT:    fcvt.s.h ft0, fa0
; RV32IDZFH-NEXT:    feq.s a0, ft0, ft0
; RV32IDZFH-NEXT:    bnez a0, .LBB1_2
; RV32IDZFH-NEXT:  # %bb.1: # %start
; RV32IDZFH-NEXT:    mv a0, zero
; RV32IDZFH-NEXT:    ret
; RV32IDZFH-NEXT:  .LBB1_2:
; RV32IDZFH-NEXT:    lui a0, %hi(.LCPI1_0)
; RV32IDZFH-NEXT:    flw ft1, %lo(.LCPI1_0)(a0)
; RV32IDZFH-NEXT:    lui a0, %hi(.LCPI1_1)
; RV32IDZFH-NEXT:    flw ft2, %lo(.LCPI1_1)(a0)
; RV32IDZFH-NEXT:    fmax.s ft0, ft0, ft1
; RV32IDZFH-NEXT:    fmin.s ft0, ft0, ft2
; RV32IDZFH-NEXT:    fcvt.w.s a0, ft0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_si_h_sat:
; RV64IZFH:       # %bb.0: # %start
; RV64IZFH-NEXT:    fcvt.s.h ft0, fa0
; RV64IZFH-NEXT:    feq.s a0, ft0, ft0
; RV64IZFH-NEXT:    bnez a0, .LBB1_2
; RV64IZFH-NEXT:  # %bb.1: # %start
; RV64IZFH-NEXT:    mv a0, zero
; RV64IZFH-NEXT:    ret
; RV64IZFH-NEXT:  .LBB1_2:
; RV64IZFH-NEXT:    lui a0, %hi(.LCPI1_0)
; RV64IZFH-NEXT:    flw ft1, %lo(.LCPI1_0)(a0)
; RV64IZFH-NEXT:    lui a0, %hi(.LCPI1_1)
; RV64IZFH-NEXT:    flw ft2, %lo(.LCPI1_1)(a0)
; RV64IZFH-NEXT:    fmax.s ft0, ft0, ft1
; RV64IZFH-NEXT:    fmin.s ft0, ft0, ft2
; RV64IZFH-NEXT:    fcvt.l.s a0, ft0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_si_h_sat:
; RV64IDZFH:       # %bb.0: # %start
; RV64IDZFH-NEXT:    fcvt.s.h ft0, fa0
; RV64IDZFH-NEXT:    feq.s a0, ft0, ft0
; RV64IDZFH-NEXT:    bnez a0, .LBB1_2
; RV64IDZFH-NEXT:  # %bb.1: # %start
; RV64IDZFH-NEXT:    mv a0, zero
; RV64IDZFH-NEXT:    ret
; RV64IDZFH-NEXT:  .LBB1_2:
; RV64IDZFH-NEXT:    lui a0, %hi(.LCPI1_0)
; RV64IDZFH-NEXT:    flw ft1, %lo(.LCPI1_0)(a0)
; RV64IDZFH-NEXT:    lui a0, %hi(.LCPI1_1)
; RV64IDZFH-NEXT:    flw ft2, %lo(.LCPI1_1)(a0)
; RV64IDZFH-NEXT:    fmax.s ft0, ft0, ft1
; RV64IDZFH-NEXT:    fmin.s ft0, ft0, ft2
; RV64IDZFH-NEXT:    fcvt.l.s a0, ft0, rtz
; RV64IDZFH-NEXT:    ret
start:
  %0 = tail call i16 @llvm.fptosi.sat.i16.f16(half %a)
  ret i16 %0
}
declare i16 @llvm.fptosi.sat.i16.f16(half)

define i16 @fcvt_ui_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_ui_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_ui_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_ui_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.lu.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_ui_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.lu.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
  %1 = fptoui half %a to i16
  ret i16 %1
}

; Test where the fptoui has multiple uses, one of which causes a sext to be
; inserted on RV64.
; FIXME: We should not have an fcvt.wu.h and an fcvt.lu.h.
define i32 @fcvt_ui_h_multiple_use(half %x, i32* %y) {
; RV32IZFH-LABEL: fcvt_ui_h_multiple_use:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.wu.h a1, fa0, rtz
; RV32IZFH-NEXT:    addi a0, zero, 1
; RV32IZFH-NEXT:    beqz a1, .LBB3_2
; RV32IZFH-NEXT:  # %bb.1:
; RV32IZFH-NEXT:    mv a0, a1
; RV32IZFH-NEXT:  .LBB3_2:
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_ui_h_multiple_use:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.wu.h a1, fa0, rtz
; RV32IDZFH-NEXT:    addi a0, zero, 1
; RV32IDZFH-NEXT:    beqz a1, .LBB3_2
; RV32IDZFH-NEXT:  # %bb.1:
; RV32IDZFH-NEXT:    mv a0, a1
; RV32IDZFH-NEXT:  .LBB3_2:
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_ui_h_multiple_use:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.wu.h a1, fa0, rtz
; RV64IZFH-NEXT:    addi a0, zero, 1
; RV64IZFH-NEXT:    beqz a1, .LBB3_2
; RV64IZFH-NEXT:  # %bb.1:
; RV64IZFH-NEXT:    mv a0, a1
; RV64IZFH-NEXT:  .LBB3_2:
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_ui_h_multiple_use:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.wu.h a1, fa0, rtz
; RV64IDZFH-NEXT:    addi a0, zero, 1
; RV64IDZFH-NEXT:    beqz a1, .LBB3_2
; RV64IDZFH-NEXT:  # %bb.1:
; RV64IDZFH-NEXT:    mv a0, a1
; RV64IDZFH-NEXT:  .LBB3_2:
; RV64IDZFH-NEXT:    ret
  %a = fptoui half %x to i32
  %b = icmp eq i32 %a, 0
  %c = select i1 %b, i32 1, i32 %a
  ret i32 %c
}

define i16 @fcvt_ui_h_sat(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_ui_h_sat:
; RV32IZFH:       # %bb.0: # %start
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI4_0)
; RV32IZFH-NEXT:    flw ft0, %lo(.LCPI4_0)(a0)
; RV32IZFH-NEXT:    fcvt.s.h ft1, fa0
; RV32IZFH-NEXT:    fmv.w.x ft2, zero
; RV32IZFH-NEXT:    fmax.s ft1, ft1, ft2
; RV32IZFH-NEXT:    fmin.s ft0, ft1, ft0
; RV32IZFH-NEXT:    fcvt.wu.s a0, ft0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_ui_h_sat:
; RV32IDZFH:       # %bb.0: # %start
; RV32IDZFH-NEXT:    lui a0, %hi(.LCPI4_0)
; RV32IDZFH-NEXT:    flw ft0, %lo(.LCPI4_0)(a0)
; RV32IDZFH-NEXT:    fcvt.s.h ft1, fa0
; RV32IDZFH-NEXT:    fmv.w.x ft2, zero
; RV32IDZFH-NEXT:    fmax.s ft1, ft1, ft2
; RV32IDZFH-NEXT:    fmin.s ft0, ft1, ft0
; RV32IDZFH-NEXT:    fcvt.wu.s a0, ft0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_ui_h_sat:
; RV64IZFH:       # %bb.0: # %start
; RV64IZFH-NEXT:    lui a0, %hi(.LCPI4_0)
; RV64IZFH-NEXT:    flw ft0, %lo(.LCPI4_0)(a0)
; RV64IZFH-NEXT:    fcvt.s.h ft1, fa0
; RV64IZFH-NEXT:    fmv.w.x ft2, zero
; RV64IZFH-NEXT:    fmax.s ft1, ft1, ft2
; RV64IZFH-NEXT:    fmin.s ft0, ft1, ft0
; RV64IZFH-NEXT:    fcvt.lu.s a0, ft0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_ui_h_sat:
; RV64IDZFH:       # %bb.0: # %start
; RV64IDZFH-NEXT:    lui a0, %hi(.LCPI4_0)
; RV64IDZFH-NEXT:    flw ft0, %lo(.LCPI4_0)(a0)
; RV64IDZFH-NEXT:    fcvt.s.h ft1, fa0
; RV64IDZFH-NEXT:    fmv.w.x ft2, zero
; RV64IDZFH-NEXT:    fmax.s ft1, ft1, ft2
; RV64IDZFH-NEXT:    fmin.s ft0, ft1, ft0
; RV64IDZFH-NEXT:    fcvt.lu.s a0, ft0, rtz
; RV64IDZFH-NEXT:    ret
start:
  %0 = tail call i16 @llvm.fptoui.sat.i16.f16(half %a)
  ret i16 %0
}
declare i16 @llvm.fptoui.sat.i16.f16(half)

define i32 @fcvt_w_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_w_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_w_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_w_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_w_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
  %1 = fptosi half %a to i32
  ret i32 %1
}

define i32 @fcvt_w_h_sat(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_w_h_sat:
; RV32IZFH:       # %bb.0: # %start
; RV32IZFH-NEXT:    feq.h a0, fa0, fa0
; RV32IZFH-NEXT:    bnez a0, .LBB6_2
; RV32IZFH-NEXT:  # %bb.1: # %start
; RV32IZFH-NEXT:    mv a0, zero
; RV32IZFH-NEXT:    ret
; RV32IZFH-NEXT:  .LBB6_2:
; RV32IZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_w_h_sat:
; RV32IDZFH:       # %bb.0: # %start
; RV32IDZFH-NEXT:    feq.h a0, fa0, fa0
; RV32IDZFH-NEXT:    bnez a0, .LBB6_2
; RV32IDZFH-NEXT:  # %bb.1: # %start
; RV32IDZFH-NEXT:    mv a0, zero
; RV32IDZFH-NEXT:    ret
; RV32IDZFH-NEXT:  .LBB6_2:
; RV32IDZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_w_h_sat:
; RV64IZFH:       # %bb.0: # %start
; RV64IZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IZFH-NEXT:    bnez a0, .LBB6_2
; RV64IZFH-NEXT:  # %bb.1: # %start
; RV64IZFH-NEXT:    mv a0, zero
; RV64IZFH-NEXT:    ret
; RV64IZFH-NEXT:  .LBB6_2:
; RV64IZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_w_h_sat:
; RV64IDZFH:       # %bb.0: # %start
; RV64IDZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IDZFH-NEXT:    bnez a0, .LBB6_2
; RV64IDZFH-NEXT:  # %bb.1: # %start
; RV64IDZFH-NEXT:    mv a0, zero
; RV64IDZFH-NEXT:    ret
; RV64IDZFH-NEXT:  .LBB6_2:
; RV64IDZFH-NEXT:    fcvt.w.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
start:
  %0 = tail call i32 @llvm.fptosi.sat.i32.f16(half %a)
  ret i32 %0
}
declare i32 @llvm.fptosi.sat.i32.f16(half)

define i32 @fcvt_wu_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_wu_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_wu_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_wu_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_wu_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
  %1 = fptoui half %a to i32
  ret i32 %1
}

define i32 @fcvt_wu_h_sat(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_wu_h_sat:
; RV32IZFH:       # %bb.0: # %start
; RV32IZFH-NEXT:    feq.h a0, fa0, fa0
; RV32IZFH-NEXT:    bnez a0, .LBB8_2
; RV32IZFH-NEXT:  # %bb.1: # %start
; RV32IZFH-NEXT:    mv a0, zero
; RV32IZFH-NEXT:    ret
; RV32IZFH-NEXT:  .LBB8_2:
; RV32IZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_wu_h_sat:
; RV32IDZFH:       # %bb.0: # %start
; RV32IDZFH-NEXT:    feq.h a0, fa0, fa0
; RV32IDZFH-NEXT:    bnez a0, .LBB8_2
; RV32IDZFH-NEXT:  # %bb.1: # %start
; RV32IDZFH-NEXT:    mv a0, zero
; RV32IDZFH-NEXT:    ret
; RV32IDZFH-NEXT:  .LBB8_2:
; RV32IDZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_wu_h_sat:
; RV64IZFH:       # %bb.0: # %start
; RV64IZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IZFH-NEXT:    bnez a0, .LBB8_2
; RV64IZFH-NEXT:  # %bb.1: # %start
; RV64IZFH-NEXT:    mv a0, zero
; RV64IZFH-NEXT:    ret
; RV64IZFH-NEXT:  .LBB8_2:
; RV64IZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_wu_h_sat:
; RV64IDZFH:       # %bb.0: # %start
; RV64IDZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IDZFH-NEXT:    bnez a0, .LBB8_2
; RV64IDZFH-NEXT:  # %bb.1: # %start
; RV64IDZFH-NEXT:    mv a0, zero
; RV64IDZFH-NEXT:    ret
; RV64IDZFH-NEXT:  .LBB8_2:
; RV64IDZFH-NEXT:    fcvt.wu.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
start:
  %0 = tail call i32 @llvm.fptoui.sat.i32.f16(half %a)
  ret i32 %0
}
declare i32 @llvm.fptoui.sat.i32.f16(half)

define i64 @fcvt_l_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_l_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    call __fixhfdi@plt
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_l_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    addi sp, sp, -16
; RV32IDZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    call __fixhfdi@plt
; RV32IDZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    addi sp, sp, 16
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_l_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.l.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_l_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.l.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
  %1 = fptosi half %a to i64
  ret i64 %1
}

define i64 @fcvt_l_h_sat(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_l_h_sat:
; RV32IZFH:       # %bb.0: # %start
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    fsw fs0, 4(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI10_0)
; RV32IZFH-NEXT:    flw ft0, %lo(.LCPI10_0)(a0)
; RV32IZFH-NEXT:    fcvt.s.h fs0, fa0
; RV32IZFH-NEXT:    fle.s s0, ft0, fs0
; RV32IZFH-NEXT:    fmv.s fa0, fs0
; RV32IZFH-NEXT:    call __fixsfdi@plt
; RV32IZFH-NEXT:    mv a2, a0
; RV32IZFH-NEXT:    bnez s0, .LBB10_2
; RV32IZFH-NEXT:  # %bb.1: # %start
; RV32IZFH-NEXT:    mv a2, zero
; RV32IZFH-NEXT:  .LBB10_2: # %start
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI10_1)
; RV32IZFH-NEXT:    flw ft0, %lo(.LCPI10_1)(a0)
; RV32IZFH-NEXT:    flt.s a3, ft0, fs0
; RV32IZFH-NEXT:    addi a0, zero, -1
; RV32IZFH-NEXT:    beqz a3, .LBB10_9
; RV32IZFH-NEXT:  # %bb.3: # %start
; RV32IZFH-NEXT:    feq.s a2, fs0, fs0
; RV32IZFH-NEXT:    beqz a2, .LBB10_10
; RV32IZFH-NEXT:  .LBB10_4: # %start
; RV32IZFH-NEXT:    lui a4, 524288
; RV32IZFH-NEXT:    beqz s0, .LBB10_11
; RV32IZFH-NEXT:  .LBB10_5: # %start
; RV32IZFH-NEXT:    bnez a3, .LBB10_12
; RV32IZFH-NEXT:  .LBB10_6: # %start
; RV32IZFH-NEXT:    bnez a2, .LBB10_8
; RV32IZFH-NEXT:  .LBB10_7: # %start
; RV32IZFH-NEXT:    mv a1, zero
; RV32IZFH-NEXT:  .LBB10_8: # %start
; RV32IZFH-NEXT:    flw fs0, 4(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
; RV32IZFH-NEXT:  .LBB10_9: # %start
; RV32IZFH-NEXT:    mv a0, a2
; RV32IZFH-NEXT:    feq.s a2, fs0, fs0
; RV32IZFH-NEXT:    bnez a2, .LBB10_4
; RV32IZFH-NEXT:  .LBB10_10: # %start
; RV32IZFH-NEXT:    mv a0, zero
; RV32IZFH-NEXT:    lui a4, 524288
; RV32IZFH-NEXT:    bnez s0, .LBB10_5
; RV32IZFH-NEXT:  .LBB10_11: # %start
; RV32IZFH-NEXT:    lui a1, 524288
; RV32IZFH-NEXT:    beqz a3, .LBB10_6
; RV32IZFH-NEXT:  .LBB10_12:
; RV32IZFH-NEXT:    addi a1, a4, -1
; RV32IZFH-NEXT:    beqz a2, .LBB10_7
; RV32IZFH-NEXT:    j .LBB10_8
;
; RV32IDZFH-LABEL: fcvt_l_h_sat:
; RV32IDZFH:       # %bb.0: # %start
; RV32IDZFH-NEXT:    addi sp, sp, -16
; RV32IDZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IDZFH-NEXT:    lui a0, %hi(.LCPI10_0)
; RV32IDZFH-NEXT:    flw ft0, %lo(.LCPI10_0)(a0)
; RV32IDZFH-NEXT:    fcvt.s.h fs0, fa0
; RV32IDZFH-NEXT:    fle.s s0, ft0, fs0
; RV32IDZFH-NEXT:    fmv.s fa0, fs0
; RV32IDZFH-NEXT:    call __fixsfdi@plt
; RV32IDZFH-NEXT:    mv a2, a0
; RV32IDZFH-NEXT:    bnez s0, .LBB10_2
; RV32IDZFH-NEXT:  # %bb.1: # %start
; RV32IDZFH-NEXT:    mv a2, zero
; RV32IDZFH-NEXT:  .LBB10_2: # %start
; RV32IDZFH-NEXT:    lui a0, %hi(.LCPI10_1)
; RV32IDZFH-NEXT:    flw ft0, %lo(.LCPI10_1)(a0)
; RV32IDZFH-NEXT:    flt.s a3, ft0, fs0
; RV32IDZFH-NEXT:    addi a0, zero, -1
; RV32IDZFH-NEXT:    beqz a3, .LBB10_9
; RV32IDZFH-NEXT:  # %bb.3: # %start
; RV32IDZFH-NEXT:    feq.s a2, fs0, fs0
; RV32IDZFH-NEXT:    beqz a2, .LBB10_10
; RV32IDZFH-NEXT:  .LBB10_4: # %start
; RV32IDZFH-NEXT:    lui a4, 524288
; RV32IDZFH-NEXT:    beqz s0, .LBB10_11
; RV32IDZFH-NEXT:  .LBB10_5: # %start
; RV32IDZFH-NEXT:    bnez a3, .LBB10_12
; RV32IDZFH-NEXT:  .LBB10_6: # %start
; RV32IDZFH-NEXT:    bnez a2, .LBB10_8
; RV32IDZFH-NEXT:  .LBB10_7: # %start
; RV32IDZFH-NEXT:    mv a1, zero
; RV32IDZFH-NEXT:  .LBB10_8: # %start
; RV32IDZFH-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IDZFH-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    addi sp, sp, 16
; RV32IDZFH-NEXT:    ret
; RV32IDZFH-NEXT:  .LBB10_9: # %start
; RV32IDZFH-NEXT:    mv a0, a2
; RV32IDZFH-NEXT:    feq.s a2, fs0, fs0
; RV32IDZFH-NEXT:    bnez a2, .LBB10_4
; RV32IDZFH-NEXT:  .LBB10_10: # %start
; RV32IDZFH-NEXT:    mv a0, zero
; RV32IDZFH-NEXT:    lui a4, 524288
; RV32IDZFH-NEXT:    bnez s0, .LBB10_5
; RV32IDZFH-NEXT:  .LBB10_11: # %start
; RV32IDZFH-NEXT:    lui a1, 524288
; RV32IDZFH-NEXT:    beqz a3, .LBB10_6
; RV32IDZFH-NEXT:  .LBB10_12:
; RV32IDZFH-NEXT:    addi a1, a4, -1
; RV32IDZFH-NEXT:    beqz a2, .LBB10_7
; RV32IDZFH-NEXT:    j .LBB10_8
;
; RV64IZFH-LABEL: fcvt_l_h_sat:
; RV64IZFH:       # %bb.0: # %start
; RV64IZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IZFH-NEXT:    bnez a0, .LBB10_2
; RV64IZFH-NEXT:  # %bb.1: # %start
; RV64IZFH-NEXT:    mv a0, zero
; RV64IZFH-NEXT:    ret
; RV64IZFH-NEXT:  .LBB10_2:
; RV64IZFH-NEXT:    fcvt.l.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_l_h_sat:
; RV64IDZFH:       # %bb.0: # %start
; RV64IDZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IDZFH-NEXT:    bnez a0, .LBB10_2
; RV64IDZFH-NEXT:  # %bb.1: # %start
; RV64IDZFH-NEXT:    mv a0, zero
; RV64IDZFH-NEXT:    ret
; RV64IDZFH-NEXT:  .LBB10_2:
; RV64IDZFH-NEXT:    fcvt.l.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
start:
  %0 = tail call i64 @llvm.fptosi.sat.i64.f16(half %a)
  ret i64 %0
}
declare i64 @llvm.fptosi.sat.i64.f16(half)

define i64 @fcvt_lu_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_lu_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    call __fixunshfdi@plt
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_lu_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    addi sp, sp, -16
; RV32IDZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    call __fixunshfdi@plt
; RV32IDZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    addi sp, sp, 16
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_lu_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.lu.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_lu_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.lu.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
  %1 = fptoui half %a to i64
  ret i64 %1
}

define i64 @fcvt_lu_h_sat(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_lu_h_sat:
; RV32IZFH:       # %bb.0: # %start
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    fsw fs0, 4(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    fcvt.s.h fs0, fa0
; RV32IZFH-NEXT:    fmv.w.x ft0, zero
; RV32IZFH-NEXT:    fle.s s0, ft0, fs0
; RV32IZFH-NEXT:    fmv.s fa0, fs0
; RV32IZFH-NEXT:    call __fixunssfdi@plt
; RV32IZFH-NEXT:    mv a3, a0
; RV32IZFH-NEXT:    bnez s0, .LBB12_2
; RV32IZFH-NEXT:  # %bb.1: # %start
; RV32IZFH-NEXT:    mv a3, zero
; RV32IZFH-NEXT:  .LBB12_2: # %start
; RV32IZFH-NEXT:    lui a0, %hi(.LCPI12_0)
; RV32IZFH-NEXT:    flw ft0, %lo(.LCPI12_0)(a0)
; RV32IZFH-NEXT:    flt.s a4, ft0, fs0
; RV32IZFH-NEXT:    addi a2, zero, -1
; RV32IZFH-NEXT:    addi a0, zero, -1
; RV32IZFH-NEXT:    beqz a4, .LBB12_7
; RV32IZFH-NEXT:  # %bb.3: # %start
; RV32IZFH-NEXT:    beqz s0, .LBB12_8
; RV32IZFH-NEXT:  .LBB12_4: # %start
; RV32IZFH-NEXT:    bnez a4, .LBB12_6
; RV32IZFH-NEXT:  .LBB12_5: # %start
; RV32IZFH-NEXT:    mv a2, a1
; RV32IZFH-NEXT:  .LBB12_6: # %start
; RV32IZFH-NEXT:    mv a1, a2
; RV32IZFH-NEXT:    flw fs0, 4(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
; RV32IZFH-NEXT:  .LBB12_7: # %start
; RV32IZFH-NEXT:    mv a0, a3
; RV32IZFH-NEXT:    bnez s0, .LBB12_4
; RV32IZFH-NEXT:  .LBB12_8: # %start
; RV32IZFH-NEXT:    mv a1, zero
; RV32IZFH-NEXT:    beqz a4, .LBB12_5
; RV32IZFH-NEXT:    j .LBB12_6
;
; RV32IDZFH-LABEL: fcvt_lu_h_sat:
; RV32IDZFH:       # %bb.0: # %start
; RV32IDZFH-NEXT:    addi sp, sp, -16
; RV32IDZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    fsd fs0, 0(sp) # 8-byte Folded Spill
; RV32IDZFH-NEXT:    fcvt.s.h fs0, fa0
; RV32IDZFH-NEXT:    fmv.w.x ft0, zero
; RV32IDZFH-NEXT:    fle.s s0, ft0, fs0
; RV32IDZFH-NEXT:    fmv.s fa0, fs0
; RV32IDZFH-NEXT:    call __fixunssfdi@plt
; RV32IDZFH-NEXT:    mv a3, a0
; RV32IDZFH-NEXT:    bnez s0, .LBB12_2
; RV32IDZFH-NEXT:  # %bb.1: # %start
; RV32IDZFH-NEXT:    mv a3, zero
; RV32IDZFH-NEXT:  .LBB12_2: # %start
; RV32IDZFH-NEXT:    lui a0, %hi(.LCPI12_0)
; RV32IDZFH-NEXT:    flw ft0, %lo(.LCPI12_0)(a0)
; RV32IDZFH-NEXT:    flt.s a4, ft0, fs0
; RV32IDZFH-NEXT:    addi a2, zero, -1
; RV32IDZFH-NEXT:    addi a0, zero, -1
; RV32IDZFH-NEXT:    beqz a4, .LBB12_7
; RV32IDZFH-NEXT:  # %bb.3: # %start
; RV32IDZFH-NEXT:    beqz s0, .LBB12_8
; RV32IDZFH-NEXT:  .LBB12_4: # %start
; RV32IDZFH-NEXT:    bnez a4, .LBB12_6
; RV32IDZFH-NEXT:  .LBB12_5: # %start
; RV32IDZFH-NEXT:    mv a2, a1
; RV32IDZFH-NEXT:  .LBB12_6: # %start
; RV32IDZFH-NEXT:    mv a1, a2
; RV32IDZFH-NEXT:    fld fs0, 0(sp) # 8-byte Folded Reload
; RV32IDZFH-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    addi sp, sp, 16
; RV32IDZFH-NEXT:    ret
; RV32IDZFH-NEXT:  .LBB12_7: # %start
; RV32IDZFH-NEXT:    mv a0, a3
; RV32IDZFH-NEXT:    bnez s0, .LBB12_4
; RV32IDZFH-NEXT:  .LBB12_8: # %start
; RV32IDZFH-NEXT:    mv a1, zero
; RV32IDZFH-NEXT:    beqz a4, .LBB12_5
; RV32IDZFH-NEXT:    j .LBB12_6
;
; RV64IZFH-LABEL: fcvt_lu_h_sat:
; RV64IZFH:       # %bb.0: # %start
; RV64IZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IZFH-NEXT:    bnez a0, .LBB12_2
; RV64IZFH-NEXT:  # %bb.1: # %start
; RV64IZFH-NEXT:    mv a0, zero
; RV64IZFH-NEXT:    ret
; RV64IZFH-NEXT:  .LBB12_2:
; RV64IZFH-NEXT:    fcvt.lu.h a0, fa0, rtz
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_lu_h_sat:
; RV64IDZFH:       # %bb.0: # %start
; RV64IDZFH-NEXT:    feq.h a0, fa0, fa0
; RV64IDZFH-NEXT:    bnez a0, .LBB12_2
; RV64IDZFH-NEXT:  # %bb.1: # %start
; RV64IDZFH-NEXT:    mv a0, zero
; RV64IDZFH-NEXT:    ret
; RV64IDZFH-NEXT:  .LBB12_2:
; RV64IDZFH-NEXT:    fcvt.lu.h a0, fa0, rtz
; RV64IDZFH-NEXT:    ret
start:
  %0 = tail call i64 @llvm.fptoui.sat.i64.f16(half %a)
  ret i64 %0
}
declare i64 @llvm.fptoui.sat.i64.f16(half)

define half @fcvt_h_si(i16 %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_si:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    slli a0, a0, 16
; RV32IZFH-NEXT:    srai a0, a0, 16
; RV32IZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_si:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    slli a0, a0, 16
; RV32IDZFH-NEXT:    srai a0, a0, 16
; RV32IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_si:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    slli a0, a0, 48
; RV64IZFH-NEXT:    srai a0, a0, 48
; RV64IZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_si:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    slli a0, a0, 48
; RV64IDZFH-NEXT:    srai a0, a0, 48
; RV64IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = sitofp i16 %a to half
  ret half %1
}

define half @fcvt_h_si_signext(i16 signext %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_si_signext:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_si_signext:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_si_signext:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_si_signext:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = sitofp i16 %a to half
  ret half %1
}

define half @fcvt_h_ui(i16 %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_ui:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    lui a1, 16
; RV32IZFH-NEXT:    addi a1, a1, -1
; RV32IZFH-NEXT:    and a0, a0, a1
; RV32IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_ui:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    lui a1, 16
; RV32IDZFH-NEXT:    addi a1, a1, -1
; RV32IDZFH-NEXT:    and a0, a0, a1
; RV32IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_ui:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    lui a1, 16
; RV64IZFH-NEXT:    addiw a1, a1, -1
; RV64IZFH-NEXT:    and a0, a0, a1
; RV64IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_ui:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    lui a1, 16
; RV64IDZFH-NEXT:    addiw a1, a1, -1
; RV64IDZFH-NEXT:    and a0, a0, a1
; RV64IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = uitofp i16 %a to half
  ret half %1
}

define half @fcvt_h_ui_zeroext(i16 zeroext %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_ui_zeroext:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_ui_zeroext:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_ui_zeroext:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_ui_zeroext:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = uitofp i16 %a to half
  ret half %1
}

define half @fcvt_h_w(i32 %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_w:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_w:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_w:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_w:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = sitofp i32 %a to half
  ret half %1
}

define half @fcvt_h_w_load(i32* %p) nounwind {
; RV32IZFH-LABEL: fcvt_h_w_load:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    lw a0, 0(a0)
; RV32IZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_w_load:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    lw a0, 0(a0)
; RV32IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_w_load:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    lw a0, 0(a0)
; RV64IZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_w_load:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    lw a0, 0(a0)
; RV64IDZFH-NEXT:    fcvt.h.w fa0, a0
; RV64IDZFH-NEXT:    ret
  %a = load i32, i32* %p
  %1 = sitofp i32 %a to half
  ret half %1
}

define half @fcvt_h_wu(i32 %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_wu:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_wu:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_wu:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_wu:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = uitofp i32 %a to half
  ret half %1
}

define half @fcvt_h_wu_load(i32* %p) nounwind {
; RV32IZFH-LABEL: fcvt_h_wu_load:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    lw a0, 0(a0)
; RV32IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_wu_load:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    lw a0, 0(a0)
; RV32IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_wu_load:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    lwu a0, 0(a0)
; RV64IZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_wu_load:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    lwu a0, 0(a0)
; RV64IDZFH-NEXT:    fcvt.h.wu fa0, a0
; RV64IDZFH-NEXT:    ret
  %a = load i32, i32* %p
  %1 = uitofp i32 %a to half
  ret half %1
}

define half @fcvt_h_l(i64 %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_l:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    call __floatdihf@plt
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_l:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    addi sp, sp, -16
; RV32IDZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    call __floatdihf@plt
; RV32IDZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    addi sp, sp, 16
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_l:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.l fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_l:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.l fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = sitofp i64 %a to half
  ret half %1
}

define half @fcvt_h_lu(i64 %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_lu:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    call __floatundihf@plt
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_lu:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    addi sp, sp, -16
; RV32IDZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IDZFH-NEXT:    call __floatundihf@plt
; RV32IDZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IDZFH-NEXT:    addi sp, sp, 16
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_lu:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.lu fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_lu:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.lu fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = uitofp i64 %a to half
  ret half %1
}

define half @fcvt_h_s(float %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_s:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.h.s fa0, fa0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_s:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.h.s fa0, fa0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_s:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.h.s fa0, fa0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_s:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.s fa0, fa0
; RV64IDZFH-NEXT:    ret
  %1 = fptrunc float %a to half
  ret half %1
}

define float @fcvt_s_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_s_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fcvt.s.h fa0, fa0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_s_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.s.h fa0, fa0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_s_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fcvt.s.h fa0, fa0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_s_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.s.h fa0, fa0
; RV64IDZFH-NEXT:    ret
  %1 = fpext half %a to float
  ret float %1
}

define half @fcvt_h_d(double %a) nounwind {
; RV32IZFH-LABEL: fcvt_h_d:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    call __truncdfhf2@plt
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_d:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.h.d fa0, fa0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_d:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    addi sp, sp, -16
; RV64IZFH-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IZFH-NEXT:    call __truncdfhf2@plt
; RV64IZFH-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64IZFH-NEXT:    addi sp, sp, 16
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_d:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.h.d fa0, fa0
; RV64IDZFH-NEXT:    ret
  %1 = fptrunc double %a to half
  ret half %1
}

define double @fcvt_d_h(half %a) nounwind {
; RV32IZFH-LABEL: fcvt_d_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi sp, sp, -16
; RV32IZFH-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IZFH-NEXT:    fcvt.s.h fa0, fa0
; RV32IZFH-NEXT:    call __extendsfdf2@plt
; RV32IZFH-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32IZFH-NEXT:    addi sp, sp, 16
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_d_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fcvt.d.h fa0, fa0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_d_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    addi sp, sp, -16
; RV64IZFH-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IZFH-NEXT:    fcvt.s.h fa0, fa0
; RV64IZFH-NEXT:    call __extendsfdf2@plt
; RV64IZFH-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64IZFH-NEXT:    addi sp, sp, 16
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_d_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fcvt.d.h fa0, fa0
; RV64IDZFH-NEXT:    ret
  %1 = fpext half %a to double
  ret double %1
}

define half @bitcast_h_i16(i16 %a) nounwind {
; RV32IZFH-LABEL: bitcast_h_i16:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fmv.h.x fa0, a0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: bitcast_h_i16:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fmv.h.x fa0, a0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: bitcast_h_i16:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fmv.h.x fa0, a0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: bitcast_h_i16:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fmv.h.x fa0, a0
; RV64IDZFH-NEXT:    ret
  %1 = bitcast i16 %a to half
  ret half %1
}

define i16 @bitcast_i16_h(half %a) nounwind {
; RV32IZFH-LABEL: bitcast_i16_h:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    fmv.x.h a0, fa0
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: bitcast_i16_h:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    fmv.x.h a0, fa0
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: bitcast_i16_h:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    fmv.x.h a0, fa0
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: bitcast_i16_h:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    fmv.x.h a0, fa0
; RV64IDZFH-NEXT:    ret
  %1 = bitcast half %a to i16
  ret i16 %1
}

; Make sure we select W version of addi on RV64.
define signext i32 @fcvt_h_w_demanded_bits(i32 signext %0, half* %1) {
; RV32IZFH-LABEL: fcvt_h_w_demanded_bits:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi a0, a0, 1
; RV32IZFH-NEXT:    fcvt.h.w ft0, a0
; RV32IZFH-NEXT:    fsh ft0, 0(a1)
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_w_demanded_bits:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    addi a0, a0, 1
; RV32IDZFH-NEXT:    fcvt.h.w ft0, a0
; RV32IDZFH-NEXT:    fsh ft0, 0(a1)
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_w_demanded_bits:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    addiw a0, a0, 1
; RV64IZFH-NEXT:    fcvt.h.w ft0, a0
; RV64IZFH-NEXT:    fsh ft0, 0(a1)
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_w_demanded_bits:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    addiw a0, a0, 1
; RV64IDZFH-NEXT:    fcvt.h.w ft0, a0
; RV64IDZFH-NEXT:    fsh ft0, 0(a1)
; RV64IDZFH-NEXT:    ret
  %3 = add i32 %0, 1
  %4 = sitofp i32 %3 to half
  store half %4, half* %1, align 2
  ret i32 %3
}

; Make sure we select W version of addi on RV64.
define signext i32 @fcvt_h_wu_demanded_bits(i32 signext %0, half* %1) {
; RV32IZFH-LABEL: fcvt_h_wu_demanded_bits:
; RV32IZFH:       # %bb.0:
; RV32IZFH-NEXT:    addi a0, a0, 1
; RV32IZFH-NEXT:    fcvt.h.wu ft0, a0
; RV32IZFH-NEXT:    fsh ft0, 0(a1)
; RV32IZFH-NEXT:    ret
;
; RV32IDZFH-LABEL: fcvt_h_wu_demanded_bits:
; RV32IDZFH:       # %bb.0:
; RV32IDZFH-NEXT:    addi a0, a0, 1
; RV32IDZFH-NEXT:    fcvt.h.wu ft0, a0
; RV32IDZFH-NEXT:    fsh ft0, 0(a1)
; RV32IDZFH-NEXT:    ret
;
; RV64IZFH-LABEL: fcvt_h_wu_demanded_bits:
; RV64IZFH:       # %bb.0:
; RV64IZFH-NEXT:    addiw a0, a0, 1
; RV64IZFH-NEXT:    fcvt.h.wu ft0, a0
; RV64IZFH-NEXT:    fsh ft0, 0(a1)
; RV64IZFH-NEXT:    ret
;
; RV64IDZFH-LABEL: fcvt_h_wu_demanded_bits:
; RV64IDZFH:       # %bb.0:
; RV64IDZFH-NEXT:    addiw a0, a0, 1
; RV64IDZFH-NEXT:    fcvt.h.wu ft0, a0
; RV64IDZFH-NEXT:    fsh ft0, 0(a1)
; RV64IDZFH-NEXT:    ret
  %3 = add i32 %0, 1
  %4 = uitofp i32 %3 to half
  store half %4, half* %1, align 2
  ret i32 %3
}
