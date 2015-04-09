require 'fog/core/collection'
require 'fog/rackspace/models/cloud_keep/secret'

module Fog
  module Rackspace
    class CloudKeep
      class Secrets < Fog::Collection
        model Fog::Rackspace::CloudKeep::Secret

        def all
          data = service.list_secrets.body['secrets']
          load(data)
        end

        def get(secret_id)
          data = service.get_secret_metadata(secret_id).body['secret']
          new(data)
        rescue Fog::Rackspace::CloudKeep::NotFound
          nil
        end
      end
    end
  end
end
