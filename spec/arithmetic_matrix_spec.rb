require 'spec_helper'

RSpec.describe ArithmeticTable::ArithmeticMatrix do
  describe 'validations' do
    describe '#validate_attributes!' do
      it 'validates sequence type' do
        expect { described_class.call(sequence: 1, operator: '+') }.to(
          raise_error('Invalid sequence. Must be an array')
        )
      end

      it 'validates operator type' do
        expect { described_class.call(sequence: [1, 2], operator: '@') }.to(
          raise_error('Invalid operator. Must be one of: + - * /')
        )
      end
    end

    describe '#call' do
      it 'will generate the correct matrix from the sequence' do
        expect(described_class.call(sequence: [1, 2, 3], operator: '*')).to(
          eq([[1, 2, 3], [2, 4, 6], [3, 6, 9]])
        )
        expect(described_class.call(sequence: [1, 2, 3], operator: '/')).to(
          eq(
            [
              [1.0, 2.0, 3.0],
              [0.5, 1.0, 1.5],
              [0.3333333333333333, 0.6666666666666666, 1.0]
            ]
          )
        )
        expect(described_class.call(sequence: [1, 2, 3], operator: '-')).to(
          eq([[0, 1, 2], [-1, 0, 1], [-2, -1, 0]])
        )
        expect(described_class.call(sequence: [1, 2, 3], operator: '+')).to(
          eq([[2, 3, 4], [3, 4, 5], [4, 5, 6]])
        )
      end
    end
  end
end
