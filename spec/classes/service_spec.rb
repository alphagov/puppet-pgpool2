require 'spec_helper'

describe 'pgpool2::service' do
  describe 'pgpool2::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('pgpool2') }
  end
end

