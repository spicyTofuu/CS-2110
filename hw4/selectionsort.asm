;;=============================================================
;;CS 2110 - Spring 2020
;;Homework 5 - Selection Sort
;;=============================================================
;;Name:
;;=============================================================
;;Pseudocode (see PDF for explanation)
;;x = 0;                         // current swapping index in the array
;;len = length of array;
;;while(x < len - 1) {
;;  z = x;                     // index of minimum value in unsorted portion of array
;;  y = x + 1;                 // current index in array
;;  while (y < len) {
;;      if (arr[y] < arr[z]) {
;;          z = y;             // update the index of the minimum value
;;      }
;;      y++;
;;  }
;;  if (z != x) {
;;      temp = arr[x];         // perform a swap
;;      arr[x] = arr[z];
;;      arr[z] = temp;
;;  }
;;      x++;
;;}
.orig x3000

; ARRAY is R0, LENGTH is R7, x is R1, y is R2, z is R3

	AND R1, R1, 0;

W1	LD R7, LENGTH; R7 = length
	NOT R7, R7;
	ADD R7, R7, #1; R7 = - length
	ADD R7, R1, R7; x - length
	ADD R7, R7, #1; x - length + 1 < 0
	BRzp ENDW1

	ADD R3, R1, #0; z = x
	ADD R2, R1, #1; y = x + 1

W2	LD R7, LENGTH;
	NOT R7, R7;
	ADD R7, R7, #1;
	ADD R7, R2, R7;
	BRzp ENDW2

	LD R4, ARRAY; address of arr[0]
	ADD R4, R4, R2; address of arr[y]
	LDR R4, R4, #0; value at arr[y]

	LD R5, ARRAY;
	ADD R5, R5, R3;
	LDR R5, R5, #0; value at arr[z]

	NOT R5, R5;
	ADD R5, R5, #1;
	ADD R5, R4, R5; arr[y] - arr[z]
	BRzp ENDif1

	ADD R3, R2, #0; z = y

ENDif1
	ADD R2, R2, #1; y++

BR W2
ENDW2

	ADD R5, R3, 0;
	ADD R6, R1, 0;
	NOT R6, R6;

	ADD R6, R6, #1;

	ADD R5, R5, R6; z-x
	BRz ENDif2

	LD R5, ARRAY;
	ADD R5, R5, R1; address of x
	LDR R6, R5, #0; R6 has the element x,  temp

	LD R7, ARRAY;
	ADD R7, R7, R3;  R7 has the address of z
	LDR R7, R7, #0; R7 has the element z
	STR R7, R5, #0; arr[x] = arr[z]

	LD R5, ARRAY;
	ADD R5, R5, R3;  R5 has the address of z
	STR R6, R5, #0; arr[z] = arr[x]

ENDif2
	ADD R1, R1, #1;

BR W1
ENDW1

HALT

ARRAY .fill x4000
LENGTH .fill 7
.end

.orig x4000
.fill 4
.fill 9
.fill 0
.fill 2
.fill 9
.fill 3
.fill 10
.end
