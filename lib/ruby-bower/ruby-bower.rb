require 'execjs'

module RubyBower
  class Bower

    class << self
      def backend
        @@backend ||= ExecJS::ExternalRuntime.new(
          :name        => 'Node.js (V8) (customized for module loading)',
          :command     => ["nodejs", "node"],
          :runner_path => File.expand_path("../support/node_module_runner.js", __FILE__)
        )
      end

      def context
        @@context ||= backend.compile "bower = require('bower')"
      end
    end

    def commands
      @@context.eval('Object.keys(bower.commands)')
    end

    def method_missing(method_name, *arguments, &block)
      return @@context.call "bower.#{method_name}", arguments if commands.include? method_name
      super
    end

    def respond_to?(method_name, include_private = false)
      commands.include? method_name || super
    end
  end
end
