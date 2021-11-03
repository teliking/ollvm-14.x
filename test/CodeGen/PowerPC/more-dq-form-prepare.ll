; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mcpu=pwr10 < %s | FileCheck %s

target datalayout = "e-m:e-i64:64-p:64:64-n32:64-v256:256:256-v512:512:512"
target triple = "powerpc64le-unknown-linux-gnu"

%_elem_type_of_a = type <{ double }>
%_elem_type_of_x = type <{ double }>

define void @foo(i32* %.m, i32* %.n, [0 x %_elem_type_of_a]* %.a, [0 x %_elem_type_of_x]* %.x, i32* %.l, <2 x double>* %.vy01, <2 x double>* %.vy02, <2 x double>* %.vy03, <2 x double>* %.vy04, <2 x double>* %.vy05, <2 x double>* %.vy06, <2 x double>* %.vy07, <2 x double>* %.vy08, <2 x double>* %.vy09, <2 x double>* %.vy0a, <2 x double>* %.vy0b, <2 x double>* %.vy0c, <2 x double>* %.vy21, <2 x double>* %.vy22, <2 x double>* %.vy23, <2 x double>* %.vy24, <2 x double>* %.vy25, <2 x double>* %.vy26, <2 x double>* %.vy27, <2 x double>* %.vy28, <2 x double>* %.vy29, <2 x double>* %.vy2a, <2 x double>* %.vy2b, <2 x double>* %.vy2c) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    stdu 1, -592(1)
; CHECK-NEXT:    .cfi_def_cfa_offset 592
; CHECK-NEXT:    .cfi_offset r14, -192
; CHECK-NEXT:    .cfi_offset r15, -184
; CHECK-NEXT:    .cfi_offset r16, -176
; CHECK-NEXT:    .cfi_offset r17, -168
; CHECK-NEXT:    .cfi_offset r18, -160
; CHECK-NEXT:    .cfi_offset r19, -152
; CHECK-NEXT:    .cfi_offset r20, -144
; CHECK-NEXT:    .cfi_offset r21, -136
; CHECK-NEXT:    .cfi_offset r22, -128
; CHECK-NEXT:    .cfi_offset r23, -120
; CHECK-NEXT:    .cfi_offset r24, -112
; CHECK-NEXT:    .cfi_offset r25, -104
; CHECK-NEXT:    .cfi_offset r26, -96
; CHECK-NEXT:    .cfi_offset r27, -88
; CHECK-NEXT:    .cfi_offset r28, -80
; CHECK-NEXT:    .cfi_offset r29, -72
; CHECK-NEXT:    .cfi_offset r30, -64
; CHECK-NEXT:    .cfi_offset r31, -56
; CHECK-NEXT:    .cfi_offset f26, -48
; CHECK-NEXT:    .cfi_offset f27, -40
; CHECK-NEXT:    .cfi_offset f28, -32
; CHECK-NEXT:    .cfi_offset f29, -24
; CHECK-NEXT:    .cfi_offset f30, -16
; CHECK-NEXT:    .cfi_offset f31, -8
; CHECK-NEXT:    .cfi_offset v20, -384
; CHECK-NEXT:    .cfi_offset v21, -368
; CHECK-NEXT:    .cfi_offset v22, -352
; CHECK-NEXT:    .cfi_offset v23, -336
; CHECK-NEXT:    .cfi_offset v24, -320
; CHECK-NEXT:    .cfi_offset v25, -304
; CHECK-NEXT:    .cfi_offset v26, -288
; CHECK-NEXT:    .cfi_offset v27, -272
; CHECK-NEXT:    .cfi_offset v28, -256
; CHECK-NEXT:    .cfi_offset v29, -240
; CHECK-NEXT:    .cfi_offset v30, -224
; CHECK-NEXT:    .cfi_offset v31, -208
; CHECK-NEXT:    lwz 4, 0(4)
; CHECK-NEXT:    std 14, 400(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 15, 408(1) # 8-byte Folded Spill
; CHECK-NEXT:    cmpwi 4, 1
; CHECK-NEXT:    std 16, 416(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 17, 424(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 18, 432(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 19, 440(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 20, 448(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 21, 456(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 22, 464(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 23, 472(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 24, 480(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 25, 488(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 26, 496(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 27, 504(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 28, 512(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 29, 520(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 30, 528(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 31, 536(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 26, 544(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 27, 552(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 28, 560(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 29, 568(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 30, 576(1) # 8-byte Folded Spill
; CHECK-NEXT:    stfd 31, 584(1) # 8-byte Folded Spill
; CHECK-NEXT:    stxv 52, 208(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 53, 224(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 54, 240(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 55, 256(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 56, 272(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 57, 288(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 58, 304(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 59, 320(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 60, 336(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 61, 352(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 62, 368(1) # 16-byte Folded Spill
; CHECK-NEXT:    stxv 63, 384(1) # 16-byte Folded Spill
; CHECK-NEXT:    blt 0, .LBB0_7
; CHECK-NEXT:  # %bb.1: # %_loop_1_do_.lr.ph
; CHECK-NEXT:    mr 22, 5
; CHECK-NEXT:    lwz 5, 0(3)
; CHECK-NEXT:    cmpwi 5, 1
; CHECK-NEXT:    blt 0, .LBB0_7
; CHECK-NEXT:  # %bb.2: # %_loop_1_do_.preheader
; CHECK-NEXT:    mr 14, 6
; CHECK-NEXT:    ld 6, 712(1)
; CHECK-NEXT:    lwa 3, 0(7)
; CHECK-NEXT:    addi 5, 5, 1
; CHECK-NEXT:    std 8, 40(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 9, 48(1) # 8-byte Folded Spill
; CHECK-NEXT:    mr 11, 10
; CHECK-NEXT:    cmpldi 5, 9
; CHECK-NEXT:    lxv 4, 0(8)
; CHECK-NEXT:    ld 8, 696(1)
; CHECK-NEXT:    ld 10, 736(1)
; CHECK-NEXT:    ld 28, 824(1)
; CHECK-NEXT:    std 6, 88(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 10, 96(1) # 8-byte Folded Spill
; CHECK-NEXT:    lxv 0, 0(6)
; CHECK-NEXT:    li 6, 9
; CHECK-NEXT:    ld 7, 688(1)
; CHECK-NEXT:    ld 27, 840(1)
; CHECK-NEXT:    ld 29, 832(1)
; CHECK-NEXT:    ld 26, 816(1)
; CHECK-NEXT:    ld 25, 808(1)
; CHECK-NEXT:    ld 24, 800(1)
; CHECK-NEXT:    ld 23, 792(1)
; CHECK-NEXT:    std 8, 32(1) # 8-byte Folded Spill
; CHECK-NEXT:    sldi 0, 3, 1
; CHECK-NEXT:    sldi 31, 3, 2
; CHECK-NEXT:    std 28, 184(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 29, 192(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 25, 168(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 26, 176(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 23, 152(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 24, 160(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 27, 200(1) # 8-byte Folded Spill
; CHECK-NEXT:    iselgt 5, 5, 6
; CHECK-NEXT:    sldi 6, 3, 3
; CHECK-NEXT:    ld 21, 784(1)
; CHECK-NEXT:    ld 20, 776(1)
; CHECK-NEXT:    ld 19, 768(1)
; CHECK-NEXT:    ld 18, 760(1)
; CHECK-NEXT:    std 18, 120(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 19, 128(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 20, 136(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 21, 144(1) # 8-byte Folded Spill
; CHECK-NEXT:    add 2, 6, 22
; CHECK-NEXT:    ld 17, 752(1)
; CHECK-NEXT:    ld 16, 744(1)
; CHECK-NEXT:    lxv 3, 0(9)
; CHECK-NEXT:    ld 6, 728(1)
; CHECK-NEXT:    addi 5, 5, -2
; CHECK-NEXT:    std 7, 80(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 6, 72(1) # 8-byte Folded Spill
; CHECK-NEXT:    ld 15, 720(1)
; CHECK-NEXT:    ld 9, 704(1)
; CHECK-NEXT:    lxv 43, 0(8)
; CHECK-NEXT:    ld 8, 848(1)
; CHECK-NEXT:    std 11, 56(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 15, 64(1) # 8-byte Folded Spill
; CHECK-NEXT:    lxv 2, 0(11)
; CHECK-NEXT:    sldi 11, 3, 4
; CHECK-NEXT:    rldicl 5, 5, 61, 3
; CHECK-NEXT:    lxv 1, 0(7)
; CHECK-NEXT:    add 7, 3, 31
; CHECK-NEXT:    add 12, 11, 22
; CHECK-NEXT:    addi 11, 2, 32
; CHECK-NEXT:    addi 2, 5, 1
; CHECK-NEXT:    lxv 6, 0(28)
; CHECK-NEXT:    sldi 5, 3, 5
; CHECK-NEXT:    add 28, 3, 0
; CHECK-NEXT:    lxv 42, 0(9)
; CHECK-NEXT:    lxv 41, 0(15)
; CHECK-NEXT:    lxv 40, 0(6)
; CHECK-NEXT:    lxv 39, 0(10)
; CHECK-NEXT:    lxv 38, 0(16)
; CHECK-NEXT:    sldi 30, 7, 3
; CHECK-NEXT:    addi 12, 12, 32
; CHECK-NEXT:    add 30, 22, 30
; CHECK-NEXT:    std 16, 104(1) # 8-byte Folded Spill
; CHECK-NEXT:    std 17, 112(1) # 8-byte Folded Spill
; CHECK-NEXT:    lxv 33, 0(17)
; CHECK-NEXT:    lxv 32, 0(18)
; CHECK-NEXT:    lxv 37, 0(19)
; CHECK-NEXT:    lxv 36, 0(20)
; CHECK-NEXT:    lxv 13, 0(21)
; CHECK-NEXT:    lxv 12, 0(23)
; CHECK-NEXT:    li 23, 0
; CHECK-NEXT:    lxv 11, 0(24)
; CHECK-NEXT:    li 24, 1
; CHECK-NEXT:    lxv 9, 0(25)
; CHECK-NEXT:    mulli 25, 3, 6
; CHECK-NEXT:    lxv 8, 0(26)
; CHECK-NEXT:    mulli 26, 3, 48
; CHECK-NEXT:    lxv 5, 0(29)
; CHECK-NEXT:    add 29, 22, 5
; CHECK-NEXT:    sldi 5, 28, 3
; CHECK-NEXT:    lxv 7, 0(27)
; CHECK-NEXT:    add 27, 22, 5
; CHECK-NEXT:    mr 5, 22
; CHECK-NEXT:    lxv 10, 0(8)
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB0_3: # %_loop_2_do_.lr.ph
; CHECK-NEXT:    # =>This Loop Header: Depth=1
; CHECK-NEXT:    # Child Loop BB0_4 Depth 2
; CHECK-NEXT:    maddld 6, 25, 23, 7
; CHECK-NEXT:    mtctr 2
; CHECK-NEXT:    sldi 6, 6, 3
; CHECK-NEXT:    add 21, 22, 6
; CHECK-NEXT:    maddld 6, 25, 23, 31
; CHECK-NEXT:    sldi 6, 6, 3
; CHECK-NEXT:    add 20, 22, 6
; CHECK-NEXT:    maddld 6, 25, 23, 28
; CHECK-NEXT:    sldi 6, 6, 3
; CHECK-NEXT:    add 19, 22, 6
; CHECK-NEXT:    maddld 6, 25, 23, 0
; CHECK-NEXT:    sldi 6, 6, 3
; CHECK-NEXT:    add 18, 22, 6
; CHECK-NEXT:    maddld 6, 25, 23, 3
; CHECK-NEXT:    sldi 6, 6, 3
; CHECK-NEXT:    add 17, 22, 6
; CHECK-NEXT:    mulld 6, 25, 23
; CHECK-NEXT:    sldi 6, 6, 3
; CHECK-NEXT:    add 16, 22, 6
; CHECK-NEXT:    mr 6, 14
; CHECK-NEXT:    .p2align 5
; CHECK-NEXT:  .LBB0_4: # %_loop_2_do_
; CHECK-NEXT:    # Parent Loop BB0_3 Depth=1
; CHECK-NEXT:    # => This Inner Loop Header: Depth=2
; CHECK-NEXT:    lxvp 34, 0(6)
; CHECK-NEXT:    lxvp 44, 0(16)
; CHECK-NEXT:    xvmaddadp 4, 45, 35
; CHECK-NEXT:    lxvp 46, 0(17)
; CHECK-NEXT:    xvmaddadp 3, 47, 35
; CHECK-NEXT:    lxvp 48, 0(18)
; CHECK-NEXT:    lxvp 50, 0(19)
; CHECK-NEXT:    lxvp 62, 0(20)
; CHECK-NEXT:    lxvp 60, 0(21)
; CHECK-NEXT:    lxvp 58, 32(6)
; CHECK-NEXT:    lxvp 56, 32(16)
; CHECK-NEXT:    lxvp 54, 32(17)
; CHECK-NEXT:    lxvp 52, 32(18)
; CHECK-NEXT:    lxvp 30, 32(19)
; CHECK-NEXT:    lxvp 28, 32(20)
; CHECK-NEXT:    lxvp 26, 32(21)
; CHECK-NEXT:    xvmaddadp 2, 49, 35
; CHECK-NEXT:    xvmaddadp 1, 51, 35
; CHECK-NEXT:    xvmaddadp 43, 63, 35
; CHECK-NEXT:    xvmaddadp 42, 61, 35
; CHECK-NEXT:    xvmaddadp 0, 44, 34
; CHECK-NEXT:    xvmaddadp 41, 46, 34
; CHECK-NEXT:    xvmaddadp 40, 48, 34
; CHECK-NEXT:    xvmaddadp 39, 50, 34
; CHECK-NEXT:    xvmaddadp 38, 62, 34
; CHECK-NEXT:    xvmaddadp 33, 60, 34
; CHECK-NEXT:    xvmaddadp 32, 57, 59
; CHECK-NEXT:    xvmaddadp 37, 55, 59
; CHECK-NEXT:    xvmaddadp 36, 53, 59
; CHECK-NEXT:    xvmaddadp 13, 31, 59
; CHECK-NEXT:    xvmaddadp 12, 29, 59
; CHECK-NEXT:    xvmaddadp 11, 27, 59
; CHECK-NEXT:    xvmaddadp 9, 56, 58
; CHECK-NEXT:    xvmaddadp 8, 54, 58
; CHECK-NEXT:    xvmaddadp 6, 52, 58
; CHECK-NEXT:    xvmaddadp 5, 30, 58
; CHECK-NEXT:    xvmaddadp 7, 28, 58
; CHECK-NEXT:    xvmaddadp 10, 26, 58
; CHECK-NEXT:    addi 6, 6, 64
; CHECK-NEXT:    addi 16, 16, 64
; CHECK-NEXT:    addi 17, 17, 64
; CHECK-NEXT:    addi 18, 18, 64
; CHECK-NEXT:    addi 19, 19, 64
; CHECK-NEXT:    addi 20, 20, 64
; CHECK-NEXT:    addi 21, 21, 64
; CHECK-NEXT:    bdnz .LBB0_4
; CHECK-NEXT:  # %bb.5: # %_loop_2_endl_
; CHECK-NEXT:    #
; CHECK-NEXT:    addi 24, 24, 6
; CHECK-NEXT:    add 5, 5, 26
; CHECK-NEXT:    add 11, 11, 26
; CHECK-NEXT:    add 30, 30, 26
; CHECK-NEXT:    add 12, 12, 26
; CHECK-NEXT:    add 29, 29, 26
; CHECK-NEXT:    add 27, 27, 26
; CHECK-NEXT:    addi 23, 23, 1
; CHECK-NEXT:    cmpld 24, 4
; CHECK-NEXT:    ble 0, .LBB0_3
; CHECK-NEXT:  # %bb.6: # %_loop_1_loopHeader_._return_bb_crit_edge.loopexit
; CHECK-NEXT:    ld 3, 40(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 4, 0(3)
; CHECK-NEXT:    ld 3, 48(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 3, 0(3)
; CHECK-NEXT:    ld 3, 56(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 2, 0(3)
; CHECK-NEXT:    ld 3, 80(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 1, 0(3)
; CHECK-NEXT:    ld 3, 32(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 43, 0(3)
; CHECK-NEXT:    ld 3, 88(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 42, 0(9)
; CHECK-NEXT:    stxv 0, 0(3)
; CHECK-NEXT:    ld 3, 64(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 41, 0(3)
; CHECK-NEXT:    ld 3, 72(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 40, 0(3)
; CHECK-NEXT:    ld 3, 96(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 39, 0(3)
; CHECK-NEXT:    ld 3, 104(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 38, 0(3)
; CHECK-NEXT:    ld 3, 112(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 33, 0(3)
; CHECK-NEXT:    ld 3, 120(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 32, 0(3)
; CHECK-NEXT:    ld 3, 128(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 37, 0(3)
; CHECK-NEXT:    ld 3, 136(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 36, 0(3)
; CHECK-NEXT:    ld 3, 144(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 13, 0(3)
; CHECK-NEXT:    ld 3, 152(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 12, 0(3)
; CHECK-NEXT:    ld 3, 160(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 11, 0(3)
; CHECK-NEXT:    ld 3, 168(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 9, 0(3)
; CHECK-NEXT:    ld 3, 176(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 8, 0(3)
; CHECK-NEXT:    ld 3, 184(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 6, 0(3)
; CHECK-NEXT:    ld 3, 192(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 5, 0(3)
; CHECK-NEXT:    ld 3, 200(1) # 8-byte Folded Reload
; CHECK-NEXT:    stxv 7, 0(3)
; CHECK-NEXT:    stxv 10, 0(8)
; CHECK-NEXT:  .LBB0_7: # %_return_bb
; CHECK-NEXT:    lxv 63, 384(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 62, 368(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 61, 352(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 60, 336(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 59, 320(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 58, 304(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 57, 288(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 56, 272(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 55, 256(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 54, 240(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 53, 224(1) # 16-byte Folded Reload
; CHECK-NEXT:    lxv 52, 208(1) # 16-byte Folded Reload
; CHECK-NEXT:    lfd 31, 584(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 30, 576(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 29, 568(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 28, 560(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 27, 552(1) # 8-byte Folded Reload
; CHECK-NEXT:    lfd 26, 544(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 31, 536(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 30, 528(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 29, 520(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 28, 512(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 27, 504(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 26, 496(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 25, 488(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 24, 480(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 23, 472(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 22, 464(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 21, 456(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 20, 448(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 19, 440(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 18, 432(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 17, 424(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 16, 416(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 15, 408(1) # 8-byte Folded Reload
; CHECK-NEXT:    ld 14, 400(1) # 8-byte Folded Reload
; CHECK-NEXT:    addi 1, 1, 592
; CHECK-NEXT:    blr
entry:
  %_val_l_ = load i32, i32* %.l, align 4
  %_conv = sext i32 %_val_l_ to i64
  %_mult_tmp = shl nsw i64 %_conv, 3
  %_sub_tmp4 = sub nuw nsw i64 -8, %_mult_tmp
  %_val_n_ = load i32, i32* %.n, align 4
  %_leq_tmp.not116 = icmp slt i32 %_val_n_, 1
  br i1 %_leq_tmp.not116, label %_return_bb, label %_loop_1_do_.lr.ph

_loop_1_do_.lr.ph:                                ; preds = %entry
  %_val_m_ = load i32, i32* %.m, align 4
  %_leq_tmp6.not114 = icmp slt i32 %_val_m_, 1
  br i1 %_leq_tmp6.not114, label %_return_bb, label %_loop_1_do_.preheader

_loop_1_do_.preheader:                            ; preds = %_loop_1_do_.lr.ph
  %x_rvo_based_addr_112 = getelementptr inbounds [0 x %_elem_type_of_x], [0 x %_elem_type_of_x]* %.x, i64 0, i64 -1
  %a_byte_ptr_ = bitcast [0 x %_elem_type_of_a]* %.a to i8*
  %a_rvo_based_addr_ = getelementptr inbounds i8, i8* %a_byte_ptr_, i64 %_sub_tmp4
  %.vy01.promoted = load <2 x double>, <2 x double>* %.vy01, align 16
  %.vy02.promoted = load <2 x double>, <2 x double>* %.vy02, align 16
  %.vy03.promoted = load <2 x double>, <2 x double>* %.vy03, align 16
  %.vy04.promoted = load <2 x double>, <2 x double>* %.vy04, align 16
  %.vy05.promoted = load <2 x double>, <2 x double>* %.vy05, align 16
  %.vy06.promoted = load <2 x double>, <2 x double>* %.vy06, align 16
  %.vy07.promoted = load <2 x double>, <2 x double>* %.vy07, align 16
  %.vy08.promoted = load <2 x double>, <2 x double>* %.vy08, align 16
  %.vy09.promoted = load <2 x double>, <2 x double>* %.vy09, align 16
  %.vy0a.promoted = load <2 x double>, <2 x double>* %.vy0a, align 16
  %.vy0b.promoted = load <2 x double>, <2 x double>* %.vy0b, align 16
  %.vy0c.promoted = load <2 x double>, <2 x double>* %.vy0c, align 16
  %.vy21.promoted = load <2 x double>, <2 x double>* %.vy21, align 16
  %.vy22.promoted = load <2 x double>, <2 x double>* %.vy22, align 16
  %.vy23.promoted = load <2 x double>, <2 x double>* %.vy23, align 16
  %.vy24.promoted = load <2 x double>, <2 x double>* %.vy24, align 16
  %.vy25.promoted = load <2 x double>, <2 x double>* %.vy25, align 16
  %.vy26.promoted = load <2 x double>, <2 x double>* %.vy26, align 16
  %.vy27.promoted = load <2 x double>, <2 x double>* %.vy27, align 16
  %.vy28.promoted = load <2 x double>, <2 x double>* %.vy28, align 16
  %.vy29.promoted = load <2 x double>, <2 x double>* %.vy29, align 16
  %.vy2a.promoted = load <2 x double>, <2 x double>* %.vy2a, align 16
  %.vy2b.promoted = load <2 x double>, <2 x double>* %.vy2b, align 16
  %.vy2c.promoted = load <2 x double>, <2 x double>* %.vy2c, align 16
  %0 = zext i32 %_val_m_ to i64
  %1 = zext i32 %_val_n_ to i64
  br label %_loop_2_do_.lr.ph

_loop_2_do_.lr.ph:                                ; preds = %_loop_2_endl_, %_loop_1_do_.preheader
  %indvars.iv212 = phi i64 [ %indvars.iv.next213, %_loop_2_endl_ ], [ 1, %_loop_1_do_.preheader ]
  %2 = phi <2 x double> [ %142, %_loop_2_endl_ ], [ %.vy2c.promoted, %_loop_1_do_.preheader ]
  %3 = phi <2 x double> [ %140, %_loop_2_endl_ ], [ %.vy2b.promoted, %_loop_1_do_.preheader ]
  %4 = phi <2 x double> [ %138, %_loop_2_endl_ ], [ %.vy2a.promoted, %_loop_1_do_.preheader ]
  %5 = phi <2 x double> [ %136, %_loop_2_endl_ ], [ %.vy29.promoted, %_loop_1_do_.preheader ]
  %6 = phi <2 x double> [ %134, %_loop_2_endl_ ], [ %.vy28.promoted, %_loop_1_do_.preheader ]
  %7 = phi <2 x double> [ %132, %_loop_2_endl_ ], [ %.vy27.promoted, %_loop_1_do_.preheader ]
  %8 = phi <2 x double> [ %129, %_loop_2_endl_ ], [ %.vy26.promoted, %_loop_1_do_.preheader ]
  %9 = phi <2 x double> [ %127, %_loop_2_endl_ ], [ %.vy25.promoted, %_loop_1_do_.preheader ]
  %10 = phi <2 x double> [ %125, %_loop_2_endl_ ], [ %.vy24.promoted, %_loop_1_do_.preheader ]
  %11 = phi <2 x double> [ %123, %_loop_2_endl_ ], [ %.vy23.promoted, %_loop_1_do_.preheader ]
  %12 = phi <2 x double> [ %121, %_loop_2_endl_ ], [ %.vy22.promoted, %_loop_1_do_.preheader ]
  %13 = phi <2 x double> [ %119, %_loop_2_endl_ ], [ %.vy21.promoted, %_loop_1_do_.preheader ]
  %14 = phi <2 x double> [ %116, %_loop_2_endl_ ], [ %.vy0c.promoted, %_loop_1_do_.preheader ]
  %15 = phi <2 x double> [ %114, %_loop_2_endl_ ], [ %.vy0b.promoted, %_loop_1_do_.preheader ]
  %16 = phi <2 x double> [ %112, %_loop_2_endl_ ], [ %.vy0a.promoted, %_loop_1_do_.preheader ]
  %17 = phi <2 x double> [ %110, %_loop_2_endl_ ], [ %.vy09.promoted, %_loop_1_do_.preheader ]
  %18 = phi <2 x double> [ %108, %_loop_2_endl_ ], [ %.vy08.promoted, %_loop_1_do_.preheader ]
  %19 = phi <2 x double> [ %106, %_loop_2_endl_ ], [ %.vy07.promoted, %_loop_1_do_.preheader ]
  %20 = phi <2 x double> [ %81, %_loop_2_endl_ ], [ %.vy06.promoted, %_loop_1_do_.preheader ]
  %21 = phi <2 x double> [ %79, %_loop_2_endl_ ], [ %.vy05.promoted, %_loop_1_do_.preheader ]
  %22 = phi <2 x double> [ %77, %_loop_2_endl_ ], [ %.vy04.promoted, %_loop_1_do_.preheader ]
  %23 = phi <2 x double> [ %75, %_loop_2_endl_ ], [ %.vy03.promoted, %_loop_1_do_.preheader ]
  %24 = phi <2 x double> [ %73, %_loop_2_endl_ ], [ %.vy02.promoted, %_loop_1_do_.preheader ]
  %25 = phi <2 x double> [ %71, %_loop_2_endl_ ], [ %.vy01.promoted, %_loop_1_do_.preheader ]
  %_ix_x_len10 = mul i64 %_mult_tmp, %indvars.iv212
  %a_ix_dim_0_ = getelementptr inbounds i8, i8* %a_rvo_based_addr_, i64 %_ix_x_len10
  %26 = add nuw nsw i64 %indvars.iv212, 1
  %_ix_x_len24 = mul i64 %_mult_tmp, %26
  %a_ix_dim_0_25 = getelementptr inbounds i8, i8* %a_rvo_based_addr_, i64 %_ix_x_len24
  %27 = add nuw nsw i64 %indvars.iv212, 2
  %_ix_x_len40 = mul i64 %_mult_tmp, %27
  %a_ix_dim_0_41 = getelementptr inbounds i8, i8* %a_rvo_based_addr_, i64 %_ix_x_len40
  %28 = add nuw nsw i64 %indvars.iv212, 3
  %_ix_x_len56 = mul i64 %_mult_tmp, %28
  %a_ix_dim_0_57 = getelementptr inbounds i8, i8* %a_rvo_based_addr_, i64 %_ix_x_len56
  %29 = add nuw nsw i64 %indvars.iv212, 4
  %_ix_x_len72 = mul i64 %_mult_tmp, %29
  %a_ix_dim_0_73 = getelementptr inbounds i8, i8* %a_rvo_based_addr_, i64 %_ix_x_len72
  %30 = add nuw nsw i64 %indvars.iv212, 5
  %_ix_x_len88 = mul i64 %_mult_tmp, %30
  %a_ix_dim_0_89 = getelementptr inbounds i8, i8* %a_rvo_based_addr_, i64 %_ix_x_len88
  br label %_loop_2_do_

_loop_2_do_:                                      ; preds = %_loop_2_do_.lr.ph, %_loop_2_do_
  %indvars.iv = phi i64 [ 1, %_loop_2_do_.lr.ph ], [ %indvars.iv.next, %_loop_2_do_ ]
  %31 = phi <2 x double> [ %2, %_loop_2_do_.lr.ph ], [ %142, %_loop_2_do_ ]
  %32 = phi <2 x double> [ %3, %_loop_2_do_.lr.ph ], [ %140, %_loop_2_do_ ]
  %33 = phi <2 x double> [ %4, %_loop_2_do_.lr.ph ], [ %138, %_loop_2_do_ ]
  %34 = phi <2 x double> [ %5, %_loop_2_do_.lr.ph ], [ %136, %_loop_2_do_ ]
  %35 = phi <2 x double> [ %6, %_loop_2_do_.lr.ph ], [ %134, %_loop_2_do_ ]
  %36 = phi <2 x double> [ %7, %_loop_2_do_.lr.ph ], [ %132, %_loop_2_do_ ]
  %37 = phi <2 x double> [ %8, %_loop_2_do_.lr.ph ], [ %129, %_loop_2_do_ ]
  %38 = phi <2 x double> [ %9, %_loop_2_do_.lr.ph ], [ %127, %_loop_2_do_ ]
  %39 = phi <2 x double> [ %10, %_loop_2_do_.lr.ph ], [ %125, %_loop_2_do_ ]
  %40 = phi <2 x double> [ %11, %_loop_2_do_.lr.ph ], [ %123, %_loop_2_do_ ]
  %41 = phi <2 x double> [ %12, %_loop_2_do_.lr.ph ], [ %121, %_loop_2_do_ ]
  %42 = phi <2 x double> [ %13, %_loop_2_do_.lr.ph ], [ %119, %_loop_2_do_ ]
  %43 = phi <2 x double> [ %14, %_loop_2_do_.lr.ph ], [ %116, %_loop_2_do_ ]
  %44 = phi <2 x double> [ %15, %_loop_2_do_.lr.ph ], [ %114, %_loop_2_do_ ]
  %45 = phi <2 x double> [ %16, %_loop_2_do_.lr.ph ], [ %112, %_loop_2_do_ ]
  %46 = phi <2 x double> [ %17, %_loop_2_do_.lr.ph ], [ %110, %_loop_2_do_ ]
  %47 = phi <2 x double> [ %18, %_loop_2_do_.lr.ph ], [ %108, %_loop_2_do_ ]
  %48 = phi <2 x double> [ %19, %_loop_2_do_.lr.ph ], [ %106, %_loop_2_do_ ]
  %49 = phi <2 x double> [ %20, %_loop_2_do_.lr.ph ], [ %81, %_loop_2_do_ ]
  %50 = phi <2 x double> [ %21, %_loop_2_do_.lr.ph ], [ %79, %_loop_2_do_ ]
  %51 = phi <2 x double> [ %22, %_loop_2_do_.lr.ph ], [ %77, %_loop_2_do_ ]
  %52 = phi <2 x double> [ %23, %_loop_2_do_.lr.ph ], [ %75, %_loop_2_do_ ]
  %53 = phi <2 x double> [ %24, %_loop_2_do_.lr.ph ], [ %73, %_loop_2_do_ ]
  %54 = phi <2 x double> [ %25, %_loop_2_do_.lr.ph ], [ %71, %_loop_2_do_ ]
  %_ix_x_len = shl nuw nsw i64 %indvars.iv, 3
  %x_ix_dim_0_113 = getelementptr inbounds %_elem_type_of_x, %_elem_type_of_x* %x_rvo_based_addr_112, i64 %indvars.iv
  %x_ix_dim_0_ = bitcast %_elem_type_of_x* %x_ix_dim_0_113 to i8*
  %55 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %x_ix_dim_0_)
  %a_ix_dim_1_ = getelementptr inbounds i8, i8* %a_ix_dim_0_, i64 %_ix_x_len
  %56 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %a_ix_dim_1_)
  %a_ix_dim_1_29 = getelementptr inbounds i8, i8* %a_ix_dim_0_25, i64 %_ix_x_len
  %57 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %a_ix_dim_1_29)
  %a_ix_dim_1_45 = getelementptr inbounds i8, i8* %a_ix_dim_0_41, i64 %_ix_x_len
  %58 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %a_ix_dim_1_45)
  %a_ix_dim_1_61 = getelementptr inbounds i8, i8* %a_ix_dim_0_57, i64 %_ix_x_len
  %59 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %a_ix_dim_1_61)
  %a_ix_dim_1_77 = getelementptr inbounds i8, i8* %a_ix_dim_0_73, i64 %_ix_x_len
  %60 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %a_ix_dim_1_77)
  %a_ix_dim_1_93 = getelementptr inbounds i8, i8* %a_ix_dim_0_89, i64 %_ix_x_len
  %61 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* nonnull %a_ix_dim_1_93)
  %62 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %55)
  %.fca.0.extract35 = extractvalue { <16 x i8>, <16 x i8> } %62, 0
  %.fca.1.extract36 = extractvalue { <16 x i8>, <16 x i8> } %62, 1
  %63 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %56)
  %.fca.0.extract29 = extractvalue { <16 x i8>, <16 x i8> } %63, 0
  %.fca.1.extract30 = extractvalue { <16 x i8>, <16 x i8> } %63, 1
  %64 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %57)
  %.fca.0.extract23 = extractvalue { <16 x i8>, <16 x i8> } %64, 0
  %.fca.1.extract24 = extractvalue { <16 x i8>, <16 x i8> } %64, 1
  %65 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %58)
  %.fca.0.extract17 = extractvalue { <16 x i8>, <16 x i8> } %65, 0
  %.fca.1.extract18 = extractvalue { <16 x i8>, <16 x i8> } %65, 1
  %66 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %59)
  %.fca.0.extract11 = extractvalue { <16 x i8>, <16 x i8> } %66, 0
  %.fca.1.extract12 = extractvalue { <16 x i8>, <16 x i8> } %66, 1
  %67 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %60)
  %.fca.0.extract5 = extractvalue { <16 x i8>, <16 x i8> } %67, 0
  %.fca.1.extract6 = extractvalue { <16 x i8>, <16 x i8> } %67, 1
  %68 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %61)
  %.fca.0.extract = extractvalue { <16 x i8>, <16 x i8> } %68, 0
  %.fca.1.extract = extractvalue { <16 x i8>, <16 x i8> } %68, 1
  %69 = bitcast <16 x i8> %.fca.0.extract29 to <2 x double>
  %70 = bitcast <16 x i8> %.fca.0.extract35 to <2 x double>
  %71 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %69, <2 x double> %70, <2 x double> %54)
  %72 = bitcast <16 x i8> %.fca.0.extract23 to <2 x double>
  %73 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %72, <2 x double> %70, <2 x double> %53)
  %74 = bitcast <16 x i8> %.fca.0.extract17 to <2 x double>
  %75 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %74, <2 x double> %70, <2 x double> %52)
  %76 = bitcast <16 x i8> %.fca.0.extract11 to <2 x double>
  %77 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %76, <2 x double> %70, <2 x double> %51)
  %78 = bitcast <16 x i8> %.fca.0.extract5 to <2 x double>
  %79 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %78, <2 x double> %70, <2 x double> %50)
  %80 = bitcast <16 x i8> %.fca.0.extract to <2 x double>
  %81 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %80, <2 x double> %70, <2 x double> %49)
  %82 = getelementptr %_elem_type_of_x, %_elem_type_of_x* %x_ix_dim_0_113, i64 4
  %83 = bitcast %_elem_type_of_x* %82 to i8*
  %84 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %83)
  %85 = getelementptr i8, i8* %a_ix_dim_1_, i64 32
  %86 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %85)
  %87 = getelementptr i8, i8* %a_ix_dim_1_29, i64 32
  %88 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %87)
  %89 = getelementptr i8, i8* %a_ix_dim_1_45, i64 32
  %90 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %89)
  %91 = getelementptr i8, i8* %a_ix_dim_1_61, i64 32
  %92 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %91)
  %93 = getelementptr i8, i8* %a_ix_dim_1_77, i64 32
  %94 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %93)
  %95 = getelementptr i8, i8* %a_ix_dim_1_93, i64 32
  %96 = tail call <256 x i1> @llvm.ppc.vsx.lxvp(i8* %95)
  %97 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %84)
  %.fca.0.extract37 = extractvalue { <16 x i8>, <16 x i8> } %97, 0
  %.fca.1.extract39 = extractvalue { <16 x i8>, <16 x i8> } %97, 1
  %98 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %86)
  %.fca.0.extract31 = extractvalue { <16 x i8>, <16 x i8> } %98, 0
  %.fca.1.extract33 = extractvalue { <16 x i8>, <16 x i8> } %98, 1
  %99 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %88)
  %.fca.0.extract25 = extractvalue { <16 x i8>, <16 x i8> } %99, 0
  %.fca.1.extract27 = extractvalue { <16 x i8>, <16 x i8> } %99, 1
  %100 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %90)
  %.fca.0.extract19 = extractvalue { <16 x i8>, <16 x i8> } %100, 0
  %.fca.1.extract21 = extractvalue { <16 x i8>, <16 x i8> } %100, 1
  %101 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %92)
  %.fca.0.extract13 = extractvalue { <16 x i8>, <16 x i8> } %101, 0
  %.fca.1.extract15 = extractvalue { <16 x i8>, <16 x i8> } %101, 1
  %102 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %94)
  %.fca.0.extract7 = extractvalue { <16 x i8>, <16 x i8> } %102, 0
  %.fca.1.extract9 = extractvalue { <16 x i8>, <16 x i8> } %102, 1
  %103 = tail call { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1> %96)
  %.fca.0.extract1 = extractvalue { <16 x i8>, <16 x i8> } %103, 0
  %.fca.1.extract3 = extractvalue { <16 x i8>, <16 x i8> } %103, 1
  %104 = bitcast <16 x i8> %.fca.1.extract30 to <2 x double>
  %105 = bitcast <16 x i8> %.fca.1.extract36 to <2 x double>
  %106 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %104, <2 x double> %105, <2 x double> %48)
  %107 = bitcast <16 x i8> %.fca.1.extract24 to <2 x double>
  %108 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %107, <2 x double> %105, <2 x double> %47)
  %109 = bitcast <16 x i8> %.fca.1.extract18 to <2 x double>
  %110 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %109, <2 x double> %105, <2 x double> %46)
  %111 = bitcast <16 x i8> %.fca.1.extract12 to <2 x double>
  %112 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %111, <2 x double> %105, <2 x double> %45)
  %113 = bitcast <16 x i8> %.fca.1.extract6 to <2 x double>
  %114 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %113, <2 x double> %105, <2 x double> %44)
  %115 = bitcast <16 x i8> %.fca.1.extract to <2 x double>
  %116 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %115, <2 x double> %105, <2 x double> %43)
  %117 = bitcast <16 x i8> %.fca.0.extract31 to <2 x double>
  %118 = bitcast <16 x i8> %.fca.0.extract37 to <2 x double>
  %119 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %117, <2 x double> %118, <2 x double> %42)
  %120 = bitcast <16 x i8> %.fca.0.extract25 to <2 x double>
  %121 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %120, <2 x double> %118, <2 x double> %41)
  %122 = bitcast <16 x i8> %.fca.0.extract19 to <2 x double>
  %123 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %122, <2 x double> %118, <2 x double> %40)
  %124 = bitcast <16 x i8> %.fca.0.extract13 to <2 x double>
  %125 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %124, <2 x double> %118, <2 x double> %39)
  %126 = bitcast <16 x i8> %.fca.0.extract7 to <2 x double>
  %127 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %126, <2 x double> %118, <2 x double> %38)
  %128 = bitcast <16 x i8> %.fca.0.extract1 to <2 x double>
  %129 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %128, <2 x double> %118, <2 x double> %37)
  %130 = bitcast <16 x i8> %.fca.1.extract33 to <2 x double>
  %131 = bitcast <16 x i8> %.fca.1.extract39 to <2 x double>
  %132 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %130, <2 x double> %131, <2 x double> %36)
  %133 = bitcast <16 x i8> %.fca.1.extract27 to <2 x double>
  %134 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %133, <2 x double> %131, <2 x double> %35)
  %135 = bitcast <16 x i8> %.fca.1.extract21 to <2 x double>
  %136 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %135, <2 x double> %131, <2 x double> %34)
  %137 = bitcast <16 x i8> %.fca.1.extract15 to <2 x double>
  %138 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %137, <2 x double> %131, <2 x double> %33)
  %139 = bitcast <16 x i8> %.fca.1.extract9 to <2 x double>
  %140 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %139, <2 x double> %131, <2 x double> %32)
  %141 = bitcast <16 x i8> %.fca.1.extract3 to <2 x double>
  %142 = tail call contract <2 x double> @llvm.fma.v2f64(<2 x double> %141, <2 x double> %131, <2 x double> %31)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 8
  %_leq_tmp6.not = icmp ugt i64 %indvars.iv.next, %0
  br i1 %_leq_tmp6.not, label %_loop_2_endl_, label %_loop_2_do_

_loop_2_endl_:                                    ; preds = %_loop_2_do_
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 6
  %_leq_tmp.not = icmp ugt i64 %indvars.iv.next213, %1
  br i1 %_leq_tmp.not, label %_loop_1_loopHeader_._return_bb_crit_edge.loopexit, label %_loop_2_do_.lr.ph

_loop_1_loopHeader_._return_bb_crit_edge.loopexit: ; preds = %_loop_2_endl_
  store <2 x double> %71, <2 x double>* %.vy01, align 16
  store <2 x double> %73, <2 x double>* %.vy02, align 16
  store <2 x double> %75, <2 x double>* %.vy03, align 16
  store <2 x double> %77, <2 x double>* %.vy04, align 16
  store <2 x double> %79, <2 x double>* %.vy05, align 16
  store <2 x double> %81, <2 x double>* %.vy06, align 16
  store <2 x double> %106, <2 x double>* %.vy07, align 16
  store <2 x double> %108, <2 x double>* %.vy08, align 16
  store <2 x double> %110, <2 x double>* %.vy09, align 16
  store <2 x double> %112, <2 x double>* %.vy0a, align 16
  store <2 x double> %114, <2 x double>* %.vy0b, align 16
  store <2 x double> %116, <2 x double>* %.vy0c, align 16
  store <2 x double> %119, <2 x double>* %.vy21, align 16
  store <2 x double> %121, <2 x double>* %.vy22, align 16
  store <2 x double> %123, <2 x double>* %.vy23, align 16
  store <2 x double> %125, <2 x double>* %.vy24, align 16
  store <2 x double> %127, <2 x double>* %.vy25, align 16
  store <2 x double> %129, <2 x double>* %.vy26, align 16
  store <2 x double> %132, <2 x double>* %.vy27, align 16
  store <2 x double> %134, <2 x double>* %.vy28, align 16
  store <2 x double> %136, <2 x double>* %.vy29, align 16
  store <2 x double> %138, <2 x double>* %.vy2a, align 16
  store <2 x double> %140, <2 x double>* %.vy2b, align 16
  store <2 x double> %142, <2 x double>* %.vy2c, align 16
  br label %_return_bb

_return_bb:                                       ; preds = %_loop_1_do_.lr.ph, %_loop_1_loopHeader_._return_bb_crit_edge.loopexit, %entry
  ret void
}

declare <256 x i1> @llvm.ppc.vsx.lxvp(i8*)
declare { <16 x i8>, <16 x i8> } @llvm.ppc.vsx.disassemble.pair(<256 x i1>)
declare <2 x double> @llvm.fma.v2f64(<2 x double>, <2 x double>, <2 x double>)

