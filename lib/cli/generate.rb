module Generate
  module CLI
    desc 'Generates a command line ASCII table. The elements of that table will
      be computed from a number sequence by applying one of the four
      basic operations. The user can choose the size of the sequence, a condition
      for the sequence(i.e primes) and the mathematical operation which will be
      applied'

    command %i[generate draw] do |c|
      c.desc 'Set the size of the number sequence used to generate the
        arithmetic table. Must be a positive integer'
      c.flag %i[s size], type: Integer, must_match: /^0*[1-9]\d*$/,
                         default_value: 10

      c.desc 'Sets the mathematical operation applied on the number sequence in
        order to generate the table'
      c.flag %i[o operator], type: String, must_match: %w[+ - * /],
                             default_value: '*'

      c.desc 'Switch to make all numbers generated by the sequences be primes.
        If not specified the sequence would generate consecutive integers
        starting from 1'
      c.switch %i[p primes], negatable: false

      c.action do |_global_options, options, _args|
        TableGenerator.new(
          sequence_condition: { primes: options[:primes] },
          size: options[:size],
          operator: options[:operator]
        ).generate
      end
    end
  end
end