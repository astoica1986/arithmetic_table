require 'terminal-table'

module ArithmeticTable
  # Just a wrapper class for Terminal::Table
  # See https://github.com/tj/terminal-table for usage
  # Given a NxN matrix(2d array) as an input, it will add row and column headers
  # using the headings param and prints it to the terminal
  # Expects matrix and headings to have the same size
  class TablePrinter
    extend Service
    attr_reader :headings, :matrix

    def initialize(*_args, **options)
      @headings = options[:headings] || [nil]
      @matrix = options[:matrix] || [[]]
      validate_attributes!
    end

    def call
      puts terminal_table
    end

    def validate_attributes!
      raise ':headings must be an Array' unless headings.is_a? Array
      raise ':matrix must be a 2d array' unless valid_matrix?
      raise 'headings and matrix must match size' unless headings.size == matrix.size
    end

    def terminal_table
      Terminal::Table.new do |t|
        t.headings = [nil] + headings
        matrix.each_with_index do |row, index|
          row_with_col_header = row.unshift(headings[index])
          t.add_row(row_with_col_header)
        end
      end
    end

    private

    def valid_matrix?
      matrix.all? { |arr| (arr.is_a? Array) && arr.flatten(1) == arr }
    end
  end
end
