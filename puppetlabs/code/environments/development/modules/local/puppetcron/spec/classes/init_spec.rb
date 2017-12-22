require 'spec_helper'
describe 'puppetcron' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppetcron') }
  end
end
