require 'spec_helper'
describe 'kubernetes' do

  context 'with defaults for all parameters' do
    it { should contain_class('kubernetes') }
  end
end
