; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-linux | FileCheck %s --check-prefix=CHECK-LINUX64
; RUN: llc < %s -mtriple=x86_64-win32 | FileCheck %s --check-prefix=CHECK-WIN32-64
; RUN: llc < %s -mtriple=i686-- | FileCheck %s --check-prefix=CHECK-X86

define void @g64xh(i64 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g64xh:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $2048, %edi # imm = 0x800
; CHECK-LINUX64-NEXT:    jne .LBB0_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB0_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g64xh:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testl $2048, %ecx # imm = 0x800
; CHECK-WIN32-64-NEXT:    jne .LBB0_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB0_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g64xh:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $2048, %eax # imm = 0x800
; CHECK-X86-NEXT:    jne .LBB0_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB0_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 2048
  %s = icmp eq i64 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g64xl(i64 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g64xl:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testb $8, %dil
; CHECK-LINUX64-NEXT:    jne .LBB1_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB1_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g64xl:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testb $8, %cl
; CHECK-WIN32-64-NEXT:    jne .LBB1_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB1_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g64xl:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testb $8, %al
; CHECK-X86-NEXT:    jne .LBB1_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB1_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 8
  %s = icmp eq i64 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g32xh(i32 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g32xh:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $2048, %edi # imm = 0x800
; CHECK-LINUX64-NEXT:    jne .LBB2_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB2_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g32xh:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testl $2048, %ecx # imm = 0x800
; CHECK-WIN32-64-NEXT:    jne .LBB2_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB2_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g32xh:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $2048, %eax # imm = 0x800
; CHECK-X86-NEXT:    jne .LBB2_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB2_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 2048
  %s = icmp eq i32 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g32xl(i32 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g32xl:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testb $8, %dil
; CHECK-LINUX64-NEXT:    jne .LBB3_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB3_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g32xl:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testb $8, %cl
; CHECK-WIN32-64-NEXT:    jne .LBB3_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB3_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g32xl:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testb $8, %al
; CHECK-X86-NEXT:    jne .LBB3_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB3_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 8
  %s = icmp eq i32 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g16xh(i16 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g16xh:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $2048, %edi # imm = 0x800
; CHECK-LINUX64-NEXT:    jne .LBB4_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB4_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g16xh:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    # kill: def $cx killed $cx def $ecx
; CHECK-WIN32-64-NEXT:    testl $2048, %ecx # imm = 0x800
; CHECK-WIN32-64-NEXT:    jne .LBB4_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB4_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g16xh:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $2048, %eax # imm = 0x800
; CHECK-X86-NEXT:    jne .LBB4_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB4_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i16 %x, 2048
  %s = icmp eq i16 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g16xl(i16 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g16xl:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testb $8, %dil
; CHECK-LINUX64-NEXT:    jne .LBB5_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB5_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g16xl:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    # kill: def $cx killed $cx def $ecx
; CHECK-WIN32-64-NEXT:    testb $8, %cl
; CHECK-WIN32-64-NEXT:    jne .LBB5_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB5_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g16xl:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testb $8, %al
; CHECK-X86-NEXT:    jne .LBB5_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB5_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i16 %x, 8
  %s = icmp eq i16 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g64x16(i64 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g64x16:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $32896, %edi # imm = 0x8080
; CHECK-LINUX64-NEXT:    je .LBB6_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB6_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g64x16:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testl $32896, %ecx # imm = 0x8080
; CHECK-WIN32-64-NEXT:    je .LBB6_1
; CHECK-WIN32-64-NEXT:  # %bb.2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
; CHECK-WIN32-64-NEXT:  .LBB6_1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g64x16:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $32896, %eax # imm = 0x8080
; CHECK-X86-NEXT:    je .LBB6_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB6_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 32896
  %s = icmp eq i64 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g64x16minsize(i64 inreg %x) nounwind minsize {
; CHECK-LINUX64-LABEL: g64x16minsize:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testw $-32640, %di # imm = 0x8080
; CHECK-LINUX64-NEXT:    je .LBB7_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB7_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g64x16minsize:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testw $-32640, %cx # imm = 0x8080
; CHECK-WIN32-64-NEXT:    jne .LBB7_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB7_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g64x16minsize:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testw $-32640, %ax # imm = 0x8080
; CHECK-X86-NEXT:    je .LBB7_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB7_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 32896
  %s = icmp eq i64 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g32x16(i32 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g32x16:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $32896, %edi # imm = 0x8080
; CHECK-LINUX64-NEXT:    je .LBB8_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB8_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g32x16:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testl $32896, %ecx # imm = 0x8080
; CHECK-WIN32-64-NEXT:    je .LBB8_1
; CHECK-WIN32-64-NEXT:  # %bb.2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
; CHECK-WIN32-64-NEXT:  .LBB8_1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g32x16:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $32896, %eax # imm = 0x8080
; CHECK-X86-NEXT:    je .LBB8_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB8_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 32896
  %s = icmp eq i32 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g32x16minsize(i32 inreg %x) nounwind minsize {
; CHECK-LINUX64-LABEL: g32x16minsize:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testw $-32640, %di # imm = 0x8080
; CHECK-LINUX64-NEXT:    je .LBB9_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB9_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g32x16minsize:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testw $-32640, %cx # imm = 0x8080
; CHECK-WIN32-64-NEXT:    jne .LBB9_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB9_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g32x16minsize:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testw $-32640, %ax # imm = 0x8080
; CHECK-X86-NEXT:    je .LBB9_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB9_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 32896
  %s = icmp eq i32 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @g64x32(i64 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: g64x32:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $268468352, %edi # imm = 0x10008080
; CHECK-LINUX64-NEXT:    je .LBB10_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB10_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: g64x32:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testl $268468352, %ecx # imm = 0x10008080
; CHECK-WIN32-64-NEXT:    je .LBB10_1
; CHECK-WIN32-64-NEXT:  # %bb.2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
; CHECK-WIN32-64-NEXT:  .LBB10_1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: g64x32:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $268468352, %eax # imm = 0x10008080
; CHECK-X86-NEXT:    je .LBB10_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB10_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 268468352
  %s = icmp eq i64 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @truncand32(i16 inreg %x) nounwind {
; CHECK-LINUX64-LABEL: truncand32:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $2049, %edi # imm = 0x801
; CHECK-LINUX64-NEXT:    je .LBB11_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB11_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: truncand32:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    # kill: def $cx killed $cx def $ecx
; CHECK-WIN32-64-NEXT:    testl $2049, %ecx # imm = 0x801
; CHECK-WIN32-64-NEXT:    je .LBB11_1
; CHECK-WIN32-64-NEXT:  # %bb.2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
; CHECK-WIN32-64-NEXT:  .LBB11_1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: truncand32:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $2049, %eax # imm = 0x801
; CHECK-X86-NEXT:    je .LBB11_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB11_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i16 %x, 2049
  %s = icmp eq i16 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @testw(i16 inreg %x) nounwind minsize {
; CHECK-LINUX64-LABEL: testw:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testw $2049, %di # imm = 0x801
; CHECK-LINUX64-NEXT:    je .LBB12_1
; CHECK-LINUX64-NEXT:  # %bb.2: # %no
; CHECK-LINUX64-NEXT:    retq
; CHECK-LINUX64-NEXT:  .LBB12_1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: testw:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    # kill: def $cx killed $cx def $ecx
; CHECK-WIN32-64-NEXT:    testw $2049, %cx # imm = 0x801
; CHECK-WIN32-64-NEXT:    jne .LBB12_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB12_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: testw:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testw $2049, %ax # imm = 0x801
; CHECK-X86-NEXT:    je .LBB12_1
; CHECK-X86-NEXT:  # %bb.2: # %no
; CHECK-X86-NEXT:    retl
; CHECK-X86-NEXT:  .LBB12_1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:    retl
  %t = and i16 %x, 2049
  %s = icmp eq i16 %t, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and16_trunc_8_sign(i16 %x) nounwind {
; CHECK-LINUX64-LABEL: and16_trunc_8_sign:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testb $-128, %dil
; CHECK-LINUX64-NEXT:    js .LBB13_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB13_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and16_trunc_8_sign:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testb $-128, %cl
; CHECK-WIN32-64-NEXT:    js .LBB13_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB13_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and16_trunc_8_sign:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testb $-128, {{[0-9]+}}(%esp)
; CHECK-X86-NEXT:    js .LBB13_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB13_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i16 %x, 128
  %r = trunc i16 %t to i8
  %s = icmp sge i8 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and32_trunc_8_sign(i32 %x) nounwind {
; CHECK-LINUX64-LABEL: and32_trunc_8_sign:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testb $-128, %dil
; CHECK-LINUX64-NEXT:    js .LBB14_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB14_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and32_trunc_8_sign:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testb $-128, %cl
; CHECK-WIN32-64-NEXT:    js .LBB14_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB14_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and32_trunc_8_sign:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testb $-128, {{[0-9]+}}(%esp)
; CHECK-X86-NEXT:    js .LBB14_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB14_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 128
  %r = trunc i32 %t to i8
  %s = icmp sge i8 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and64_trunc_8_sign(i64 %x) nounwind {
; CHECK-LINUX64-LABEL: and64_trunc_8_sign:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testb $-128, %dil
; CHECK-LINUX64-NEXT:    js .LBB15_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB15_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and64_trunc_8_sign:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testb $-128, %cl
; CHECK-WIN32-64-NEXT:    js .LBB15_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB15_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and64_trunc_8_sign:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testb $-128, {{[0-9]+}}(%esp)
; CHECK-X86-NEXT:    js .LBB15_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB15_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 128
  %r = trunc i64 %t to i8
  %s = icmp sge i8 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and32_trunc_16_sign(i32 %x) nounwind {
; CHECK-LINUX64-LABEL: and32_trunc_16_sign:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    andl $32768, %edi # imm = 0x8000
; CHECK-LINUX64-NEXT:    testw %di, %di
; CHECK-LINUX64-NEXT:    js .LBB16_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB16_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and32_trunc_16_sign:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    andl $32768, %ecx # imm = 0x8000
; CHECK-WIN32-64-NEXT:    testw %cx, %cx
; CHECK-WIN32-64-NEXT:    js .LBB16_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB16_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and32_trunc_16_sign:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; CHECK-X86-NEXT:    andl $32768, %eax # imm = 0x8000
; CHECK-X86-NEXT:    testw %ax, %ax
; CHECK-X86-NEXT:    js .LBB16_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB16_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 32768
  %r = trunc i32 %t to i16
  %s = icmp sge i16 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and32_trunc_16_sign_minsize(i32 %x) minsize nounwind {
; CHECK-LINUX64-LABEL: and32_trunc_16_sign_minsize:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testw $-32768, %di # imm = 0x8000
; CHECK-LINUX64-NEXT:    js .LBB17_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB17_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and32_trunc_16_sign_minsize:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testw $-32768, %cx # imm = 0x8000
; CHECK-WIN32-64-NEXT:    js .LBB17_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB17_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and32_trunc_16_sign_minsize:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; CHECK-X86-NEXT:    testw $-32768, %ax # imm = 0x8000
; CHECK-X86-NEXT:    js .LBB17_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB17_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i32 %x, 32768
  %r = trunc i32 %t to i16
  %s = icmp sge i16 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and64_trunc_16_sign(i64 %x) nounwind {
; CHECK-LINUX64-LABEL: and64_trunc_16_sign:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    andl $32768, %edi # imm = 0x8000
; CHECK-LINUX64-NEXT:    testw %di, %di
; CHECK-LINUX64-NEXT:    js .LBB18_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB18_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and64_trunc_16_sign:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    andl $32768, %ecx # imm = 0x8000
; CHECK-WIN32-64-NEXT:    testw %cx, %cx
; CHECK-WIN32-64-NEXT:    js .LBB18_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB18_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and64_trunc_16_sign:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    movl $32768, %eax # imm = 0x8000
; CHECK-X86-NEXT:    andl {{[0-9]+}}(%esp), %eax
; CHECK-X86-NEXT:    testw %ax, %ax
; CHECK-X86-NEXT:    js .LBB18_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB18_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 32768
  %r = trunc i64 %t to i16
  %s = icmp sge i16 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and64_trunc_16_sign_minsize(i64 %x) minsize nounwind {
; CHECK-LINUX64-LABEL: and64_trunc_16_sign_minsize:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testw $-32768, %di # imm = 0x8000
; CHECK-LINUX64-NEXT:    js .LBB19_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB19_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and64_trunc_16_sign_minsize:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testw $-32768, %cx # imm = 0x8000
; CHECK-WIN32-64-NEXT:    js .LBB19_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB19_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and64_trunc_16_sign_minsize:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testw $-32768, {{[0-9]+}}(%esp) # imm = 0x8000
; CHECK-X86-NEXT:    js .LBB19_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB19_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 32768
  %r = trunc i64 %t to i16
  %s = icmp sge i16 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

define void @and64_trunc_32_sign(i64 %x) nounwind {
; CHECK-LINUX64-LABEL: and64_trunc_32_sign:
; CHECK-LINUX64:       # %bb.0:
; CHECK-LINUX64-NEXT:    testl $-2147483648, %edi # imm = 0x80000000
; CHECK-LINUX64-NEXT:    js .LBB20_2
; CHECK-LINUX64-NEXT:  # %bb.1: # %yes
; CHECK-LINUX64-NEXT:    pushq %rax
; CHECK-LINUX64-NEXT:    callq bar@PLT
; CHECK-LINUX64-NEXT:    popq %rax
; CHECK-LINUX64-NEXT:  .LBB20_2: # %no
; CHECK-LINUX64-NEXT:    retq
;
; CHECK-WIN32-64-LABEL: and64_trunc_32_sign:
; CHECK-WIN32-64:       # %bb.0:
; CHECK-WIN32-64-NEXT:    subq $40, %rsp
; CHECK-WIN32-64-NEXT:    testl $-2147483648, %ecx # imm = 0x80000000
; CHECK-WIN32-64-NEXT:    js .LBB20_2
; CHECK-WIN32-64-NEXT:  # %bb.1: # %yes
; CHECK-WIN32-64-NEXT:    callq bar
; CHECK-WIN32-64-NEXT:  .LBB20_2: # %no
; CHECK-WIN32-64-NEXT:    addq $40, %rsp
; CHECK-WIN32-64-NEXT:    retq
;
; CHECK-X86-LABEL: and64_trunc_32_sign:
; CHECK-X86:       # %bb.0:
; CHECK-X86-NEXT:    testl $-2147483648, {{[0-9]+}}(%esp) # imm = 0x80000000
; CHECK-X86-NEXT:    js .LBB20_2
; CHECK-X86-NEXT:  # %bb.1: # %yes
; CHECK-X86-NEXT:    calll bar@PLT
; CHECK-X86-NEXT:  .LBB20_2: # %no
; CHECK-X86-NEXT:    retl
  %t = and i64 %x, 2147483648
  %r = trunc i64 %t to i32
  %s = icmp sge i32 %r, 0
  br i1 %s, label %yes, label %no

yes:
  call void @bar()
  ret void
no:
  ret void
}

declare void @bar()
