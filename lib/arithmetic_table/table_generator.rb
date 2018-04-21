module ArithmeticTable
  # main interface class of the app, uses dependency injection classes to generate the arithmetic table
  class TableGenerator
    attr_reader :sequence_generator, :matrix_calculator, :table_printer

    def initialize(sequence_generator: SequenceGenerator, matrix_calculator: ArithmeticMatrix,
                   table_printer: TablePrinter, options: {})
      raise ':options param must be provided as Hash' unless options.is_a? Hash
      @sequence_generator = sequence_generator.new(options)
      @matrix_calculator = matrix_calculator.new(options)
      @table_printer = table_printer.new
    end

    def generate
      sequence = sequence_generator.generate
      matrix = matrix_calculator.calculate(sequence)
      table_printer.print(headings: sequence, matrix: matrix)
    end

    def validate_attributes!
      raise ':sequence_generator must implement #generate' unless sequence_generator.respond_to?(:generate)
      raise ':matrix_calculator must implement #calculate' unless matrix_calculator.respond_to?(:calculate)
      raise ':table_printer must implement #print' unless matrix_calculator.respond_to?(:print)
    end

    private

    attr_writer :sequence_generator, :matrix_calculator, :table_printer
  end
end
