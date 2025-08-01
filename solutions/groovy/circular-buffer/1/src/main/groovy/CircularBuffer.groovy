class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    int[] buf
    int start
    int end
    int size

    CircularBuffer(int capacity) {
        buf = new int[capacity]
        start = 0
        end = 0
        size = 0
    }

    def clear() {
        end = start
        size = 0
    }

    def read() {
        if (size != 0) {
            int val = buf[start]
            start = (start + 1) % buf.size()
            size -= 1
            return val
        } else {
            throw new EmptyBufferException()
        }
    }

    def write(int item) {
        if (size != buf.size()) {
            buf[end] = item
            end = (end + 1) % buf.size()
            size += 1
        } else {
            throw new FullBufferException()
        }
    }

    def overwrite(int item) {
        buf[end] = item
        end = (end + 1) % buf.size()
        if (size == buf.size()) {
            start = (start + 1) % buf.size()
        } else {
            size += 1
        }
    }
}
