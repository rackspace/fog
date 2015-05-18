require 'fog/rackspace/models/networking_v2/ip_address'

class Fog::Rackspace::NetworkingV2::IpAddresses < Fog::Collection
  model Fog::Rackspace::NetworkingV2::IpAddress

  def all
    data = service.list_ip_addresses.body['ip_addresss']
    load(data)
  end

  def get(id)
    data = service.show_ip_address(id).body['ip_address']
    new(data)
  rescue Fog::Rackspace::NetworkingV2::NotFound
    nil
  end
end
