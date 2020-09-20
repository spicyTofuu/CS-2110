;;=============================================================
;;CS 2110 - Spring 2020
;;Homework 5 - Make elements of a Linked List into a string
;;=============================================================
;;Name:
;;=============================================================
;;Pseudocode (see PDF for explanation)
;;length = LL.length;
;;curr = LL.head; //HINT: What can an LDI instruction be used for?
;;ANSWER = char[length]; //This character array will already be setup for you
;;i = 0;
;;while (curr != null) {
;;  ANSWER[i] = curr.value;
;;  curr = curr.next;
;;  i++;
;;}


.orig x3000
; Length is R2, LL is R1, curr is R3, Answer is R4, i is R5
	
	LD R1, LL;
	LDR R2, R1, 1; find the length of the ll
	LDR R3, R1, 0; set up the current
	LD R4, ANSWER; set answer to x5000
	AND R5, R5, 0; i = 0

W1	
	ADD R3, R3, 0; gets the address of current
	BRz ENDW1;

	ADD R4, R4, R5; add i to the address;

	LDR R7, R3, 1; curr.valiue
	STR R7, R4, 0; Answer[i]
	LDR R3, R3, 0; curr = curr.next
	ADD R4, R4, 1; i++
	BR W1 ; restart the loop






ENDW1
	STR R3, R4, 0;
HALT

LL .fill x6000

ANSWER .fill x5000
.end

.orig x4000
.fill x4008
.fill 98
.fill x400A
.fill 73
.fill x4002
.fill 103
.fill x0000 
.fill 114
.fill x4004
.fill 97
.fill x4006
.fill 116
.end

.orig x5000
.blkw 7
.end

.orig x6000
.fill x4000
.fill 6
.end
