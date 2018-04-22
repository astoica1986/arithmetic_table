module ArithmeticTable
  # Generate an array of positive integers using a :size and any special options
  # provided to the constructor using lazy enumeration
  # For now it only supports prime numbers as a special case
  class SequenceGenerator
    extend Service
    using ::ArithmeticTable::Primes
    attr_reader :size, :options

    def initialize(*_args, **options)
      @size = options.delete(:size)
      @options = options
    end

    def call
      send(generator_method).take(size).to_a
    end

    private

    def generate_numbers
      Enumerator.new do |x|
        n = 1
        loop do
          x.yield n
          n += 1
        end
      end.lazy
    end

    def generate_primes
      generate_numbers.select(&:prime?)
    end

    def generator_method
      if options[:primes]
        :generate_primes
      else
        :generate_numbers
      end
    end
  end
end