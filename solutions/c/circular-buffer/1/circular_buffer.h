#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H
#include <stdlib.h>
#include <stdint.h>

typedef int buffer_value_t;
typedef struct circular_buffer_t
{
    size_t capacity;
    size_t start;
    size_t size;
    buffer_value_t *buffer;
} circular_buffer_t;

circular_buffer_t *new_circular_buffer(size_t capacity);

void delete_buffer(circular_buffer_t *circular_buffer);
void clear_buffer(circular_buffer_t *circular_buffer);

int16_t read(circular_buffer_t *circular_buffer, buffer_value_t *value);

int16_t write(circular_buffer_t *circular_buffer, buffer_value_t value);
int16_t overwrite(circular_buffer_t *circular_buffer, buffer_value_t value);

#endif
