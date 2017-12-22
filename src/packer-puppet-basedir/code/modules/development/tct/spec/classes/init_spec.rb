require 'spec_helper'
describe 'tct' do
  context 'with default values for all parameters' do
    it { should contain_class('tct') }
  end
end
