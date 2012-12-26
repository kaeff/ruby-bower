require "ruby-bower/version"
require "ruby-bower/ruby-bower.rb"

# Exports the `.node_modules` folder on the working directory so npm can
# require modules installed locally.
# See https://github.com/lucasmazza/ruby-stylus/blob/f0d26f6d6b2c64596d3e7d28265f663f2555cf92/lib/stylus.rb#L116-L118
ENV['NODE_PATH'] = "#{File.expand_path('node_modules')}:#{ENV['NODE_PATH']}"
