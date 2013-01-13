require 'spec_helper'

module RubyBower
  describe Bower do
    context 'meta & initialization' do
      it 'loads the context' do
        Bower.context.eval('2+2').should == 4
      end

      it 'loaded bower correctly' do
        expect { Bower.context.call("require.resolve", "bower") }.not_to raise_error(ExecJS::ProgramError)
        expect { Bower.context.eval("bower") }.not_to raise_error(ExecJS::ProgramError)
      end

      it 'require path is in sync with ruby\'s' do
        Bower.context.call("require('fs').realpathSync").should == File.expand_path('.')
      end
    end

    context 'commands' do
      let(:bower) { Bower.new }

      it 'exposes Bower\'s commands' do
        bower.commands.should == [ 'help',
                                   'install',
                                   'list',
                                   'ls',
                                   'uninstall',
                                   'update',
                                   'link',
                                   'lookup',
                                   'info',
                                   'register',
                                   'search',
                                   'cache-clean' ]
      end

      it 'responds to Bower\'s commands' do
        (bower.commands - %w{help}).each do |command|
          bower.should respond_to(command)
        end
      end
    end
  end
end
