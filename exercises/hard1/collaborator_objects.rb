# Question:
# Add the ability to log when clients of the class try to access data from SecretFile
#  > so, any call of a SecretFile class object that returns data must call a logging
#     class and create a log entry

class SecretFile
  
  def initialize(secret_data, access_log)
    @data = secret_data
    @data_log = access_log
  end
  
  def data
    @data_log.create_log_entry
    @data
  end
end

class SecurityLogger
  def initialize
    @log = {}
    @number_of_log_entries = 0
  end
  
  def create_log_entry
    @number_of_log_entries += 1
    @log[@number_of_log_entries] = Time.now
  end
end

# Check work:
# Expected output: after calling the getter method, data, on the secret file object,
#  there should 1 entry in the log1 object's @log instance variable that tracks the
#  number of entries (the symbol in the hash @log) and the time the data getter method
#  was called
log1 = SecurityLogger.new
data1 = SecretFile.new("secretdata1", log1)
p data1
# => #<SecretFile:0x0000000001f16ea8 @data="secretdata1", 
#      @data_log=#<SecurityLogger:0x0000000001f16f20 @log={}, 
#      @number_of_log_entries=0>>
data1.data
p data1
# => #<SecretFile:0x0000000001f16ea8 @data="secretdata1",
#      @data_log=#<SecurityLogger:0x0000000001f16f20 @log={1=>2021-09-05 19:46:50 +0000}, 
#      @number_of_log_entries=1>>
