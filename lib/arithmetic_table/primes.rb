module ArithmeticTable
  module Primes
    # Adds additional functionalities to the Integer class
    # without monkey-patching (I am not a big fan of patching)
    refine Integer do
      def prime?
        return false if self < 2
        2.upto(Math.sqrt(self).to_i) do |x|
          return false if (self % x).zero?
        end
        true
      end
    end
  end
end