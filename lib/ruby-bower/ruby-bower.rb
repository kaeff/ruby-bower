require 'execjs'

module Bower
  class << self
    def backend
      @@backend ||= ExecJS::ExternalRuntime.new(
        :name        => 'Node.js (V8) (customized for module loading)',
        :command     => ["nodejs", "node"],
        :runner_path => File.expand_path("../support/node_module_runner.js", __FILE__)
      )
    end

    def context
      #@@context ||= backend.compile "var bower = require('bower')"
      @@context ||= backend.compile ""
    end
  end
end
