require 'spec_helper'

describe 'pgpool2::install' do

  describe 'pgpool2::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_package('pgpool2') }
    it { should contain_file('/var/run/postgresql').with(
           'ensure'  => 'directory',
           'owner'   => 'postgres',
           'group'   => 'postgres',
           'mode'    => '0755',
    )
    }
  end
end
