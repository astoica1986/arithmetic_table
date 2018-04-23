module ArithmeticTable
  # Adds the base for a 'service' type of architecture that I frequently use
  # The service classes should have just one responsibility so we can limit
  # their interface to a #call method. This will instantiate class and run
  # its code
  module Service
    def call(*args, **options)
      new(*args, **options).call
    end
  end
end
