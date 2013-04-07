require 'spec_helper'

describe Bower do
  let(:bower) { Bower.new }

  it 'exposes Bower\'s commands' do
    Bower.commands.should == [:list]
  end

  context '#list' do
    its(:list) { should == [] }
  end
end
