; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -O1 -mattr=+m,+experimental-v -riscv-v-vector-bits-min=1024 < %s | FileCheck %s --check-prefix=RV64-1024
; RUN: llc -mtriple=riscv64 -O1 -mattr=+m,+experimental-v -riscv-v-vector-bits-min=2048 < %s | FileCheck %s --check-prefix=RV64-2048

define void @interleave256(<256 x i16>* %agg.result, <128 x i16>* %0, <128 x i16>* %1) {
; RV64-1024-LABEL: interleave256:
; RV64-1024:       # %bb.0: # %entry
; RV64-1024-NEXT:    addi a3, zero, 128
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m2, ta, mu
; RV64-1024-NEXT:    vle16.v v12, (a1)
; RV64-1024-NEXT:    vle16.v v16, (a2)
; RV64-1024-NEXT:    addi a1, zero, 256
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m4, ta, mu
; RV64-1024-NEXT:    vmv.v.i v8, 0
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m4, tu, mu
; RV64-1024-NEXT:    vmv4r.v v20, v8
; RV64-1024-NEXT:    vslideup.vi v20, v12, 0
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m2, ta, mu
; RV64-1024-NEXT:    vmv.v.i v24, 0
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m4, tu, mu
; RV64-1024-NEXT:    vslideup.vx v20, v24, a3
; RV64-1024-NEXT:    vsetvli zero, zero, e16, m4, ta, mu
; RV64-1024-NEXT:    vid.v v28
; RV64-1024-NEXT:    vsrl.vi v12, v28, 1
; RV64-1024-NEXT:    vrgather.vv v0, v20, v12
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m4, tu, mu
; RV64-1024-NEXT:    vslideup.vi v8, v16, 0
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m4, tu, mu
; RV64-1024-NEXT:    vslideup.vx v8, v24, a3
; RV64-1024-NEXT:    vsetvli zero, zero, e16, m4, ta, mu
; RV64-1024-NEXT:    vrgather.vv v16, v0, v28
; RV64-1024-NEXT:    lui a2, 1026731
; RV64-1024-NEXT:    addiw a2, a2, -1365
; RV64-1024-NEXT:    slli a2, a2, 12
; RV64-1024-NEXT:    addi a2, a2, -1365
; RV64-1024-NEXT:    slli a2, a2, 12
; RV64-1024-NEXT:    addi a2, a2, -1365
; RV64-1024-NEXT:    slli a2, a2, 12
; RV64-1024-NEXT:    addi a2, a2, -1366
; RV64-1024-NEXT:    vsetivli zero, 4, e64, m1, ta, mu
; RV64-1024-NEXT:    vmv.s.x v20, a2
; RV64-1024-NEXT:    vsetivli zero, 2, e64, m1, tu, mu
; RV64-1024-NEXT:    vmv1r.v v0, v20
; RV64-1024-NEXT:    vslideup.vi v0, v20, 1
; RV64-1024-NEXT:    vsetivli zero, 3, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v20, 2
; RV64-1024-NEXT:    vsetivli zero, 4, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v20, 3
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m4, ta, mu
; RV64-1024-NEXT:    vrgather.vv v16, v8, v12, v0.t
; RV64-1024-NEXT:    vse16.v v16, (a0)
; RV64-1024-NEXT:    ret
;
; RV64-2048-LABEL: interleave256:
; RV64-2048:       # %bb.0: # %entry
; RV64-2048-NEXT:    addi a3, zero, 128
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m1, ta, mu
; RV64-2048-NEXT:    vle16.v v10, (a1)
; RV64-2048-NEXT:    vle16.v v12, (a2)
; RV64-2048-NEXT:    addi a1, zero, 256
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m2, ta, mu
; RV64-2048-NEXT:    vmv.v.i v8, 0
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m2, tu, mu
; RV64-2048-NEXT:    vmv2r.v v14, v8
; RV64-2048-NEXT:    vslideup.vi v14, v10, 0
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m1, ta, mu
; RV64-2048-NEXT:    vmv.v.i v16, 0
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m2, tu, mu
; RV64-2048-NEXT:    vslideup.vx v14, v16, a3
; RV64-2048-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; RV64-2048-NEXT:    vid.v v18
; RV64-2048-NEXT:    vsrl.vi v10, v18, 1
; RV64-2048-NEXT:    vrgather.vv v20, v14, v10
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m2, tu, mu
; RV64-2048-NEXT:    vslideup.vi v8, v12, 0
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m2, tu, mu
; RV64-2048-NEXT:    vslideup.vx v8, v16, a3
; RV64-2048-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; RV64-2048-NEXT:    vrgather.vv v12, v20, v18
; RV64-2048-NEXT:    lui a2, 1026731
; RV64-2048-NEXT:    addiw a2, a2, -1365
; RV64-2048-NEXT:    slli a2, a2, 12
; RV64-2048-NEXT:    addi a2, a2, -1365
; RV64-2048-NEXT:    slli a2, a2, 12
; RV64-2048-NEXT:    addi a2, a2, -1365
; RV64-2048-NEXT:    slli a2, a2, 12
; RV64-2048-NEXT:    addi a2, a2, -1366
; RV64-2048-NEXT:    vsetivli zero, 4, e64, m1, ta, mu
; RV64-2048-NEXT:    vmv.s.x v14, a2
; RV64-2048-NEXT:    vsetivli zero, 2, e64, m1, tu, mu
; RV64-2048-NEXT:    vmv1r.v v0, v14
; RV64-2048-NEXT:    vslideup.vi v0, v14, 1
; RV64-2048-NEXT:    vsetivli zero, 3, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v14, 2
; RV64-2048-NEXT:    vsetivli zero, 4, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v14, 3
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m2, ta, mu
; RV64-2048-NEXT:    vrgather.vv v12, v8, v10, v0.t
; RV64-2048-NEXT:    vse16.v v12, (a0)
; RV64-2048-NEXT:    ret
entry:
  %ve = load <128 x i16>, <128 x i16>* %0, align 256
  %vo = load <128 x i16>, <128 x i16>* %1, align 256
  %2 = shufflevector <128 x i16> %ve, <128 x i16> poison, <256 x i32> <i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7, i32 undef, i32 8, i32 undef, i32 9, i32 undef, i32 10, i32 undef, i32 11, i32 undef, i32 12, i32 undef, i32 13, i32 undef, i32 14, i32 undef, i32 15, i32 undef, i32 16, i32 undef, i32 17, i32 undef, i32 18, i32 undef, i32 19, i32 undef, i32 20, i32 undef, i32 21, i32 undef, i32 22, i32 undef, i32 23, i32 undef, i32 24, i32 undef, i32 25, i32 undef, i32 26, i32 undef, i32 27, i32 undef, i32 28, i32 undef, i32 29, i32 undef, i32 30, i32 undef, i32 31, i32 undef, i32 32, i32 undef, i32 33, i32 undef, i32 34, i32 undef, i32 35, i32 undef, i32 36, i32 undef, i32 37, i32 undef, i32 38, i32 undef, i32 39, i32 undef, i32 40, i32 undef, i32 41, i32 undef, i32 42, i32 undef, i32 43, i32 undef, i32 44, i32 undef, i32 45, i32 undef, i32 46, i32 undef, i32 47, i32 undef, i32 48, i32 undef, i32 49, i32 undef, i32 50, i32 undef, i32 51, i32 undef, i32 52, i32 undef, i32 53, i32 undef, i32 54, i32 undef, i32 55, i32 undef, i32 56, i32 undef, i32 57, i32 undef, i32 58, i32 undef, i32 59, i32 undef, i32 60, i32 undef, i32 61, i32 undef, i32 62, i32 undef, i32 63, i32 undef, i32 64, i32 undef, i32 65, i32 undef, i32 66, i32 undef, i32 67, i32 undef, i32 68, i32 undef, i32 69, i32 undef, i32 70, i32 undef, i32 71, i32 undef, i32 72, i32 undef, i32 73, i32 undef, i32 74, i32 undef, i32 75, i32 undef, i32 76, i32 undef, i32 77, i32 undef, i32 78, i32 undef, i32 79, i32 undef, i32 80, i32 undef, i32 81, i32 undef, i32 82, i32 undef, i32 83, i32 undef, i32 84, i32 undef, i32 85, i32 undef, i32 86, i32 undef, i32 87, i32 undef, i32 88, i32 undef, i32 89, i32 undef, i32 90, i32 undef, i32 91, i32 undef, i32 92, i32 undef, i32 93, i32 undef, i32 94, i32 undef, i32 95, i32 undef, i32 96, i32 undef, i32 97, i32 undef, i32 98, i32 undef, i32 99, i32 undef, i32 100, i32 undef, i32 101, i32 undef, i32 102, i32 undef, i32 103, i32 undef, i32 104, i32 undef, i32 105, i32 undef, i32 106, i32 undef, i32 107, i32 undef, i32 108, i32 undef, i32 109, i32 undef, i32 110, i32 undef, i32 111, i32 undef, i32 112, i32 undef, i32 113, i32 undef, i32 114, i32 undef, i32 115, i32 undef, i32 116, i32 undef, i32 117, i32 undef, i32 118, i32 undef, i32 119, i32 undef, i32 120, i32 undef, i32 121, i32 undef, i32 122, i32 undef, i32 123, i32 undef, i32 124, i32 undef, i32 125, i32 undef, i32 126, i32 undef, i32 127, i32 undef>
  %3 = shufflevector <128 x i16> %vo, <128 x i16> poison, <256 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %4 = shufflevector <256 x i16> %2, <256 x i16> %3, <256 x i32> <i32 0, i32 256, i32 2, i32 257, i32 4, i32 258, i32 6, i32 259, i32 8, i32 260, i32 10, i32 261, i32 12, i32 262, i32 14, i32 263, i32 16, i32 264, i32 18, i32 265, i32 20, i32 266, i32 22, i32 267, i32 24, i32 268, i32 26, i32 269, i32 28, i32 270, i32 30, i32 271, i32 32, i32 272, i32 34, i32 273, i32 36, i32 274, i32 38, i32 275, i32 40, i32 276, i32 42, i32 277, i32 44, i32 278, i32 46, i32 279, i32 48, i32 280, i32 50, i32 281, i32 52, i32 282, i32 54, i32 283, i32 56, i32 284, i32 58, i32 285, i32 60, i32 286, i32 62, i32 287, i32 64, i32 288, i32 66, i32 289, i32 68, i32 290, i32 70, i32 291, i32 72, i32 292, i32 74, i32 293, i32 76, i32 294, i32 78, i32 295, i32 80, i32 296, i32 82, i32 297, i32 84, i32 298, i32 86, i32 299, i32 88, i32 300, i32 90, i32 301, i32 92, i32 302, i32 94, i32 303, i32 96, i32 304, i32 98, i32 305, i32 100, i32 306, i32 102, i32 307, i32 104, i32 308, i32 106, i32 309, i32 108, i32 310, i32 110, i32 311, i32 112, i32 312, i32 114, i32 313, i32 116, i32 314, i32 118, i32 315, i32 120, i32 316, i32 122, i32 317, i32 124, i32 318, i32 126, i32 319, i32 128, i32 320, i32 130, i32 321, i32 132, i32 322, i32 134, i32 323, i32 136, i32 324, i32 138, i32 325, i32 140, i32 326, i32 142, i32 327, i32 144, i32 328, i32 146, i32 329, i32 148, i32 330, i32 150, i32 331, i32 152, i32 332, i32 154, i32 333, i32 156, i32 334, i32 158, i32 335, i32 160, i32 336, i32 162, i32 337, i32 164, i32 338, i32 166, i32 339, i32 168, i32 340, i32 170, i32 341, i32 172, i32 342, i32 174, i32 343, i32 176, i32 344, i32 178, i32 345, i32 180, i32 346, i32 182, i32 347, i32 184, i32 348, i32 186, i32 349, i32 188, i32 350, i32 190, i32 351, i32 192, i32 352, i32 194, i32 353, i32 196, i32 354, i32 198, i32 355, i32 200, i32 356, i32 202, i32 357, i32 204, i32 358, i32 206, i32 359, i32 208, i32 360, i32 210, i32 361, i32 212, i32 362, i32 214, i32 363, i32 216, i32 364, i32 218, i32 365, i32 220, i32 366, i32 222, i32 367, i32 224, i32 368, i32 226, i32 369, i32 228, i32 370, i32 230, i32 371, i32 232, i32 372, i32 234, i32 373, i32 236, i32 374, i32 238, i32 375, i32 240, i32 376, i32 242, i32 377, i32 244, i32 378, i32 246, i32 379, i32 248, i32 380, i32 250, i32 381, i32 252, i32 382, i32 254, i32 383>
  store <256 x i16> %4, <256 x i16>* %agg.result, align 512
  ret void
}

define void @interleave512(<512 x i16>* %agg.result, <256 x i16>* %0, <256 x i16>* %1) local_unnamed_addr {
; RV64-1024-LABEL: interleave512:
; RV64-1024:       # %bb.0: # %entry
; RV64-1024-NEXT:    addi sp, sp, -16
; RV64-1024-NEXT:    .cfi_def_cfa_offset 16
; RV64-1024-NEXT:    csrr a3, vlenb
; RV64-1024-NEXT:    addi a4, zero, 40
; RV64-1024-NEXT:    mul a3, a3, a4
; RV64-1024-NEXT:    sub sp, sp, a3
; RV64-1024-NEXT:    addi a3, zero, 256
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m4, ta, mu
; RV64-1024-NEXT:    vle16.v v16, (a1)
; RV64-1024-NEXT:    vle16.v v8, (a2)
; RV64-1024-NEXT:    csrr a1, vlenb
; RV64-1024-NEXT:    slli a1, a1, 4
; RV64-1024-NEXT:    add a1, sp, a1
; RV64-1024-NEXT:    addi a1, a1, 16
; RV64-1024-NEXT:    vs8r.v v8, (a1) # Unknown-size Folded Spill
; RV64-1024-NEXT:    addi a1, zero, 512
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m8, ta, mu
; RV64-1024-NEXT:    vmv.v.i v8, 0
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    slli a2, a2, 5
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vs8r.v v8, (a2) # Unknown-size Folded Spill
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m8, tu, mu
; RV64-1024-NEXT:    vslideup.vi v8, v16, 0
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m4, ta, mu
; RV64-1024-NEXT:    vmv.v.i v16, 0
; RV64-1024-NEXT:    addi a2, sp, 16
; RV64-1024-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m8, tu, mu
; RV64-1024-NEXT:    vslideup.vx v8, v16, a3
; RV64-1024-NEXT:    vsetvli zero, zero, e16, m8, ta, mu
; RV64-1024-NEXT:    vid.v v24
; RV64-1024-NEXT:    vsrl.vi v16, v24, 1
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    addi a4, zero, 24
; RV64-1024-NEXT:    mul a2, a2, a4
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; RV64-1024-NEXT:    vrgather.vv v0, v8, v16
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    slli a2, a2, 3
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vs8r.v v0, (a2) # Unknown-size Folded Spill
; RV64-1024-NEXT:    vsetvli zero, a3, e16, m8, tu, mu
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    slli a2, a2, 5
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vl8re8.v v8, (a2) # Unknown-size Folded Reload
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    slli a2, a2, 4
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vl8re8.v v16, (a2) # Unknown-size Folded Reload
; RV64-1024-NEXT:    vslideup.vi v8, v16, 0
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m8, tu, mu
; RV64-1024-NEXT:    addi a2, sp, 16
; RV64-1024-NEXT:    vl8re8.v v16, (a2) # Unknown-size Folded Reload
; RV64-1024-NEXT:    vslideup.vx v8, v16, a3
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    slli a2, a2, 5
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vs8r.v v8, (a2) # Unknown-size Folded Spill
; RV64-1024-NEXT:    vsetvli zero, zero, e16, m8, ta, mu
; RV64-1024-NEXT:    csrr a2, vlenb
; RV64-1024-NEXT:    slli a2, a2, 3
; RV64-1024-NEXT:    add a2, sp, a2
; RV64-1024-NEXT:    addi a2, a2, 16
; RV64-1024-NEXT:    vl8re8.v v16, (a2) # Unknown-size Folded Reload
; RV64-1024-NEXT:    vrgather.vv v8, v16, v24
; RV64-1024-NEXT:    lui a2, 1026731
; RV64-1024-NEXT:    addiw a2, a2, -1365
; RV64-1024-NEXT:    slli a2, a2, 12
; RV64-1024-NEXT:    addi a2, a2, -1365
; RV64-1024-NEXT:    slli a2, a2, 12
; RV64-1024-NEXT:    addi a2, a2, -1365
; RV64-1024-NEXT:    slli a2, a2, 12
; RV64-1024-NEXT:    addi a2, a2, -1366
; RV64-1024-NEXT:    vsetivli zero, 8, e64, m1, ta, mu
; RV64-1024-NEXT:    vmv.s.x v16, a2
; RV64-1024-NEXT:    vsetivli zero, 2, e64, m1, tu, mu
; RV64-1024-NEXT:    vmv1r.v v0, v16
; RV64-1024-NEXT:    vslideup.vi v0, v16, 1
; RV64-1024-NEXT:    vsetivli zero, 3, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v16, 2
; RV64-1024-NEXT:    vsetivli zero, 4, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v16, 3
; RV64-1024-NEXT:    vsetivli zero, 5, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v16, 4
; RV64-1024-NEXT:    vsetivli zero, 6, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v16, 5
; RV64-1024-NEXT:    vsetivli zero, 7, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v16, 6
; RV64-1024-NEXT:    vsetivli zero, 8, e64, m1, tu, mu
; RV64-1024-NEXT:    vslideup.vi v0, v16, 7
; RV64-1024-NEXT:    vsetvli zero, a1, e16, m8, ta, mu
; RV64-1024-NEXT:    csrr a1, vlenb
; RV64-1024-NEXT:    addi a2, zero, 24
; RV64-1024-NEXT:    mul a1, a1, a2
; RV64-1024-NEXT:    add a1, sp, a1
; RV64-1024-NEXT:    addi a1, a1, 16
; RV64-1024-NEXT:    vl8re8.v v16, (a1) # Unknown-size Folded Reload
; RV64-1024-NEXT:    csrr a1, vlenb
; RV64-1024-NEXT:    slli a1, a1, 5
; RV64-1024-NEXT:    add a1, sp, a1
; RV64-1024-NEXT:    addi a1, a1, 16
; RV64-1024-NEXT:    vl8re8.v v24, (a1) # Unknown-size Folded Reload
; RV64-1024-NEXT:    vrgather.vv v8, v24, v16, v0.t
; RV64-1024-NEXT:    vse16.v v8, (a0)
; RV64-1024-NEXT:    csrr a0, vlenb
; RV64-1024-NEXT:    addi a1, zero, 40
; RV64-1024-NEXT:    mul a0, a0, a1
; RV64-1024-NEXT:    add sp, sp, a0
; RV64-1024-NEXT:    addi sp, sp, 16
; RV64-1024-NEXT:    ret
;
; RV64-2048-LABEL: interleave512:
; RV64-2048:       # %bb.0: # %entry
; RV64-2048-NEXT:    addi a3, zero, 256
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m2, ta, mu
; RV64-2048-NEXT:    vle16.v v12, (a1)
; RV64-2048-NEXT:    vle16.v v16, (a2)
; RV64-2048-NEXT:    addi a1, zero, 512
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m4, ta, mu
; RV64-2048-NEXT:    vmv.v.i v8, 0
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m4, tu, mu
; RV64-2048-NEXT:    vmv4r.v v20, v8
; RV64-2048-NEXT:    vslideup.vi v20, v12, 0
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m2, ta, mu
; RV64-2048-NEXT:    vmv.v.i v24, 0
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m4, tu, mu
; RV64-2048-NEXT:    vslideup.vx v20, v24, a3
; RV64-2048-NEXT:    vsetvli zero, zero, e16, m4, ta, mu
; RV64-2048-NEXT:    vid.v v28
; RV64-2048-NEXT:    vsrl.vi v12, v28, 1
; RV64-2048-NEXT:    vrgather.vv v0, v20, v12
; RV64-2048-NEXT:    vsetvli zero, a3, e16, m4, tu, mu
; RV64-2048-NEXT:    vslideup.vi v8, v16, 0
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m4, tu, mu
; RV64-2048-NEXT:    vslideup.vx v8, v24, a3
; RV64-2048-NEXT:    vsetvli zero, zero, e16, m4, ta, mu
; RV64-2048-NEXT:    vrgather.vv v16, v0, v28
; RV64-2048-NEXT:    lui a2, 1026731
; RV64-2048-NEXT:    addiw a2, a2, -1365
; RV64-2048-NEXT:    slli a2, a2, 12
; RV64-2048-NEXT:    addi a2, a2, -1365
; RV64-2048-NEXT:    slli a2, a2, 12
; RV64-2048-NEXT:    addi a2, a2, -1365
; RV64-2048-NEXT:    slli a2, a2, 12
; RV64-2048-NEXT:    addi a2, a2, -1366
; RV64-2048-NEXT:    vsetivli zero, 8, e64, m1, ta, mu
; RV64-2048-NEXT:    vmv.s.x v20, a2
; RV64-2048-NEXT:    vsetivli zero, 2, e64, m1, tu, mu
; RV64-2048-NEXT:    vmv1r.v v0, v20
; RV64-2048-NEXT:    vslideup.vi v0, v20, 1
; RV64-2048-NEXT:    vsetivli zero, 3, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v20, 2
; RV64-2048-NEXT:    vsetivli zero, 4, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v20, 3
; RV64-2048-NEXT:    vsetivli zero, 5, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v20, 4
; RV64-2048-NEXT:    vsetivli zero, 6, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v20, 5
; RV64-2048-NEXT:    vsetivli zero, 7, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v20, 6
; RV64-2048-NEXT:    vsetivli zero, 8, e64, m1, tu, mu
; RV64-2048-NEXT:    vslideup.vi v0, v20, 7
; RV64-2048-NEXT:    vsetvli zero, a1, e16, m4, ta, mu
; RV64-2048-NEXT:    vrgather.vv v16, v8, v12, v0.t
; RV64-2048-NEXT:    vse16.v v16, (a0)
; RV64-2048-NEXT:    ret
entry:
  %ve = load <256 x i16>, <256 x i16>* %0, align 512
  %vo = load <256 x i16>, <256 x i16>* %1, align 512
  %2 = shufflevector <256 x i16> %ve, <256 x i16> poison, <512 x i32> <i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7, i32 undef, i32 8, i32 undef, i32 9, i32 undef, i32 10, i32 undef, i32 11, i32 undef, i32 12, i32 undef, i32 13, i32 undef, i32 14, i32 undef, i32 15, i32 undef, i32 16, i32 undef, i32 17, i32 undef, i32 18, i32 undef, i32 19, i32 undef, i32 20, i32 undef, i32 21, i32 undef, i32 22, i32 undef, i32 23, i32 undef, i32 24, i32 undef, i32 25, i32 undef, i32 26, i32 undef, i32 27, i32 undef, i32 28, i32 undef, i32 29, i32 undef, i32 30, i32 undef, i32 31, i32 undef, i32 32, i32 undef, i32 33, i32 undef, i32 34, i32 undef, i32 35, i32 undef, i32 36, i32 undef, i32 37, i32 undef, i32 38, i32 undef, i32 39, i32 undef, i32 40, i32 undef, i32 41, i32 undef, i32 42, i32 undef, i32 43, i32 undef, i32 44, i32 undef, i32 45, i32 undef, i32 46, i32 undef, i32 47, i32 undef, i32 48, i32 undef, i32 49, i32 undef, i32 50, i32 undef, i32 51, i32 undef, i32 52, i32 undef, i32 53, i32 undef, i32 54, i32 undef, i32 55, i32 undef, i32 56, i32 undef, i32 57, i32 undef, i32 58, i32 undef, i32 59, i32 undef, i32 60, i32 undef, i32 61, i32 undef, i32 62, i32 undef, i32 63, i32 undef, i32 64, i32 undef, i32 65, i32 undef, i32 66, i32 undef, i32 67, i32 undef, i32 68, i32 undef, i32 69, i32 undef, i32 70, i32 undef, i32 71, i32 undef, i32 72, i32 undef, i32 73, i32 undef, i32 74, i32 undef, i32 75, i32 undef, i32 76, i32 undef, i32 77, i32 undef, i32 78, i32 undef, i32 79, i32 undef, i32 80, i32 undef, i32 81, i32 undef, i32 82, i32 undef, i32 83, i32 undef, i32 84, i32 undef, i32 85, i32 undef, i32 86, i32 undef, i32 87, i32 undef, i32 88, i32 undef, i32 89, i32 undef, i32 90, i32 undef, i32 91, i32 undef, i32 92, i32 undef, i32 93, i32 undef, i32 94, i32 undef, i32 95, i32 undef, i32 96, i32 undef, i32 97, i32 undef, i32 98, i32 undef, i32 99, i32 undef, i32 100, i32 undef, i32 101, i32 undef, i32 102, i32 undef, i32 103, i32 undef, i32 104, i32 undef, i32 105, i32 undef, i32 106, i32 undef, i32 107, i32 undef, i32 108, i32 undef, i32 109, i32 undef, i32 110, i32 undef, i32 111, i32 undef, i32 112, i32 undef, i32 113, i32 undef, i32 114, i32 undef, i32 115, i32 undef, i32 116, i32 undef, i32 117, i32 undef, i32 118, i32 undef, i32 119, i32 undef, i32 120, i32 undef, i32 121, i32 undef, i32 122, i32 undef, i32 123, i32 undef, i32 124, i32 undef, i32 125, i32 undef, i32 126, i32 undef, i32 127, i32 undef, i32 128, i32 undef, i32 129, i32 undef, i32 130, i32 undef, i32 131, i32 undef, i32 132, i32 undef, i32 133, i32 undef, i32 134, i32 undef, i32 135, i32 undef, i32 136, i32 undef, i32 137, i32 undef, i32 138, i32 undef, i32 139, i32 undef, i32 140, i32 undef, i32 141, i32 undef, i32 142, i32 undef, i32 143, i32 undef, i32 144, i32 undef, i32 145, i32 undef, i32 146, i32 undef, i32 147, i32 undef, i32 148, i32 undef, i32 149, i32 undef, i32 150, i32 undef, i32 151, i32 undef, i32 152, i32 undef, i32 153, i32 undef, i32 154, i32 undef, i32 155, i32 undef, i32 156, i32 undef, i32 157, i32 undef, i32 158, i32 undef, i32 159, i32 undef, i32 160, i32 undef, i32 161, i32 undef, i32 162, i32 undef, i32 163, i32 undef, i32 164, i32 undef, i32 165, i32 undef, i32 166, i32 undef, i32 167, i32 undef, i32 168, i32 undef, i32 169, i32 undef, i32 170, i32 undef, i32 171, i32 undef, i32 172, i32 undef, i32 173, i32 undef, i32 174, i32 undef, i32 175, i32 undef, i32 176, i32 undef, i32 177, i32 undef, i32 178, i32 undef, i32 179, i32 undef, i32 180, i32 undef, i32 181, i32 undef, i32 182, i32 undef, i32 183, i32 undef, i32 184, i32 undef, i32 185, i32 undef, i32 186, i32 undef, i32 187, i32 undef, i32 188, i32 undef, i32 189, i32 undef, i32 190, i32 undef, i32 191, i32 undef, i32 192, i32 undef, i32 193, i32 undef, i32 194, i32 undef, i32 195, i32 undef, i32 196, i32 undef, i32 197, i32 undef, i32 198, i32 undef, i32 199, i32 undef, i32 200, i32 undef, i32 201, i32 undef, i32 202, i32 undef, i32 203, i32 undef, i32 204, i32 undef, i32 205, i32 undef, i32 206, i32 undef, i32 207, i32 undef, i32 208, i32 undef, i32 209, i32 undef, i32 210, i32 undef, i32 211, i32 undef, i32 212, i32 undef, i32 213, i32 undef, i32 214, i32 undef, i32 215, i32 undef, i32 216, i32 undef, i32 217, i32 undef, i32 218, i32 undef, i32 219, i32 undef, i32 220, i32 undef, i32 221, i32 undef, i32 222, i32 undef, i32 223, i32 undef, i32 224, i32 undef, i32 225, i32 undef, i32 226, i32 undef, i32 227, i32 undef, i32 228, i32 undef, i32 229, i32 undef, i32 230, i32 undef, i32 231, i32 undef, i32 232, i32 undef, i32 233, i32 undef, i32 234, i32 undef, i32 235, i32 undef, i32 236, i32 undef, i32 237, i32 undef, i32 238, i32 undef, i32 239, i32 undef, i32 240, i32 undef, i32 241, i32 undef, i32 242, i32 undef, i32 243, i32 undef, i32 244, i32 undef, i32 245, i32 undef, i32 246, i32 undef, i32 247, i32 undef, i32 248, i32 undef, i32 249, i32 undef, i32 250, i32 undef, i32 251, i32 undef, i32 252, i32 undef, i32 253, i32 undef, i32 254, i32 undef, i32 255, i32 undef>
  %3 = shufflevector <256 x i16> %vo, <256 x i16> poison, <512 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127, i32 128, i32 129, i32 130, i32 131, i32 132, i32 133, i32 134, i32 135, i32 136, i32 137, i32 138, i32 139, i32 140, i32 141, i32 142, i32 143, i32 144, i32 145, i32 146, i32 147, i32 148, i32 149, i32 150, i32 151, i32 152, i32 153, i32 154, i32 155, i32 156, i32 157, i32 158, i32 159, i32 160, i32 161, i32 162, i32 163, i32 164, i32 165, i32 166, i32 167, i32 168, i32 169, i32 170, i32 171, i32 172, i32 173, i32 174, i32 175, i32 176, i32 177, i32 178, i32 179, i32 180, i32 181, i32 182, i32 183, i32 184, i32 185, i32 186, i32 187, i32 188, i32 189, i32 190, i32 191, i32 192, i32 193, i32 194, i32 195, i32 196, i32 197, i32 198, i32 199, i32 200, i32 201, i32 202, i32 203, i32 204, i32 205, i32 206, i32 207, i32 208, i32 209, i32 210, i32 211, i32 212, i32 213, i32 214, i32 215, i32 216, i32 217, i32 218, i32 219, i32 220, i32 221, i32 222, i32 223, i32 224, i32 225, i32 226, i32 227, i32 228, i32 229, i32 230, i32 231, i32 232, i32 233, i32 234, i32 235, i32 236, i32 237, i32 238, i32 239, i32 240, i32 241, i32 242, i32 243, i32 244, i32 245, i32 246, i32 247, i32 248, i32 249, i32 250, i32 251, i32 252, i32 253, i32 254, i32 255, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %4 = shufflevector <512 x i16> %2, <512 x i16> %3, <512 x i32> <i32 0, i32 512, i32 2, i32 513, i32 4, i32 514, i32 6, i32 515, i32 8, i32 516, i32 10, i32 517, i32 12, i32 518, i32 14, i32 519, i32 16, i32 520, i32 18, i32 521, i32 20, i32 522, i32 22, i32 523, i32 24, i32 524, i32 26, i32 525, i32 28, i32 526, i32 30, i32 527, i32 32, i32 528, i32 34, i32 529, i32 36, i32 530, i32 38, i32 531, i32 40, i32 532, i32 42, i32 533, i32 44, i32 534, i32 46, i32 535, i32 48, i32 536, i32 50, i32 537, i32 52, i32 538, i32 54, i32 539, i32 56, i32 540, i32 58, i32 541, i32 60, i32 542, i32 62, i32 543, i32 64, i32 544, i32 66, i32 545, i32 68, i32 546, i32 70, i32 547, i32 72, i32 548, i32 74, i32 549, i32 76, i32 550, i32 78, i32 551, i32 80, i32 552, i32 82, i32 553, i32 84, i32 554, i32 86, i32 555, i32 88, i32 556, i32 90, i32 557, i32 92, i32 558, i32 94, i32 559, i32 96, i32 560, i32 98, i32 561, i32 100, i32 562, i32 102, i32 563, i32 104, i32 564, i32 106, i32 565, i32 108, i32 566, i32 110, i32 567, i32 112, i32 568, i32 114, i32 569, i32 116, i32 570, i32 118, i32 571, i32 120, i32 572, i32 122, i32 573, i32 124, i32 574, i32 126, i32 575, i32 128, i32 576, i32 130, i32 577, i32 132, i32 578, i32 134, i32 579, i32 136, i32 580, i32 138, i32 581, i32 140, i32 582, i32 142, i32 583, i32 144, i32 584, i32 146, i32 585, i32 148, i32 586, i32 150, i32 587, i32 152, i32 588, i32 154, i32 589, i32 156, i32 590, i32 158, i32 591, i32 160, i32 592, i32 162, i32 593, i32 164, i32 594, i32 166, i32 595, i32 168, i32 596, i32 170, i32 597, i32 172, i32 598, i32 174, i32 599, i32 176, i32 600, i32 178, i32 601, i32 180, i32 602, i32 182, i32 603, i32 184, i32 604, i32 186, i32 605, i32 188, i32 606, i32 190, i32 607, i32 192, i32 608, i32 194, i32 609, i32 196, i32 610, i32 198, i32 611, i32 200, i32 612, i32 202, i32 613, i32 204, i32 614, i32 206, i32 615, i32 208, i32 616, i32 210, i32 617, i32 212, i32 618, i32 214, i32 619, i32 216, i32 620, i32 218, i32 621, i32 220, i32 622, i32 222, i32 623, i32 224, i32 624, i32 226, i32 625, i32 228, i32 626, i32 230, i32 627, i32 232, i32 628, i32 234, i32 629, i32 236, i32 630, i32 238, i32 631, i32 240, i32 632, i32 242, i32 633, i32 244, i32 634, i32 246, i32 635, i32 248, i32 636, i32 250, i32 637, i32 252, i32 638, i32 254, i32 639, i32 256, i32 640, i32 258, i32 641, i32 260, i32 642, i32 262, i32 643, i32 264, i32 644, i32 266, i32 645, i32 268, i32 646, i32 270, i32 647, i32 272, i32 648, i32 274, i32 649, i32 276, i32 650, i32 278, i32 651, i32 280, i32 652, i32 282, i32 653, i32 284, i32 654, i32 286, i32 655, i32 288, i32 656, i32 290, i32 657, i32 292, i32 658, i32 294, i32 659, i32 296, i32 660, i32 298, i32 661, i32 300, i32 662, i32 302, i32 663, i32 304, i32 664, i32 306, i32 665, i32 308, i32 666, i32 310, i32 667, i32 312, i32 668, i32 314, i32 669, i32 316, i32 670, i32 318, i32 671, i32 320, i32 672, i32 322, i32 673, i32 324, i32 674, i32 326, i32 675, i32 328, i32 676, i32 330, i32 677, i32 332, i32 678, i32 334, i32 679, i32 336, i32 680, i32 338, i32 681, i32 340, i32 682, i32 342, i32 683, i32 344, i32 684, i32 346, i32 685, i32 348, i32 686, i32 350, i32 687, i32 352, i32 688, i32 354, i32 689, i32 356, i32 690, i32 358, i32 691, i32 360, i32 692, i32 362, i32 693, i32 364, i32 694, i32 366, i32 695, i32 368, i32 696, i32 370, i32 697, i32 372, i32 698, i32 374, i32 699, i32 376, i32 700, i32 378, i32 701, i32 380, i32 702, i32 382, i32 703, i32 384, i32 704, i32 386, i32 705, i32 388, i32 706, i32 390, i32 707, i32 392, i32 708, i32 394, i32 709, i32 396, i32 710, i32 398, i32 711, i32 400, i32 712, i32 402, i32 713, i32 404, i32 714, i32 406, i32 715, i32 408, i32 716, i32 410, i32 717, i32 412, i32 718, i32 414, i32 719, i32 416, i32 720, i32 418, i32 721, i32 420, i32 722, i32 422, i32 723, i32 424, i32 724, i32 426, i32 725, i32 428, i32 726, i32 430, i32 727, i32 432, i32 728, i32 434, i32 729, i32 436, i32 730, i32 438, i32 731, i32 440, i32 732, i32 442, i32 733, i32 444, i32 734, i32 446, i32 735, i32 448, i32 736, i32 450, i32 737, i32 452, i32 738, i32 454, i32 739, i32 456, i32 740, i32 458, i32 741, i32 460, i32 742, i32 462, i32 743, i32 464, i32 744, i32 466, i32 745, i32 468, i32 746, i32 470, i32 747, i32 472, i32 748, i32 474, i32 749, i32 476, i32 750, i32 478, i32 751, i32 480, i32 752, i32 482, i32 753, i32 484, i32 754, i32 486, i32 755, i32 488, i32 756, i32 490, i32 757, i32 492, i32 758, i32 494, i32 759, i32 496, i32 760, i32 498, i32 761, i32 500, i32 762, i32 502, i32 763, i32 504, i32 764, i32 506, i32 765, i32 508, i32 766, i32 510, i32 767>
  store <512 x i16> %4, <512 x i16>* %agg.result, align 1024
  ret void
}
