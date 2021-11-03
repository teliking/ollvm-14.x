; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -mtriple arm-unknown -mattr=-v4t -global-isel -stop-after=irtranslator -verify-machineinstrs %s -o - | FileCheck %s -check-prefixes=NOV4T
; RUN: llc -mtriple arm-unknown -mattr=+v4t -global-isel -stop-after=irtranslator -verify-machineinstrs %s -o - | FileCheck %s -check-prefixes=V4T
; RUN: llc -mtriple arm-unknown -mattr=+v5t -global-isel -stop-after=irtranslator -verify-machineinstrs %s -o - | FileCheck %s -check-prefixes=V5T
; RUN: llc -mtriple thumb-unknown -mattr=+v6t2 -global-isel -stop-after=irtranslator -verify-machineinstrs %s -o - | FileCheck %s -check-prefixes=THUMB

define arm_aapcscc void @test_indirect_call(void() *%fptr) {
  ; NOV4T-LABEL: name: test_indirect_call
  ; NOV4T: bb.1.entry:
  ; NOV4T:   liveins: $r0
  ; NOV4T:   [[COPY:%[0-9]+]]:tgpr(p0) = COPY $r0
  ; NOV4T:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; NOV4T:   BMOVPCRX_CALL [[COPY]](p0), csr_aapcs, implicit-def $lr, implicit $sp
  ; NOV4T:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; NOV4T:   MOVPCLR 14 /* CC::al */, $noreg
  ; V4T-LABEL: name: test_indirect_call
  ; V4T: bb.1.entry:
  ; V4T:   liveins: $r0
  ; V4T:   [[COPY:%[0-9]+]]:tgpr(p0) = COPY $r0
  ; V4T:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V4T:   BX_CALL [[COPY]](p0), csr_aapcs, implicit-def $lr, implicit $sp
  ; V4T:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V4T:   BX_RET 14 /* CC::al */, $noreg
  ; V5T-LABEL: name: test_indirect_call
  ; V5T: bb.1.entry:
  ; V5T:   liveins: $r0
  ; V5T:   [[COPY:%[0-9]+]]:gpr(p0) = COPY $r0
  ; V5T:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V5T:   BLX [[COPY]](p0), csr_aapcs, implicit-def $lr, implicit $sp
  ; V5T:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V5T:   BX_RET 14 /* CC::al */, $noreg
  ; THUMB-LABEL: name: test_indirect_call
  ; THUMB: bb.1.entry:
  ; THUMB:   liveins: $r0
  ; THUMB:   [[COPY:%[0-9]+]]:gpr(p0) = COPY $r0
  ; THUMB:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; THUMB:   tBLXr 14 /* CC::al */, $noreg, [[COPY]](p0), csr_aapcs, implicit-def $lr, implicit $sp
  ; THUMB:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; THUMB:   tBX_RET 14 /* CC::al */, $noreg
entry:
  notail call arm_aapcscc void %fptr()
  ret void
}

declare arm_aapcscc void @call_target()

define arm_aapcscc void @test_direct_call() {
  ; NOV4T-LABEL: name: test_direct_call
  ; NOV4T: bb.1.entry:
  ; NOV4T:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; NOV4T:   BL @call_target, csr_aapcs, implicit-def $lr, implicit $sp
  ; NOV4T:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; NOV4T:   MOVPCLR 14 /* CC::al */, $noreg
  ; V4T-LABEL: name: test_direct_call
  ; V4T: bb.1.entry:
  ; V4T:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V4T:   BL @call_target, csr_aapcs, implicit-def $lr, implicit $sp
  ; V4T:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V4T:   BX_RET 14 /* CC::al */, $noreg
  ; V5T-LABEL: name: test_direct_call
  ; V5T: bb.1.entry:
  ; V5T:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V5T:   BL @call_target, csr_aapcs, implicit-def $lr, implicit $sp
  ; V5T:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; V5T:   BX_RET 14 /* CC::al */, $noreg
  ; THUMB-LABEL: name: test_direct_call
  ; THUMB: bb.1.entry:
  ; THUMB:   ADJCALLSTACKDOWN 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; THUMB:   tBL 14 /* CC::al */, $noreg, @call_target, csr_aapcs, implicit-def $lr, implicit $sp
  ; THUMB:   ADJCALLSTACKUP 0, 0, 14 /* CC::al */, $noreg, implicit-def $sp, implicit $sp
  ; THUMB:   tBX_RET 14 /* CC::al */, $noreg
entry:
  notail call arm_aapcscc void @call_target()
  ret void
}
