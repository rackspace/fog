module Fog
  module Rackspace
    class CloudKeep
      class Real
        def list_secrets
          request(
            :expects => [200, 203],
            :method => 'GET',
            :path => 'secrets'
          )
        end
      end
    end
  end
end
