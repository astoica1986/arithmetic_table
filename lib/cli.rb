module Generate
  # Main cli module used to require all the cli method classes
  # (a pattern for using Gli)
  module CLI
    require 'arithmetic_table'
    require_relative 'cli/generate'
  end
end
