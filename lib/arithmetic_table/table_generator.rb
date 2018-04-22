module ArithmeticTable
  # main interface class of the app, uses dependency injection classes to
  # generate the arithmetic table
  class TableGenerator
    attr_reader :size, :operator, :options, :sequence_generator,
                :matrix_calculator, :table_printer

    def initialize(size: nil, operator: nil, **options)
      @size = size
      @operator = operator
      @options = options
      @sequence_generator = options.delete(:sequence_generator) ||
                            SequenceGenerator
      @matrix_calculator = options.delete(:matrix_calculator) ||
                           ArithmeticMatrix
      @table_printer = options.delete(:table_printer) || TablePrinter
      validate_attributes!
    end

    def generate
      sequence = sequence_generator.call(size: size, **options)
      matrix = matrix_calculator.call(
        sequence: sequence, operator: operator, **options
      )
      table_printer.call(headings: sequence, matrix: matrix, **options)
    end

    def validate_attributes!
      [sequence_generator, matrix_calculator, table_printer].each do |injector|
        raise "#{injector} must implement #call" unless injector.method_defined?(:call)
      end
    end
  end
end
