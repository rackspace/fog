require 'fog/core/collection'
require 'fog/rackspace/models/cloud_keep/container'

class Fog::Rackspace::CloudKeep::Containers < Fog::Collection
  model Fog::Rackspace::CloudKeep::Container

  def all
    data = service.list_containers.body['containers']
    load(data)
  end

  def create(options={})
    data = service.create_container(options).body['container']
    new(data)
  end

  def get(container_id)
    data = service.get_container(container_id).body
    new(data)
  rescue Fog::Rackspace::CloudKeep::NotFound
    nil
  end
end
