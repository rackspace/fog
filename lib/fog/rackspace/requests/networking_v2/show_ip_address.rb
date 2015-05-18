class Fog::Rackspace::NetworkingV2::Real
  def show_ip_address(id)
    request(:method => 'GET', :path => "ip_addresses/#{id}", :expects => 200)
  end
end
