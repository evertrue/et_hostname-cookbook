require 'spec_helper'

context file('/etc/hosts') do
  describe '#content' do
    subject { super().content }
    it do
      is_expected.to contain('10.0.2.15 ' \
                             'default-ubuntu-1404.priv.evertrue.com ' \
                            'default-ubuntu-1404')
    end
    it { is_expected.to contain('1.2.3.4 test.host.local test') }
  end
end
