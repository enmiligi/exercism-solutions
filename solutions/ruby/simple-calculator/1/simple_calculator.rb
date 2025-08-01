class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation
    raise ArgumentError unless
      first_operand.instance_of?(Integer) && second_operand.instance_of?(Integer)

    return 'Division by zero is not allowed.' if
      operation == '/' && second_operand.zero?

    unsafe_calculate(first_operand, second_operand, operation)
  end

  def self.unsafe_calculate(first_operand, second_operand, operation)
    case operation
    when '+'
      result = first_operand + second_operand
    when '/'
      result = first_operand / second_operand
    when '*'
      result = first_operand * second_operand
    end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
