;;=============================================================
;;CS 2110 - Spring 2020
;;Homework 5 - Iterative Multiplication
;;=============================================================
;;Name:
;;=============================================================
;;Pseudocode (see PDF for explanation)
;;a = (argument 1);
;;b = (argument 2);
;;ANSWER = 0;
;;while (b > 0) {
;;  ANSWER = ANSWER + a;
;;  b--;
;; }
;; note: when the while-loop ends, the value stored at ANSWER is a times b.

.orig x3000
;ANSWER is R1, A is R2, B is R3,

	LD R2, A ; set A to 5
	LD R3, B ; set B to 15
	AND R1, R1, 0 ; set answer to 0

W1	ADD R3, R3, #0 ; while b > 0
	BRNZ ENDW1 ; if R3 is zero or positive, end the loop
	ADD R1, R1, R2 ; ANSWER = ANSWER + A
	ADD R3, R3, #-1 ;
	ST R1, ANSWER ;
	BRNZP W1;

    ;;YOUR CODE GOES HERE
ENDW1
HALT

A   .fill 5
B   .fill 15

ANSWER .blkw 1

.end
