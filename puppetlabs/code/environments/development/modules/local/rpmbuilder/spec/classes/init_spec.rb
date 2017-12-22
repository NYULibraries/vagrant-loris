require 'spec_helper'
describe 'rpmbuilder' do

  context 'with defaults for all parameters' do
    it { should contain_class('rpmbuilder') }
  end
end
