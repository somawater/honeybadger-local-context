require 'honeybadger'
require 'binding_of_caller'
module Honeybadger
  class << self
    alias_method :the_real_notify, :notify
    def notify(exception, options = {})

      ctx = binding.of_caller(1)
      vars = eval('local_variables', ctx)
      locals_array = vars.map { |arg| [arg, eval(arg.to_s, ctx)]}

      options[:context] ||= {}
      options[:context][:local_variables] = Hash[*locals_array.flatten(1)]

      puts "Notify called with options: #{options}"

      return the_real_notify(exception, options)
    end
  end
end

