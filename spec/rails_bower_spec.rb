require 'spec_helper'

describe Bower do
  it 'loads the context' do
    Bower.context.eval('2+2').should == 4
  end

  it 'loaded bower correctly' do
    expect {
      Bower.context.eval("require.resolve('bower')")
    }.not_to raise_error(ExecJS::ProgramError)
  end

  it 'require path is in sync with ruby\'s' do
    Bower.context.eval("require('fs').realpathSync()").should == File.expand_path('.')
  end
end
