require 'spec_helper'
describe 'remi_safe_repo' do

  context 'with defaults for all parameters' do
    it { should contain_class('remi_safe_repo') }
  end
end
