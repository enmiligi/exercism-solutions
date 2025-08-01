#include "scrabble_score.h"
#include <stddef.h>
#include <string.h>
#include <ctype.h>

unsigned int score(const char *word)
{
    unsigned int result = 0;
    for (size_t i = 0; i < strlen(word); i++)
    {
        switch (toupper(word[i]))
        {
        case 'A':
        case 'E':
        case 'I':
        case 'O':
        case 'U':
        case 'L':
        case 'N':
        case 'R':
        case 'S':
        case 'T':
            result += 1;
            break;
        case 'D':
        case 'G':
            result += 2;
            break;
        case 'B':
        case 'C':
        case 'M':
        case 'P':
            result += 3;
            break;
        case 'F':
        case 'H':
        case 'V':
        case 'W':
        case 'Y':
            result += 4;
            break;
        case 'K':
            result += 5;
            break;
        case 'J':
        case 'X':
            result += 8;
            break;
        case 'Q':
        case 'Z':
            result += 10;
            break;
        default:
            break;
        }
    }
    return result;
}