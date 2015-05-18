class Fog::Rackspace::NetworkingV2::Real
  def update_ip_address(ip_address)
    data = {:ip_address => {:name => ip_address.name}}

    request(
      :method  => 'PUT',
      :body    => Fog::JSON.encode(data),
      :path    => "ip_addresses/#{ip_address.id}",
      :expects => 200
    )
  end
end
