require 'spec_helper'

describe 'pgpool2' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "pgpool2 class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}
        let(:hiera_data) {{
          'pgpool2::config::backend_zero_hostname' => 'host0',
          'pgpool2::config::backend_one_hostname' => 'host1'
        }}          

        it { should contain_class('pgpool2::params') }

        it { should contain_class('pgpool2::install') }
        it { should contain_class('pgpool2::config') }
        it { should contain_class('pgpool2::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'pgpool2 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
