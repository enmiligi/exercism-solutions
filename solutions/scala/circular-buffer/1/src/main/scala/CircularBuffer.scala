import scala.collection.mutable.Queue

class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {
  var queue = Queue[Int]()

  def write(value: Int) = {
    if (queue.size == capacity) {
      throw new FullBufferException()
    }
    queue.enqueue(value)
  }

  def read(): Int = {
    if (queue.size == 0) {
      throw new EmptyBufferException()
    }
    queue.dequeue
  }

  def overwrite(value: Int) = {
    if (queue.size == capacity) {
      queue.dequeue
    }
    queue.enqueue(value)
  }

  def clear() = {
    queue.clear
  }
}