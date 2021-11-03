; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+experimental-v,+m -verify-machineinstrs < %s | FileCheck %s

define void @rvv_vla(i64 %n, i64 %i) nounwind {
; CHECK-LABEL: rvv_vla:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -32
; CHECK-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; CHECK-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; CHECK-NEXT:    addi s0, sp, 32
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a3, a2, 1
; CHECK-NEXT:    add a2, a3, a2
; CHECK-NEXT:    sub sp, sp, a2
; CHECK-NEXT:    slli a0, a0, 2
; CHECK-NEXT:    addi a0, a0, 15
; CHECK-NEXT:    andi a0, a0, -16
; CHECK-NEXT:    sub a0, sp, a0
; CHECK-NEXT:    mv sp, a0
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    sub a2, s0, a2
; CHECK-NEXT:    addi a2, a2, -32
; CHECK-NEXT:    vl1re64.v v8, (a2)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a3, a2, 1
; CHECK-NEXT:    add a2, a3, a2
; CHECK-NEXT:    sub a2, s0, a2
; CHECK-NEXT:    addi a2, a2, -32
; CHECK-NEXT:    vl2re64.v v8, (a2)
; CHECK-NEXT:    slli a1, a1, 2
; CHECK-NEXT:    add a0, a0, a1
; CHECK-NEXT:    lw a0, 0(a0)
; CHECK-NEXT:    addi sp, s0, -32
; CHECK-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; CHECK-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 32
; CHECK-NEXT:    ret
  %vla.addr = alloca i32, i64 %n

  %v1.addr = alloca <vscale x 1 x i64>
  %v1 = load volatile <vscale x 1 x i64>, <vscale x 1 x i64>* %v1.addr

  %v2.addr = alloca <vscale x 2 x i64>
  %v2 = load volatile <vscale x 2 x i64>, <vscale x 2 x i64>* %v2.addr

  %p = getelementptr i32, i32* %vla.addr, i64 %i
  %s = load volatile i32, i32* %p
  ret void
}

define void @rvv_overaligned() nounwind {
; CHECK-LABEL: rvv_overaligned:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -128
; CHECK-NEXT:    sd ra, 120(sp) # 8-byte Folded Spill
; CHECK-NEXT:    sd s0, 112(sp) # 8-byte Folded Spill
; CHECK-NEXT:    addi s0, sp, 128
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a1, a0, 1
; CHECK-NEXT:    add a0, a1, a0
; CHECK-NEXT:    sub sp, sp, a0
; CHECK-NEXT:    andi sp, sp, -64
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 1
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 112
; CHECK-NEXT:    vl1re64.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 112
; CHECK-NEXT:    vl2re64.v v8, (a0)
; CHECK-NEXT:    lw a0, 64(sp)
; CHECK-NEXT:    addi sp, s0, -128
; CHECK-NEXT:    ld s0, 112(sp) # 8-byte Folded Reload
; CHECK-NEXT:    ld ra, 120(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 128
; CHECK-NEXT:    ret
  %overaligned = alloca i32, align 64

  %v1.addr = alloca <vscale x 1 x i64>
  %v1 = load volatile <vscale x 1 x i64>, <vscale x 1 x i64>* %v1.addr

  %v2.addr = alloca <vscale x 2 x i64>
  %v2 = load volatile <vscale x 2 x i64>, <vscale x 2 x i64>* %v2.addr

  %s = load volatile i32, i32* %overaligned, align 64
  ret void
}

define void @rvv_vla_and_overaligned(i64 %n, i64 %i) nounwind {
; CHECK-LABEL: rvv_vla_and_overaligned:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -128
; CHECK-NEXT:    sd ra, 120(sp) # 8-byte Folded Spill
; CHECK-NEXT:    sd s0, 112(sp) # 8-byte Folded Spill
; CHECK-NEXT:    sd s1, 104(sp) # 8-byte Folded Spill
; CHECK-NEXT:    addi s0, sp, 128
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a3, a2, 1
; CHECK-NEXT:    add a2, a3, a2
; CHECK-NEXT:    sub sp, sp, a2
; CHECK-NEXT:    andi sp, sp, -64
; CHECK-NEXT:    mv s1, sp
; CHECK-NEXT:    slli a0, a0, 2
; CHECK-NEXT:    addi a0, a0, 15
; CHECK-NEXT:    andi a0, a0, -16
; CHECK-NEXT:    sub a0, sp, a0
; CHECK-NEXT:    mv sp, a0
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 1
; CHECK-NEXT:    add a2, s1, a2
; CHECK-NEXT:    addi a2, a2, 104
; CHECK-NEXT:    vl1re64.v v8, (a2)
; CHECK-NEXT:    addi a2, s1, 104
; CHECK-NEXT:    vl2re64.v v8, (a2)
; CHECK-NEXT:    lw a2, 64(s1)
; CHECK-NEXT:    slli a1, a1, 2
; CHECK-NEXT:    add a0, a0, a1
; CHECK-NEXT:    lw a0, 0(a0)
; CHECK-NEXT:    addi sp, s0, -128
; CHECK-NEXT:    ld s1, 104(sp) # 8-byte Folded Reload
; CHECK-NEXT:    ld s0, 112(sp) # 8-byte Folded Reload
; CHECK-NEXT:    ld ra, 120(sp) # 8-byte Folded Reload
; CHECK-NEXT:    addi sp, sp, 128
; CHECK-NEXT:    ret
  %overaligned = alloca i32, align 64
  %vla.addr = alloca i32, i64 %n

  %v1.addr = alloca <vscale x 1 x i64>
  %v1 = load volatile <vscale x 1 x i64>, <vscale x 1 x i64>* %v1.addr

  %v2.addr = alloca <vscale x 2 x i64>
  %v2 = load volatile <vscale x 2 x i64>, <vscale x 2 x i64>* %v2.addr

  %s1 = load volatile i32, i32* %overaligned, align 64
  %p = getelementptr i32, i32* %vla.addr, i64 %i
  %s2 = load volatile i32, i32* %p
  ret void

}
