module ArithmeticTable
  class BaseService
    def self.call(*args, **options)
      new(*args, **options).call    
    end   
  end    
end