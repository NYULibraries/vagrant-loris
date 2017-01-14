require 'spec_helper'
describe 'dltsdevrepo' do

  context 'with defaults for all parameters' do
    it { should contain_class('dltsdevrepo') }
  end
end
