#include "allergies.h"
#include <stddef.h>

bool is_allergic_to(allergen_t allergen, uint32_t score)
{
    return ((score >> allergen) & 1) == 1;
}

allergen_list_t get_allergens(uint32_t score)
{
    allergen_list_t result;
    result.count = 0;
    for (size_t i = 0; i < ALLERGEN_COUNT; i++)
    {
        result.allergens[i] = is_allergic_to(i, score);
        if (result.allergens[i])
            result.count++;
    }
    return result;
}