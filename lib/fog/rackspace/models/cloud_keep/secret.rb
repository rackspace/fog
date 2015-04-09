require 'fog/core/model'

module Fog
  module Rackspace
    class CloudKeep
      class Secret < Fog::Model

        UUID_REGEX = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

        identity :id

        attribute :name
        attribute :expiration
        attribute :algorithm
        attribute :bit_length
        attribute :mode
        attribute :payload
        attribute :payload_content_type
        attribute :payload_content_encoding
        attribute :secret_type
        attribute :secret_ref
        attribute :status
        attribute :updated
        attribute :created
        attribute :content_types

        def set_secret_ref(url)
          self.secret_ref = url
          self.id = UUID_REGEX.match(url).to_s
        end

        def save
          data = service.create_secret(self)
          self.set_secret_ref(data[:body]["secret_ref"])
          self.refresh
        end

        def refresh
          data = service.get_secret_metadata(self.id)
          data.body.each{ |k,v| self.send("#{k}=", v) }
          self
        end

        def decrypt
          data = service.get_secret_decrypt(self)
          data.body
        end

        def destroy
          service.destroy_secret(self.id)
          true
        end

      end
    end
  end
end
