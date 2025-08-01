#include "all_your_base.h"

#include <algorithm>
#include <stdexcept>

namespace all_your_base
{
    std::vector<unsigned int> convert(unsigned int from, std::vector<unsigned int> from_digits, unsigned int to)
    {
        if (from < 2 || to < 2)
            throw std::invalid_argument("Bases must be 2 at minimum.");
        unsigned int value = 0;
        for (size_t i = 0; i < from_digits.size(); i++)
        {
            value *= from;
            if (from_digits[i] >= from)
                throw std::invalid_argument("All digits must be lower than the base");
            value += from_digits[i];
        }

        std::vector<unsigned int> result;
        while (value)
        {
            result.push_back(value % to);
            value /= to;
        }
        std::reverse(result.begin(), result.end());
        return result;
    }
}
