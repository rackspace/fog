class Fog::Rackspace::NetworkingV2::Real
  def create_ip_address(ip_address)
    data = {:ip_address => ip_address.attributes}

    request(
      :method  => 'POST',
      :body    => Fog::JSON.encode(data),
      :path    => "ip_addresses",
      :expects => 201
    )
  end
end
