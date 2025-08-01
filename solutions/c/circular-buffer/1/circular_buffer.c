#include "circular_buffer.h"
#include <errno.h>

circular_buffer_t *new_circular_buffer(size_t capacity)
{
    buffer_value_t *buffer = malloc(capacity * sizeof(buffer_value_t));
    circular_buffer_t *circular_buffer = malloc(sizeof(circular_buffer_t));
    circular_buffer->buffer = buffer;
    circular_buffer->capacity = capacity;
    circular_buffer->start = 0;
    circular_buffer->size = 0;
    return circular_buffer;
}

void clear_buffer(circular_buffer_t *circular_buffer)
{
    circular_buffer->size = 0;
}

void delete_buffer(circular_buffer_t *circular_buffer)
{
    free(circular_buffer->buffer);
    free(circular_buffer);
}

int16_t read(circular_buffer_t *circular_buffer, buffer_value_t *value)
{
    if (circular_buffer->size == 0)
    {
        errno = ENODATA;
        return EXIT_FAILURE;
    }
    *value = circular_buffer->buffer[circular_buffer->start];
    circular_buffer->start++;
    circular_buffer->start %= circular_buffer->capacity;
    circular_buffer->size--;
    circular_buffer->start %= circular_buffer->capacity;
    return EXIT_SUCCESS;
}

int16_t write(circular_buffer_t *circular_buffer, buffer_value_t value)
{
    if (circular_buffer->size == circular_buffer->capacity)
    {
        errno = ENOBUFS;
        return EXIT_FAILURE;
    }
    size_t index = (circular_buffer->start + circular_buffer->size) % circular_buffer->capacity;
    circular_buffer->buffer[index] = value;
    circular_buffer->size++;
    return EXIT_SUCCESS;
}
int16_t overwrite(circular_buffer_t *circular_buffer, buffer_value_t value)
{
    size_t index = (circular_buffer->start + circular_buffer->size) % circular_buffer->capacity;
    circular_buffer->buffer[index] = value;
    if (circular_buffer->size == circular_buffer->capacity)
    {
        circular_buffer->start++;
        circular_buffer->start %= circular_buffer->capacity;
    }
    else
    {
        circular_buffer->size++;
    }
    return EXIT_SUCCESS;
}