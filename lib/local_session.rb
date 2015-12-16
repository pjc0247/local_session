require 'binding_of_caller'

OverrideDefaultGlobals ||= false

at_exit do 
  def dumpable? obj
    begin
      Marshal.dump obj
      return true
    rescue 
      puts "Warning : object cannot be marshaled #{obj}"
      return false
    end
  end
  def wrap
    bindings = binding.of_caller(1)
    local_keys = bindings.local_variables.clone
    locals = Hash.new
    globals = Hash.new

    local_keys.each do |key|
      p key
      value = bindings.local_variable_get key
      locals[key] = value if dumpable?(value) == true
    end

    global_keys = global_variables

    global_keys.each do |key|
      value = eval("#{key}")
      globals[key] = value if dumpable?(value) == true
    end

    File.write ".locals", Marshal.dump(locals)
    File.write ".globals", Marshal.dump(globals)
  end

  # ���� �������� �и��ϱ� ���� �޼ҵ� ���� ��
  wrap
end

if File.exist? ".locals"
  locals = Marshal.load(File.read(".locals"))
  locals.each do |k, v|
    binding.of_caller(0).local_variable_set k, v

    define_singleton_method k do 
      return v
    end
  end
end