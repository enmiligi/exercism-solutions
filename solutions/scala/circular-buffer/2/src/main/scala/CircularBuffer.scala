import scala.collection.mutable.Queue

class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {
  var buffer = Array.ofDim[Int](capacity)
  var start = 0
  var end = 0
  var length = 0

  def write(value: Int) = {
    if (length == capacity) {
      throw new FullBufferException()
    }
    buffer(end) = value
    end = (end + 1) % capacity
    length += 1
  }

  def read(): Int = {
    if (length == 0) {
      throw new EmptyBufferException()
    }
    val result = buffer(start)
    start = (start + 1) % capacity
    length = length - 1
    result
  }

  def overwrite(value: Int) = {
    if (length == capacity) {
      val _ = read()
    }
    write(value)
  }

  def clear() = {
    end = start
    length = 0
  }
}