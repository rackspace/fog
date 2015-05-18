class Fog::Rackspace::NetworkingV2::Real
  def list_ip_addresses
    request(:method => 'GET', :path => 'ip_addresses', :expects => 200)
  end
end
