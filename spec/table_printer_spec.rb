require 'spec_helper'

RSpec.describe ArithmeticTable::TablePrinter do
  describe 'validations' do
    describe '#validate_attributes!' do
      it 'validates headings type' do
        expect { described_class.new(headings: 1, matrix: [[]]) }.to(
          raise_error(':headings must be an Array')
        )
      end

      it 'validates matrix type' do
        expect { described_class.new(headings: [], matrix: [1]) }.to(
          raise_error(':matrix must be a 2d array')
        )
      end

      it 'validates headings and matrix size match' do
        expect do
          described_class.new(headings: [1, 2, 3], matrix: [[1, 2], [3, 4]])
        end.to raise_error('headings and matrix must match size')
      end
    end
  end
 end