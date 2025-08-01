#include "reverse_string.h"

namespace reverse_string
{
    std::string reverse_string(std::string s)
    {
        std::string result(s.size(), ' ');

        for (size_t i = 0; i < s.size(); i++)
        {
            result[i] = s[s.size() - i - 1];
        }

        return result;
    }
}
