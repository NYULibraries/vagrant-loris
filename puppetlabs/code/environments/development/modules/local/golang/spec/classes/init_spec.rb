require 'spec_helper'
describe 'golang' do
  context 'with default values for all parameters' do
    it { should contain_class('golang') }
  end
end
