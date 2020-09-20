;;=============================================================
;;CS 2110 - Spring 2020
;;Homework 5 - Print the Vowels in a String
;;=============================================================
;;Name: Jiaxuan Chen
;;=============================================================
;;Pseudocode (see PDF for explanation)
;;string = "TWENTY ONE TEN";
;;i = 0;
;;while(string[i] != ’\0’){
;;  if(string[i] == ’A’ || string[i] == ’E’ ||
;;  string[i] == ’I’ || string[i] == ’O’ ||
;;  string[i] == ’U’){
;;      print(string[i]);
;;  }
;;i++;
;;}
.orig x3000
;STRING is R4, i is R1, temp is R2, memTemp is R3, Answer is R0
	LD R4, STRING;
	AND R1, R1, 0;


W1	ADD R3, R4, R1; address of string[i]
	LDR R3, R3, #0; value at string[i]
	BRz ENDW1; if string[i] = 0, end the loop

	LD R5, A;
	NOT R5, R5;
	ADD R5, R5, #1;
	ADD R2, R3, R5; string[i] + (-A)
	BRz act;

	LD R5, E;
	NOT R5, R5;
	ADD R5, R5, #1;
	ADD R2, R3, R5; string[i] + (-E)
	BRz act;

	LD R5, I;
	NOT R5, R5;
	ADD R5, R5, #1;
	ADD R2, R3, R5; string[i] + (-I)
	BRz act;

	LD R5, O;
	NOT R5, R5;
	ADD R5, R5, #1;
	ADD R2, R3, R5; string[i] + (-O)
	BRz act;

	LD R5, U;
	NOT R5, R5;
	ADD R5, R5, #1;
	ADD R2, R3, R5; string[i] + (-U)
	BRnp ENDif;

act	AND R0, R0, 0;
	ADD R0, R0, R3; answer = answer + Vowel
	OUT

ENDif
	ADD R1, R1, #1;
	BR W1;

ENDW1


HALT

A .fill x41    ;; A in ASII
E .fill x45;
I .fill x49;
O .fill x4f;
U .fill x55;
STRING .fill x4000
.end

.orig x4000
.stringz "TWENTY ONE TEN"
.end
