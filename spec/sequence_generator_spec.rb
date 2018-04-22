require 'spec_helper'

RSpec.describe ArithmeticTable::SequenceGenerator do
  describe 'validations' do
    describe '#validate_attributes!' do
      it 'validates size' do
        expect { described_class.call(size: -1) }.to(
          raise_error('Invalid size. Must be a positive integer')
        )
      end
    end
  end

  describe '#call' do
    it 'will generate an array of consecutive numbers by default' do
      expect(described_class.call(size: 5)).to(
        eq([1, 2, 3, 4, 5])
      )
    end

    it 'will generate an array of primes if primes option is true' do
      expect(described_class.call(size: 5, primes: true)).to(
        eq([2, 3, 5, 7, 11])
      )
    end
  end
end
