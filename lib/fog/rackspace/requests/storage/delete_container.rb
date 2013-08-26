module Fog
  module Storage
    class Rackspace
      class Real

        # Delete an existing container
        #
        # ==== Parameters
        # * name<~String> - Name of container to delete
        # @raise [Fog::Storage::Rackspace::NotFound] - HTTP 404
        # @raise [Fog::Storage::Rackspace::BadRequest] - HTTP 400
        # @raise [Fog::Storage::Rackspace::InternalServerError] - HTTP 500
        # @raise [Fog::Storage::Rackspace::ServiceError]
        def delete_container(name)
          request(
            :expects  => 204,
            :method   => 'DELETE',
            :path     => Fog::Rackspace.escape(name)
          )
        end

      end

      class Mock
        def delete_container(name)
          container_data = self.data[:directories][name]
          if container_data.nil?
            raise Fog::Storage::Rackspace::NotFound
          else
            response
          end
        end
      end
    end
  end
end
