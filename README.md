# Ruby::Bower

A ruby wrapper for [Bower](https://github.com/twitter/bower).

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-bower'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-bower

Bower requires an installation of node.js. You could e.g. use the gem 'therubyracer' as described above.

## Usage

Ruby-bower gives you programmatic access to Bower's API - from Ruby.
You can pass in objects to commands as regular objects:
    
    bower = Bower.new
    bower.list sources: true

See [the Bower repository](https://github.com/twitter/bower/tree/master/lib/commands) or `$ bower help` for usage information on Bower's commands.
`Bower.commands` reveals all supported Bower commands. Currently, that's only the `list` command. Further implementations and ideas for this tool are heartily encouraged!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Spec your changes using RSpec
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Test your changes
5. Create new Pull Request
