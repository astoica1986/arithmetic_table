module ArithmeticTable
  # Creates a Matrix(a 2d array in this case) starting from a :sequence
  # (1d array with numeric elements). It will apply an :operator
  # (can be one of + - * /) on each pair of elements
  # obtained from zipping the array with itself
  class ArithmeticMatrix
    attr_reader :sequence, :operator
    extend Service

    def initialize(*_args, **options)
      @sequence = options[:sequence] || []
      @operator = options[:operator]
      validate_attributes!
    end

    def call
      sequence.inject([]) do |memo, val|
        row = sequence.map { |e| e.to_f.public_send(operator, val) }
        memo << row
      end
    end

    def validate_attributes!
      raise 'Invalid sequence. Must be an array' unless valid_sequence?
      raise 'Invalid operator. Must be one of: + - * /' unless valid_operator?
    end

    private

    # sequence must contain not contain zeros
    # this condition is needed to avoid dividing by 0

    def valid_sequence?
      sequence.is_a?(Array) && sequence.all? do |e|
        (e.is_a? Numeric) && (e != 0)
      end
    end

    def valid_operator?
      %w[+ - * /].include?(operator)
    end
  end
end
