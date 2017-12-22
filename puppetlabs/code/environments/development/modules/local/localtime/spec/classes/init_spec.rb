require 'spec_helper'
describe 'localtime' do

  context 'with defaults for all parameters' do
    it { should contain_class('localtime') }
  end
end
