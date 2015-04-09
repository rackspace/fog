require 'fog/core/model'

class Fog::Rackspace::CloudKeep::Consumer < Fog::Model

  attribute :name
  attribute :url

  def destroy(container_id)
    service.destroy_consumer(container_id, self)
    true
  end

end
