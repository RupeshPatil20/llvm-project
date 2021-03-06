; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i386-unknown-unknown | FileCheck %s

; computeKnownBits determines that we don't need a mask op that is required in the general case.

define i8 @foo(i8 %tmp325) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; CHECK-NEXT:    imull $111, %eax, %ecx
; CHECK-NEXT:    shrl $12, %ecx
; CHECK-NEXT:    leal (%ecx,%ecx,8), %edx
; CHECK-NEXT:    leal (%ecx,%edx,4), %ecx
; CHECK-NEXT:    subb %cl, %al
; CHECK-NEXT:    # kill: def $al killed $al killed $eax
; CHECK-NEXT:    retl
  %t546 = urem i8 %tmp325, 37
  ret i8 %t546
}

