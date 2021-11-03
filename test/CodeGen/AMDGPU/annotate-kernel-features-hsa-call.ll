; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --check-globals
; RUN: opt -mtriple=amdgcn-unknown-amdhsa -S -amdgpu-annotate-kernel-features < %s | FileCheck -check-prefixes=AKF_HSA %s
; RUN: opt -mtriple=amdgcn-unknown-amdhsa -S -amdgpu-attributor < %s | FileCheck -check-prefixes=ATTRIBUTOR_HSA %s

; TODO: The test contains UB which is refined by the Attributor and should be removed.

declare i32 @llvm.amdgcn.workgroup.id.x() #0
declare i32 @llvm.amdgcn.workgroup.id.y() #0
declare i32 @llvm.amdgcn.workgroup.id.z() #0

declare i32 @llvm.amdgcn.workitem.id.x() #0
declare i32 @llvm.amdgcn.workitem.id.y() #0
declare i32 @llvm.amdgcn.workitem.id.z() #0

declare i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #0
declare i8 addrspace(4)* @llvm.amdgcn.queue.ptr() #0
declare i8 addrspace(4)* @llvm.amdgcn.kernarg.segment.ptr() #0
declare i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #0
declare i64 @llvm.amdgcn.dispatch.id() #0

define void @use_workitem_id_x() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workitem_id_x
; AKF_HSA-SAME: () #[[ATTR1:[0-9]+]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.x()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workitem_id_x
; ATTRIBUTOR_HSA-SAME: () #[[ATTR1:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.x()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workitem.id.x()
  store volatile i32 %val, i32 addrspace(1)* undef
  ret void
}

define void @use_workitem_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workitem_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.y()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workitem_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR2:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.y()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workitem.id.y()
  store volatile i32 %val, i32 addrspace(1)* undef
  ret void
}

define void @use_workitem_id_z() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workitem_id_z
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.z()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workitem_id_z
; ATTRIBUTOR_HSA-SAME: () #[[ATTR3:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.z()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workitem.id.z()
  store volatile i32 %val, i32 addrspace(1)* undef
  ret void
}

define void @use_workgroup_id_x() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_x
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workgroup.id.x()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_x
; ATTRIBUTOR_HSA-SAME: () #[[ATTR4:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workgroup.id.x()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workgroup.id.x()
  store volatile i32 %val, i32 addrspace(1)* undef
  ret void
}

define void @use_workgroup_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workgroup.id.y()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR5:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workgroup.id.y()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workgroup.id.y()
  store volatile i32 %val, i32 addrspace(1)* undef
  ret void
}

define void @use_workgroup_id_z() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_z
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workgroup.id.z()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_z
; ATTRIBUTOR_HSA-SAME: () #[[ATTR6:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workgroup.id.z()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workgroup.id.z()
  store volatile i32 %val, i32 addrspace(1)* undef
  ret void
}

define void @use_dispatch_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_dispatch_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[DISPATCH_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
; AKF_HSA-NEXT:    store volatile i8 addrspace(4)* [[DISPATCH_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_dispatch_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR7:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[DISPATCH_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
; ATTRIBUTOR_HSA-NEXT:    store volatile i8 addrspace(4)* [[DISPATCH_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %dispatch.ptr = call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  store volatile i8 addrspace(4)* %dispatch.ptr, i8 addrspace(4)* addrspace(1)* undef
  ret void
}

define void @use_queue_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_queue_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[QUEUE_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.queue.ptr()
; AKF_HSA-NEXT:    store volatile i8 addrspace(4)* [[QUEUE_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_queue_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR8:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[QUEUE_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.queue.ptr()
; ATTRIBUTOR_HSA-NEXT:    store volatile i8 addrspace(4)* [[QUEUE_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %queue.ptr = call i8 addrspace(4)* @llvm.amdgcn.queue.ptr()
  store volatile i8 addrspace(4)* %queue.ptr, i8 addrspace(4)* addrspace(1)* undef
  ret void
}

define void @use_dispatch_id() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_dispatch_id
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i64 @llvm.amdgcn.dispatch.id()
; AKF_HSA-NEXT:    store volatile i64 [[VAL]], i64 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_dispatch_id
; ATTRIBUTOR_HSA-SAME: () #[[ATTR9:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i64 @llvm.amdgcn.dispatch.id()
; ATTRIBUTOR_HSA-NEXT:    store volatile i64 [[VAL]], i64 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i64 @llvm.amdgcn.dispatch.id()
  store volatile i64 %val, i64 addrspace(1)* undef
  ret void
}

define void @use_workgroup_id_y_workgroup_id_z() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_y_workgroup_id_z
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL0:%.*]] = call i32 @llvm.amdgcn.workgroup.id.y()
; AKF_HSA-NEXT:    [[VAL1:%.*]] = call i32 @llvm.amdgcn.workgroup.id.z()
; AKF_HSA-NEXT:    store volatile i32 [[VAL0]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    store volatile i32 [[VAL1]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_workgroup_id_y_workgroup_id_z
; ATTRIBUTOR_HSA-SAME: () #[[ATTR10:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL0:%.*]] = call i32 @llvm.amdgcn.workgroup.id.y()
; ATTRIBUTOR_HSA-NEXT:    [[VAL1:%.*]] = call i32 @llvm.amdgcn.workgroup.id.z()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL0]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL1]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val0 = call i32 @llvm.amdgcn.workgroup.id.y()
  %val1 = call i32 @llvm.amdgcn.workgroup.id.z()
  store volatile i32 %val0, i32 addrspace(1)* undef
  store volatile i32 %val1, i32 addrspace(1)* undef
  ret void
}

define void @func_indirect_use_workitem_id_x() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workitem_id_x
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workitem_id_x()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workitem_id_x
; ATTRIBUTOR_HSA-SAME: () #[[ATTR1]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workitem_id_x()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workitem_id_x()
  ret void
}

define void @kernel_indirect_use_workitem_id_x() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@kernel_indirect_use_workitem_id_x
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workitem_id_x()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@kernel_indirect_use_workitem_id_x
; ATTRIBUTOR_HSA-SAME: () #[[ATTR1]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workitem_id_x()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workitem_id_x()
  ret void
}

define void @func_indirect_use_workitem_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workitem_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workitem_id_y()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workitem_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR2]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workitem_id_y()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workitem_id_y()
  ret void
}

define void @func_indirect_use_workitem_id_z() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workitem_id_z
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workitem_id_z()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workitem_id_z
; ATTRIBUTOR_HSA-SAME: () #[[ATTR3]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workitem_id_z()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workitem_id_z()
  ret void
}

define void @func_indirect_use_workgroup_id_x() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_x
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workgroup_id_x()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_x
; ATTRIBUTOR_HSA-SAME: () #[[ATTR4]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workgroup_id_x()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workgroup_id_x()
  ret void
}

define void @kernel_indirect_use_workgroup_id_x() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@kernel_indirect_use_workgroup_id_x
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workgroup_id_x()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@kernel_indirect_use_workgroup_id_x
; ATTRIBUTOR_HSA-SAME: () #[[ATTR4]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workgroup_id_x()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workgroup_id_x()
  ret void
}

define void @func_indirect_use_workgroup_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workgroup_id_y()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR5]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workgroup_id_y()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workgroup_id_y()
  ret void
}

define void @func_indirect_use_workgroup_id_z() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_z
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_workgroup_id_z()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_z
; ATTRIBUTOR_HSA-SAME: () #[[ATTR6]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_workgroup_id_z()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_workgroup_id_z()
  ret void
}

define void @func_indirect_indirect_use_workgroup_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_indirect_use_workgroup_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @func_indirect_use_workgroup_id_y()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_indirect_use_workgroup_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR5]] {
; ATTRIBUTOR_HSA-NEXT:    call void @func_indirect_use_workgroup_id_y()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @func_indirect_use_workgroup_id_y()
  ret void
}

define void @indirect_x2_use_workgroup_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@indirect_x2_use_workgroup_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @func_indirect_indirect_use_workgroup_id_y()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@indirect_x2_use_workgroup_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR5]] {
; ATTRIBUTOR_HSA-NEXT:    call void @func_indirect_indirect_use_workgroup_id_y()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @func_indirect_indirect_use_workgroup_id_y()
  ret void
}

define void @func_indirect_use_dispatch_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_dispatch_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_dispatch_ptr()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_dispatch_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR7]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_dispatch_ptr()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_dispatch_ptr()
  ret void
}

define void @func_indirect_use_queue_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_queue_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_queue_ptr()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_queue_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR8]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_queue_ptr()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_queue_ptr()
  ret void
}

define void @func_indirect_use_dispatch_id() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_dispatch_id
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_dispatch_id()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_dispatch_id
; ATTRIBUTOR_HSA-SAME: () #[[ATTR9]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_dispatch_id()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_dispatch_id()
  ret void
}

define void @func_indirect_use_workgroup_id_y_workgroup_id_z() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_y_workgroup_id_z
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @func_indirect_use_workgroup_id_y_workgroup_id_z()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_workgroup_id_y_workgroup_id_z
; ATTRIBUTOR_HSA-SAME: () #[[ATTR11:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    call void @func_indirect_use_workgroup_id_y_workgroup_id_z()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @func_indirect_use_workgroup_id_y_workgroup_id_z()
  ret void
}

define void @recursive_use_workitem_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@recursive_use_workitem_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.y()
; AKF_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; AKF_HSA-NEXT:    call void @recursive_use_workitem_id_y()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@recursive_use_workitem_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR2]] {
; ATTRIBUTOR_HSA-NEXT:    [[VAL:%.*]] = call i32 @llvm.amdgcn.workitem.id.y()
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 [[VAL]], i32 addrspace(1)* undef, align 4
; ATTRIBUTOR_HSA-NEXT:    call void @recursive_use_workitem_id_y()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %val = call i32 @llvm.amdgcn.workitem.id.y()
  store volatile i32 %val, i32 addrspace(1)* undef
  call void @recursive_use_workitem_id_y()
  ret void
}

define void @call_recursive_use_workitem_id_y() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@call_recursive_use_workitem_id_y
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @recursive_use_workitem_id_y()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@call_recursive_use_workitem_id_y
; ATTRIBUTOR_HSA-SAME: () #[[ATTR2]] {
; ATTRIBUTOR_HSA-NEXT:    call void @recursive_use_workitem_id_y()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @recursive_use_workitem_id_y()
  ret void
}

define void @use_group_to_flat_addrspacecast(i32 addrspace(3)* %ptr) #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_group_to_flat_addrspacecast
; AKF_HSA-SAME: (i32 addrspace(3)* [[PTR:%.*]]) #[[ATTR1]] {
; AKF_HSA-NEXT:    [[STOF:%.*]] = addrspacecast i32 addrspace(3)* [[PTR]] to i32 addrspace(4)*
; AKF_HSA-NEXT:    store volatile i32 0, i32 addrspace(4)* [[STOF]], align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_group_to_flat_addrspacecast
; ATTRIBUTOR_HSA-SAME: (i32 addrspace(3)* [[PTR:%.*]]) #[[ATTR8]] {
; ATTRIBUTOR_HSA-NEXT:    [[STOF:%.*]] = addrspacecast i32 addrspace(3)* [[PTR]] to i32 addrspace(4)*
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 0, i32 addrspace(4)* [[STOF]], align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %stof = addrspacecast i32 addrspace(3)* %ptr to i32 addrspace(4)*
  store volatile i32 0, i32 addrspace(4)* %stof
  ret void
}


define void @use_group_to_flat_addrspacecast_gfx9(i32 addrspace(3)* %ptr) #2 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_group_to_flat_addrspacecast_gfx9
; AKF_HSA-SAME: (i32 addrspace(3)* [[PTR:%.*]]) #[[ATTR2:[0-9]+]] {
; AKF_HSA-NEXT:    [[STOF:%.*]] = addrspacecast i32 addrspace(3)* [[PTR]] to i32 addrspace(4)*
; AKF_HSA-NEXT:    store volatile i32 0, i32 addrspace(4)* [[STOF]], align 4
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_group_to_flat_addrspacecast_gfx9
; ATTRIBUTOR_HSA-SAME: (i32 addrspace(3)* [[PTR:%.*]]) #[[ATTR12:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[STOF:%.*]] = addrspacecast i32 addrspace(3)* [[PTR]] to i32 addrspace(4)*
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 0, i32 addrspace(4)* [[STOF]], align 4
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %stof = addrspacecast i32 addrspace(3)* %ptr to i32 addrspace(4)*
  store volatile i32 0, i32 addrspace(4)* %stof
  ret void
}

define void @use_group_to_flat_addrspacecast_queue_ptr_gfx9(i32 addrspace(3)* %ptr) #2 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_group_to_flat_addrspacecast_queue_ptr_gfx9
; AKF_HSA-SAME: (i32 addrspace(3)* [[PTR:%.*]]) #[[ATTR2]] {
; AKF_HSA-NEXT:    [[STOF:%.*]] = addrspacecast i32 addrspace(3)* [[PTR]] to i32 addrspace(4)*
; AKF_HSA-NEXT:    store volatile i32 0, i32 addrspace(4)* [[STOF]], align 4
; AKF_HSA-NEXT:    call void @func_indirect_use_queue_ptr()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_group_to_flat_addrspacecast_queue_ptr_gfx9
; ATTRIBUTOR_HSA-SAME: (i32 addrspace(3)* [[PTR:%.*]]) #[[ATTR13:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[STOF:%.*]] = addrspacecast i32 addrspace(3)* [[PTR]] to i32 addrspace(4)*
; ATTRIBUTOR_HSA-NEXT:    store volatile i32 0, i32 addrspace(4)* [[STOF]], align 4
; ATTRIBUTOR_HSA-NEXT:    call void @func_indirect_use_queue_ptr()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %stof = addrspacecast i32 addrspace(3)* %ptr to i32 addrspace(4)*
  store volatile i32 0, i32 addrspace(4)* %stof
  call void @func_indirect_use_queue_ptr()
  ret void
}

define void @indirect_use_group_to_flat_addrspacecast() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@indirect_use_group_to_flat_addrspacecast
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_group_to_flat_addrspacecast(i32 addrspace(3)* null)
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@indirect_use_group_to_flat_addrspacecast
; ATTRIBUTOR_HSA-SAME: () #[[ATTR8]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_group_to_flat_addrspacecast(i32 addrspace(3)* null)
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_group_to_flat_addrspacecast(i32 addrspace(3)* null)
  ret void
}

define void @indirect_use_group_to_flat_addrspacecast_gfx9() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@indirect_use_group_to_flat_addrspacecast_gfx9
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_group_to_flat_addrspacecast_gfx9(i32 addrspace(3)* null)
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@indirect_use_group_to_flat_addrspacecast_gfx9
; ATTRIBUTOR_HSA-SAME: () #[[ATTR11]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_group_to_flat_addrspacecast_gfx9(i32 addrspace(3)* null)
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_group_to_flat_addrspacecast_gfx9(i32 addrspace(3)* null)
  ret void
}

define void @indirect_use_group_to_flat_addrspacecast_queue_ptr_gfx9() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@indirect_use_group_to_flat_addrspacecast_queue_ptr_gfx9
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_group_to_flat_addrspacecast_queue_ptr_gfx9(i32 addrspace(3)* null)
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@indirect_use_group_to_flat_addrspacecast_queue_ptr_gfx9
; ATTRIBUTOR_HSA-SAME: () #[[ATTR8]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_group_to_flat_addrspacecast_queue_ptr_gfx9(i32 addrspace(3)* null)
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_group_to_flat_addrspacecast_queue_ptr_gfx9(i32 addrspace(3)* null)
  ret void
}

define void @use_kernarg_segment_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_kernarg_segment_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[KERNARG_SEGMENT_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.kernarg.segment.ptr()
; AKF_HSA-NEXT:    store volatile i8 addrspace(4)* [[KERNARG_SEGMENT_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_kernarg_segment_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR11]] {
; ATTRIBUTOR_HSA-NEXT:    [[KERNARG_SEGMENT_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.kernarg.segment.ptr()
; ATTRIBUTOR_HSA-NEXT:    store volatile i8 addrspace(4)* [[KERNARG_SEGMENT_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %kernarg.segment.ptr = call i8 addrspace(4)* @llvm.amdgcn.kernarg.segment.ptr()
  store volatile i8 addrspace(4)* %kernarg.segment.ptr, i8 addrspace(4)* addrspace(1)* undef
  ret void
}
define void @func_indirect_use_kernarg_segment_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_kernarg_segment_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_kernarg_segment_ptr()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_kernarg_segment_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR11]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_kernarg_segment_ptr()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_kernarg_segment_ptr()
  ret void
}

define amdgpu_kernel void @kern_use_implicitarg_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@kern_use_implicitarg_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[IMPLICITARG_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
; AKF_HSA-NEXT:    store volatile i8 addrspace(4)* [[IMPLICITARG_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@kern_use_implicitarg_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR14:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    [[IMPLICITARG_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
; ATTRIBUTOR_HSA-NEXT:    store volatile i8 addrspace(4)* [[IMPLICITARG_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %implicitarg.ptr = call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  store volatile i8 addrspace(4)* %implicitarg.ptr, i8 addrspace(4)* addrspace(1)* undef
  ret void
}

define void @use_implicitarg_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_implicitarg_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[IMPLICITARG_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
; AKF_HSA-NEXT:    store volatile i8 addrspace(4)* [[IMPLICITARG_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_implicitarg_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR14]] {
; ATTRIBUTOR_HSA-NEXT:    [[IMPLICITARG_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
; ATTRIBUTOR_HSA-NEXT:    store volatile i8 addrspace(4)* [[IMPLICITARG_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  %implicitarg.ptr = call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  store volatile i8 addrspace(4)* %implicitarg.ptr, i8 addrspace(4)* addrspace(1)* undef
  ret void
}

define void @func_indirect_use_implicitarg_ptr() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_implicitarg_ptr
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    call void @use_implicitarg_ptr()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_implicitarg_ptr
; ATTRIBUTOR_HSA-SAME: () #[[ATTR14]] {
; ATTRIBUTOR_HSA-NEXT:    call void @use_implicitarg_ptr()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @use_implicitarg_ptr()
  ret void
}

declare void @external.func() #3

; This function gets deleted.
define internal void @defined.func() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@defined.func
; AKF_HSA-SAME: () #[[ATTR3:[0-9]+]] {
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@defined.func
; ATTRIBUTOR_HSA-SAME: () #[[ATTR16:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  ret void
}

define void @func_call_external() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_call_external
; AKF_HSA-SAME: () #[[ATTR3]] {
; AKF_HSA-NEXT:    call void @external.func()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_call_external
; ATTRIBUTOR_HSA-SAME: () #[[ATTR15:[0-9]+]] {
; ATTRIBUTOR_HSA-NEXT:    call void @external.func()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @external.func()
  ret void
}

define void @func_call_defined() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_call_defined
; AKF_HSA-SAME: () #[[ATTR3]] {
; AKF_HSA-NEXT:    call void @defined.func()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_call_defined
; ATTRIBUTOR_HSA-SAME: () #[[ATTR16]] {
; ATTRIBUTOR_HSA-NEXT:    call void @defined.func()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @defined.func()
  ret void
}
define void @func_call_asm() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_call_asm
; AKF_HSA-SAME: () #[[ATTR3]] {
; AKF_HSA-NEXT:    call void asm sideeffect "", ""() #[[ATTR3]]
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_call_asm
; ATTRIBUTOR_HSA-SAME: () #[[ATTR16]] {
; ATTRIBUTOR_HSA-NEXT:    call void asm sideeffect "", ""() #[[ATTR17:[0-9]+]]
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void asm sideeffect "", ""() #3
  ret void
}

define amdgpu_kernel void @kern_call_external() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@kern_call_external
; AKF_HSA-SAME: () #[[ATTR4:[0-9]+]] {
; AKF_HSA-NEXT:    call void @external.func()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@kern_call_external
; ATTRIBUTOR_HSA-SAME: () #[[ATTR15]] {
; ATTRIBUTOR_HSA-NEXT:    call void @external.func()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @external.func()
  ret void
}

define amdgpu_kernel void @func_kern_defined() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_kern_defined
; AKF_HSA-SAME: () #[[ATTR4]] {
; AKF_HSA-NEXT:    call void @defined.func()
; AKF_HSA-NEXT:    ret void
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_kern_defined
; ATTRIBUTOR_HSA-SAME: () #[[ATTR16]] {
; ATTRIBUTOR_HSA-NEXT:    call void @defined.func()
; ATTRIBUTOR_HSA-NEXT:    ret void
;
  call void @defined.func()
  ret void
}

define i32 @use_dispatch_ptr_ret_type() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@use_dispatch_ptr_ret_type
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[DISPATCH_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
; AKF_HSA-NEXT:    store volatile i8 addrspace(4)* [[DISPATCH_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; AKF_HSA-NEXT:    ret i32 0
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@use_dispatch_ptr_ret_type
; ATTRIBUTOR_HSA-SAME: () #[[ATTR7]] {
; ATTRIBUTOR_HSA-NEXT:    [[DISPATCH_PTR:%.*]] = call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
; ATTRIBUTOR_HSA-NEXT:    store volatile i8 addrspace(4)* [[DISPATCH_PTR]], i8 addrspace(4)* addrspace(1)* undef, align 8
; ATTRIBUTOR_HSA-NEXT:    ret i32 0
;
  %dispatch.ptr = call i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  store volatile i8 addrspace(4)* %dispatch.ptr, i8 addrspace(4)* addrspace(1)* undef
  ret i32 0
}

define float @func_indirect_use_dispatch_ptr_constexpr_cast_func() #1 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_use_dispatch_ptr_constexpr_cast_func
; AKF_HSA-SAME: () #[[ATTR1]] {
; AKF_HSA-NEXT:    [[F:%.*]] = call float bitcast (i32 ()* @use_dispatch_ptr_ret_type to float ()*)()
; AKF_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; AKF_HSA-NEXT:    ret float [[FADD]]
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_use_dispatch_ptr_constexpr_cast_func
; ATTRIBUTOR_HSA-SAME: () #[[ATTR7]] {
; ATTRIBUTOR_HSA-NEXT:    [[F:%.*]] = call float bitcast (i32 ()* @use_dispatch_ptr_ret_type to float ()*)()
; ATTRIBUTOR_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; ATTRIBUTOR_HSA-NEXT:    ret float [[FADD]]
;
  %f = call float bitcast (i32()* @use_dispatch_ptr_ret_type to float()*)()
  %fadd = fadd float %f, 1.0
  ret float %fadd
}

define float @func_indirect_call(float()* %fptr) #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_indirect_call
; AKF_HSA-SAME: (float ()* [[FPTR:%.*]]) #[[ATTR3]] {
; AKF_HSA-NEXT:    [[F:%.*]] = call float [[FPTR]]()
; AKF_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; AKF_HSA-NEXT:    ret float [[FADD]]
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_indirect_call
; ATTRIBUTOR_HSA-SAME: (float ()* [[FPTR:%.*]]) #[[ATTR15]] {
; ATTRIBUTOR_HSA-NEXT:    [[F:%.*]] = call float [[FPTR]]()
; ATTRIBUTOR_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; ATTRIBUTOR_HSA-NEXT:    ret float [[FADD]]
;
  %f = call float %fptr()
  %fadd = fadd float %f, 1.0
  ret float %fadd
}

declare float @extern() #3
define float @func_extern_call() #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_extern_call
; AKF_HSA-SAME: () #[[ATTR3]] {
; AKF_HSA-NEXT:    [[F:%.*]] = call float @extern()
; AKF_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; AKF_HSA-NEXT:    ret float [[FADD]]
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_extern_call
; ATTRIBUTOR_HSA-SAME: () #[[ATTR15]] {
; ATTRIBUTOR_HSA-NEXT:    [[F:%.*]] = call float @extern()
; ATTRIBUTOR_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; ATTRIBUTOR_HSA-NEXT:    ret float [[FADD]]
;
  %f = call float @extern()
  %fadd = fadd float %f, 1.0
  ret float %fadd
}

define float @func_null_call(float()* %fptr) #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_null_call
; AKF_HSA-SAME: (float ()* [[FPTR:%.*]]) #[[ATTR3]] {
; AKF_HSA-NEXT:    [[F:%.*]] = call float null()
; AKF_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; AKF_HSA-NEXT:    ret float [[FADD]]
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_null_call
; ATTRIBUTOR_HSA-SAME: (float ()* [[FPTR:%.*]]) #[[ATTR15]] {
; ATTRIBUTOR_HSA-NEXT:    [[F:%.*]] = call float null()
; ATTRIBUTOR_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; ATTRIBUTOR_HSA-NEXT:    ret float [[FADD]]
;
  %f = call float null()
  %fadd = fadd float %f, 1.0
  ret float %fadd
}

declare float @llvm.amdgcn.rcp.f32(float) #0

; Calls some other recognized intrinsic
define float @func_other_intrinsic_call(float %arg) #3 {
; AKF_HSA-LABEL: define {{[^@]+}}@func_other_intrinsic_call
; AKF_HSA-SAME: (float [[ARG:%.*]]) #[[ATTR3]] {
; AKF_HSA-NEXT:    [[F:%.*]] = call float @llvm.amdgcn.rcp.f32(float [[ARG]])
; AKF_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; AKF_HSA-NEXT:    ret float [[FADD]]
;
; ATTRIBUTOR_HSA-LABEL: define {{[^@]+}}@func_other_intrinsic_call
; ATTRIBUTOR_HSA-SAME: (float [[ARG:%.*]]) #[[ATTR16]] {
; ATTRIBUTOR_HSA-NEXT:    [[F:%.*]] = call float @llvm.amdgcn.rcp.f32(float [[ARG]])
; ATTRIBUTOR_HSA-NEXT:    [[FADD:%.*]] = fadd float [[F]], 1.000000e+00
; ATTRIBUTOR_HSA-NEXT:    ret float [[FADD]]
;
  %f = call float @llvm.amdgcn.rcp.f32(float %arg)
  %fadd = fadd float %f, 1.0
  ret float %fadd
}

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { nounwind "target-cpu"="fiji" }
attributes #2 = { nounwind "target-cpu"="gfx900" }
attributes #3 = { nounwind }

;.
; AKF_HSA: attributes #[[ATTR0:[0-9]+]] = { nounwind readnone speculatable willreturn }
; AKF_HSA: attributes #[[ATTR1]] = { nounwind "target-cpu"="fiji" }
; AKF_HSA: attributes #[[ATTR2]] = { nounwind "target-cpu"="gfx900" }
; AKF_HSA: attributes #[[ATTR3]] = { nounwind }
; AKF_HSA: attributes #[[ATTR4]] = { nounwind "amdgpu-calls" }
;.
; ATTRIBUTOR_HSA: attributes #[[ATTR0:[0-9]+]] = { nounwind readnone speculatable willreturn }
; ATTRIBUTOR_HSA: attributes #[[ATTR1]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR2]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR3]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR4]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR5]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR6]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR7]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR8]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR9]] = { nounwind "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR10]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR11]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR12]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="gfx900" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR13]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="gfx900" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR14]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "target-cpu"="fiji" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR15]] = { nounwind "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR16]] = { nounwind "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="false" }
; ATTRIBUTOR_HSA: attributes #[[ATTR17]] = { nounwind }
;.
