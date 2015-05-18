class Fog::Rackspace::NetworkingV2::IpAddress < Fog::Model

  identity :id

  attribute :ip_address_id
  attribute :address
  attribute :port_ids
  attribute :subnet_id
  attribute :used_by_tenant_id
  attribute :version
  attribute :address_type

  def save
    data = unless self.id.nil?
      service.update_ip_address(self)
    else
      service.create_ip_address(self)
    end

    merge_attributes(data.body['ip_address'])
    true
  end

  def destroy
    requires :identity

    service.delete_ip_address(identity)
    true
  end
end
