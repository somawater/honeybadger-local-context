require 'honeybadger'
require 'binding_of_caller'

module Honeybadger
  class << self
    def notify_with_context(exception, options = {})

      ctx = binding.of_caller(1)
      vars = eval('local_variables', ctx)
      locals_array = vars.map { |arg| [arg, eval(arg.to_s, ctx)]}

      options[:context] ||= {}
      options[:context][:local_variables] = Hash[*locals_array.flatten(1)]

      notify_without_context(exception, options)
    end

    alias_method :notify_without_context, :notify
    alias_method :notify, :notify_with_context

  end
end

