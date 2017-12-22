require 'spec_helper'
describe 'gbp' do

  context 'with defaults for all parameters' do
    it { should contain_class('gbp') }
  end
end
