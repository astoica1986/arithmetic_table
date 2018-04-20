module Generate
  module CLI
    desc 'A test command'
    arg_name '<args>...', %i(:multiple)
    command :generate do |c|
      c.desc 'Pass a positive integer'
      c.flag :size, type: Integer, must_match: /^0*[1-9]\d*$/

      c.desc 'Process file async'
      c.switch 'async'

      c.action do |global_options, options, args|
        p global_options
        p options
        p args
      end
    end
  end
end