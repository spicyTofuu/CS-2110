;;=======================================
;; CS 2110 - Spring 2019
;; HW6 - Recursive Multiplication
;;=======================================
;; Name:
;;=======================================

;; In this file, you must implement the 'mult' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff:
;; don't run this directly by pressing 'RUN' in complx, since there is nothing
;; put at address x3000. Instead, load it and use 'Debug' -> 'Simulate Subroutine
;; Call' and choose the 'mult' label.


.orig x3000
HALT

mult
;; See the PDF for more information on what this subroutine should do.
;;
;; Arguments of mult: integer a, integer b
;;
;; Psuedocode:
;; mult(int a, int b) {
;;     if (a == 0 || b == 0) {
;;         return 0;
;;     }
;;	
;;     // Since one number might be negative, we will only decrement the larger number.
;;     // This ensures that one parameter will eventually become zero.
;;     if (a > b) {
;;         var result = b + mult(a - 1, b);
;;         return result;
;;     } else {
;;         var result = a + mult(a, b - 1);
;;         return result;
;;     }
;; }


;; IMPORTANT NOTE: we recommend following the pseudocode exactly. Part of the autograder checks that your implementation is recursive.
;; This means that your implementation might fail this test if, when calculating mult(6,4), you recursively calculated mult(6,3) instead of mult(5,4).
;; In particular, make sure that if a == b, you calculate mult(a,b-1) and not mult(a-1,b), as the psuedocode says.
;; If you fail a test that expects you to calculate mult(5,4) and you instead calculated mult(4,5), try switching the arguments around when recursively calling mult.


;; YOUR CODE HERE

    ADD R6, R6, #-4;
    STR R7, R6, #2;
    STR R5, R6, #1;
    ADD R5, R6, #0; set up fp
    ADD R6, R6, #-5;
    STR R0, R6, #4;
    STR R1, R6, #3;
    STR R2, R6, #2;
    STR R3, R6, #1;
    STR R4, R6, #0;

    ;; Extract Arguments
    LDR R0, R5, #4; a
    BRz tozero
    LDR R1, R5, #5; b
    BRz tozerob

    NOT R2, R1
    ADD R2, R2, #1; b = - b
    ADD R2, R2, R0; a + - b
    BRn tob

    ADD R6, R6, -2
    STR R1, R6, 1
    ADD R3, R0, #-1; a - 1 >> R3
    STR R3, R6, 0
    JSR mult
    LDR R0, R6, 0;
    ADD R0, R0, R1; b + mult() 
    ADD R1, R0, 0
    ADD R6, R6, #3;
    BR tozero

tozero
    STR R0, R5, #3; R2 <= a
    BR teardown
tozerob
    STR R1, R5, #3; R2 <= a
    BR teardown


tob
    ADD R6, R6, -2
    ADD R2, R1, #-1; b - 1 >> R2
    STR R2, R6, 1
    STR R0, R6, 0
    JSR mult
    LDR R3, R6, 0;
    ADD R0, R0, R3; a + mult() 
    ADD R1, R0, 0
    ADD R6, R6, #3;
    BR tozero

teardown
    LDR R0, R6, #4
    LDR R1, R6, #3
    LDR R2, R6, #2
    LDR R3, R6, #1
    LDR R4, R6, #0
    ADD R6, R5, #0
    LDR R5, R6, #1
    LDR R7, R6, #2
    ADD R6, R6, #3



RET

; Needed by Simulate Subroutine Call in complx
STACK .fill xF000
.end
