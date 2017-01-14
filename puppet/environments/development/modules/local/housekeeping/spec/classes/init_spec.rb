require 'spec_helper'
describe 'housekeeping' do

  context 'with defaults for all parameters' do
    it { should contain_class('housekeeping') }
  end
end
