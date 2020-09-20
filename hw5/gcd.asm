;;=======================================
;; CS 2110 - Spring 2019
;; HW6 - Recursive Greatest Common Denominator
;;=======================================
;; Name:
;;=======================================

;; In this file, you must implement the 'gcd' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff:
;; don't run this directly by pressing 'RUN' in complx, since there is nothing
;; put at address x3000. Instead, load it and use 'Debug' -> 'Simulate Subroutine
;; Call' and choose the 'gcd' label.


.orig x3000
;; this is main
;ToReturn
HALT
gcd
;; See the PDF for more information on what this subroutine should do.
;;
;; Arguments of GCD: integer a, integer b
;;
;; Psuedocode:
;; gcd(int a, int b) {
;;     if (a == b) {
;;         return a;
;;     } else if (a < b) {
;;         return gcd(b, a);
;;     } else {
;;         return gcd(a - b, b);
;;     }
;; }
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
    LDR R1, R5, #5; b

    NOT R2, R1
    ADD R2, R2, #1; b = - b
    ADD R2, R2, R0; a + - b
    BRz storeA;
    BRn again

    NOT R3, R1
    ADD R3, R3, 1; b = -b >> R3
    ADD R3, R0, R3; a - b >> R3
    ADD R6, R6, -2
    STR R3, R6, 0
    STR R1, R6, 1
    JSR gcd
    LDR R0, R6, 0
    ADD R6, R6, #3;
    BR storeA

storeA
    STR R0, R5, #3; R2 <= a
    BR teardown


again
    ADD R6, R6, -2
    STR R1, R6, 0
    STR R0, R6, 1
    JSR gcd
    LDR R0, R6, 0
    ADD R6, R6, #3;
    BR storeA


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
