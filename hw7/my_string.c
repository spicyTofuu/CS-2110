
/**
 * @file my_string.c
 * @author YOUR NAME HERE
 * @brief Your implementation of these famous 3 string.h libraries!
 * 
 * NOTE: NO ARRAY NOTATION IS ALLOWED IN THIS FILE
 * 
 * @date 2020-03-xx
 */

// DO NOT MODIFY THE INCLUDE(s) LIST
#include <stddef.h>
#include "hw7.h"

/**
 * @brief Calculate the length of a string
 * 
 * @param s a constant C string
 * @return size_t the number of characters in the passed in string
 */
size_t my_strlen(const char *s)
{
    UNUSED_PARAM(s);
    unsigned int total = 0;

        while(*s != '\0') {
            total++;
            s++;
        }

    return total;
}


/**
 * @brief Compare two strings
 * 
 * @param s1 First string to be compared
 * @param s2 Second string to be compared
 * @param n First (at most) n bytes to be compared
 * @return int "less than, equal to, or greater than zero if s1 (or the first n bytes thereof) is found, respectively, to be less than, to match, or be greater than s2"
 */
int my_strncmp(const char *s1, const char *s2, size_t n)
{
    UNUSED_PARAM(s1);
    UNUSED_PARAM(s2);
    UNUSED_PARAM(n);
    while (*s1 == *s2 && n > 0) {

        if (n == 0 || *s1 == '\0')
            return 0;
        n--;
        s1++;
        s2++;
    }
    if (n == 0) {
            return 0;
    }
    return (*(unsigned char*)s1 - *(unsigned char *)s2);
}

/**
 * @brief Copy a string
 * 
 * @param dest The destination buffer
 * @param src The source to copy from
 * @param n maximum number of bytes to copy
 * @return char* a pointer same as dest
 */
char *my_strncpy(char *dest, const char *src, size_t n)
{
    UNUSED_PARAM(dest);
    UNUSED_PARAM(src);
    UNUSED_PARAM(n);

    int i;

    i = 0;
  while (n > 0 && *(src + i))
    {
      *(dest + i) = *(src + i);
      ++i;
      --n;
    }
  if (n > 0)
    *(dest + i) = '\0';
  return (dest);

}
