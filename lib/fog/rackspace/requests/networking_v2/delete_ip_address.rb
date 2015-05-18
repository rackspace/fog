class Fog::Rackspace::NetworkingV2::Real
  def delete_ip_address(id)
    request(:method => 'DELETE', :path => "ip_addresses/#{id}", :expects => 204)
  end
end
