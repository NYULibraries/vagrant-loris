require 'spec_helper'
describe 'yumrepos' do
  context 'with default values for all parameters' do
    it { should contain_class('yumrepos') }
  end
end
