/**
 * @file hw7.c
 * @author YOUR NAME HERE
 * @brief Command-line argument & expression parsing logic
 * @date 2020-03-xx
 */

// DO NOT MODIFY THE INCLUDE(s) LIST
#include <stdio.h>
#include "hw7.h"
#include "errcodes.h"

#define FALSE 0
#define TRUE 1

// One-time defined global array of expressions
struct expression arr[MAX_NUMBER_OF_EXPRESSIONS];

/**
 * @brief Convert a string containing ASCII characters (in decimal) to an int.
 * 
 * @param str A null-terminated C string
 * @return int the corresponding decimal value of the passed in str
 */
int decimalStringToInt(const char *str)
{
    UNUSED_PARAM(str);
    int newInt = 0;
    while(*str) {
        newInt = newInt * 10 + (*str++ - '0');
    }
    return newInt;

}

/**
 * @brief Convert a string containing ASCII characters (in hex) to an int.
 * 
 * @param str A null-terminated C string
 * @return int the corresponding decimal value of the passed in hexadecimal str
 */
int hexStringToInt(const char *str)
{
    UNUSED_PARAM(str);
    int newInt = 0;
    while(*str) {
        int temp = *str++;
        if (temp >= '0' && temp <= '9') {
        temp = temp - '0';
        }
        else if (temp >= 'a' && temp <='f') {
        temp = temp - 'a' + 10;
        }
        else if (temp >= 'A' && temp <='F') {
        temp = temp - 'A' + 10;
        }
        newInt = newInt * 16;
        newInt = newInt + (temp & 0xF);
        }
        return newInt;
    }
/**
 * @brief Parser algorithm for determining the result of a basic math expression.
 * 
 * @param expression A null terminated expression retrieved as a command line arg
 * @param index Indicating the corresponding struct in the global struct array (for this expression) to be populated
 */
void parseExpression(char *expression, int index)
{
    UNUSED_PARAM(expression);
    UNUSED_PARAM(index);
    char cpyExpression[26]; //create a cpy for expression
    my_strncpy(cpyExpression, expression, 26); // ^

    char temp[26]; //string that holds the String of numbers, either hex or decimal
    int i = 0;
    while (*expression >= '0') { //check if the current char in expression is + or -, or null terminated
        temp[i] = *expression;
        expression++;
        i++;
    }
    int operand1; 
    if (temp[0] == '0' && temp[1] == 'x') { // check if the number is a hex or demcimal, then convert the string to an int
        operand1 = hexStringToInt(temp);
    } else {
        operand1 = decimalStringToInt(temp);
    }

    char ope = *expression; //gets the operator
    expression++;

    while (*expression != '\0') { //if expression reaches its null termanation, then halt the loop
        i = 0;
        while (*expression >= '0' || *expression != '\0') { //gets the second operand as a string
        temp[i] = *expression;
        expression++;
        i++;
        }
        int operand2 ;
        if (temp[0] == '0' && temp[1] == 'x') { //convert the string to an int
            operand2 = hexStringToInt(temp);
        } else {
            operand2 = decimalStringToInt(temp);
        }
        if (ope == '+') { //check wether the operator is a '+' or a '-' (for this hw, we're only care about + and -)
            operand1 = operand1 + operand2; //do the calculation then saves the result to operand1
        } else if (ope == '-') {
            operand1 = operand1 - operand2;
        }

    }

    arr[index].result = operand1;
    arr[index].buffer[index] = *cpyExpression;



    // TODO: Iterate through the string, parsing each sum term and adding them to a result
    
    // TODO: Initialize the struct info for this expression and write it to the struct
}

/**
 * @brief Helper method for printing out the global array struct info
 * DO NOT MODIFY THIS METHOD AS IT IS USED FOR THE LAST STEP (PIPE).
 */
void printArrayDebug(void)
{
    // Safety check
    if (sizeof(arr) / sizeof(arr[0]) != MAX_NUMBER_OF_EXPRESSIONS)
    {
        printf("ERROR: MISMATCH ARRAY LENGTH WITH MACRO: MAX_NUMBER_OF_EXPRESSIONS.\n");
        return;
    }

    for (int i = 0; i < MAX_NUMBER_OF_EXPRESSIONS; i++)
    {
        printf("\nStruct info at index %d:\n", i);
        printf("Expression: %s\n", arr[i].buffer);
        printf("Result: %d\n", arr[i].result);
        printf("ErrorCode: %u\n", arr[i].errorCode);
        printf("---------------------\n");
    }
}

/**
 * @brief Main method, responsible for parsing command line argument and populating expression structs in the global arr
 * 
 * @param argc argument count
 * @param argv argument vector (it's an array of strings)
 * @return int status code of the program termination
 */
int my_main(int argc, char const *argv[])
{
    UNUSED_FUNC(hexStringToInt);
    UNUSED_FUNC(parseExpression);
    UNUSED_FUNC(printArrayDebug);
    UNUSED_FUNC(decimalStringToInt);
    UNUSED_PARAM(argv);
    
    // Initial check: We need at least 1 math expression passed in
    // ( Yes argc can possibly be zero! But we don't worry about that too much in this hw :) )
    if (argc < 2)
    {
        printf("USAGE:   ./hw7 [-d] \"basic math expressions separated by quotation marks\"\n");
        printf("EXAMPLE: ./hw7 \"3+0x40-7+5\" \"0xA6+5000-45\"\n");
        printf("EXAMPLE FOR PRINTING OUT DEBUG INFO: ./hw7 -d \"3+0x40-7+5\" \"0xA6+5000-45\"\n");
        return 1; // Exit failure (value is implementation defined)
    }

    // Note 1: If debug flag is presented in any other location besides argv[1], it should be treated as a bad HEX value

    // Note 2: In order to protect our struct array from overflow and undefined behavior,
    // we need to make sure we don't pass in more command-line arguments than necessary.
    // Later on in the course you will learn how to dynamically allocate space for situations like this!

    return 0; // EXIT_SUCCESS
}
