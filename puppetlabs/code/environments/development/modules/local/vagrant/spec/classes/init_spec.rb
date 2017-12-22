require 'spec_helper'
describe 'vagrant' do

  context 'with defaults for all parameters' do
    it { should contain_class('vagrant') }
  end
end
