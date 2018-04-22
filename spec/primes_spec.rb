require 'spec_helper'

RSpec.describe ArithmeticTable::Primes do
  using ArithmeticTable::Primes

  describe '#prime?' do
    it 'evaluates if an integer is prime' do
      expect(11.prime?).to be true
      expect(4.prime?).to be false
    end
  end
end