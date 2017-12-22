require 'spec_helper'
describe 'yumtutils' do

  context 'with defaults for all parameters' do
    it { should contain_class('yumtutils') }
  end
end
