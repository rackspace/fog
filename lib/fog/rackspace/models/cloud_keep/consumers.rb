require 'fog/core/collection'
require 'fog/rackspace/models/cloud_keep/consumer'

class Fog::Rackspace::CloudKeep::Consumers < Fog::Collection
  model Fog::Rackspace::CloudKeep::Consumer

  def all(container_id)
    data = service.list_consumers(container_id).body['consumers']
    load(data)
  end

  def create(container_id, options={})
    data = service.create_consumer(container_id, options)

    # Unsure why a container is returned instead of a consumer...?
    Fog::Rackspace::CloudKeep::Container.new(data.body)
  end

  def get(consumer_id)
    data = service.get_consumer(consumer_id).body['consumer']
    new(data)
  rescue Fog::Rackspace::CloudKeep::NotFound
    nil
  end

  def destroy(container_id, consumer_data)
    service.destroy_consumer(container_id, consumer_data)
    true
  end

end
