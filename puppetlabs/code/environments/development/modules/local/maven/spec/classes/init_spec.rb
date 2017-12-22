require 'spec_helper'
describe 'epel_apache_maven' do

  context 'with defaults for all parameters' do
    it { should contain_class('epel_apache_maven') }
  end
end
