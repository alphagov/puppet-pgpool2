require 'spec_helper'

describe 'pgpool2::config' do

  let(:params) { {
    :backend_zero_hostname => 'purple.chicken',
    :backend_one_hostname => 'angry.lion',
    :load_balance_mode => 'on',
  } }

  it { should contain_file('/etc/pgpool2/pgpool.conf').with_content(/backend_hostname0 = \'purple\.chicken\'/) }
  it { should contain_file('/etc/pgpool2/pgpool.conf').with_content(/backend_hostname1 = \'angry\.lion\'/) }
  it { should contain_file('/etc/pgpool2/pgpool.conf').with_content(/load_balance_mode = on/) }
end
