require 'execjs'

class Bower

  class << self
    def backend
      @@backend ||= ExecJS::ExternalRuntime.new(
        :name        => 'Node.js (V8) (customized for module loading)',
        :command     => ["nodejs", "node"],
        :runner_path => File.expand_path("../support/node_event_emitter_runner.js", __FILE__)
      )
    end

    def context
      @context ||= backend.compile <<-JS
var bower = require('bower');
JS
    end

    def commands
      [:list]
    end
  end

  commands.each do |command|
    define_method command do |*arguments|
      Bower.context.call "bower.commands.#{command}", *arguments
    end
  end
end
