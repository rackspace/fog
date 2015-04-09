module Fog
  module Rackspace
    class CloudKeep
      class Real
        def list_containers
          request(
            :expects => [200, 203],
            :method => 'GET',
            :path => 'containers'
          )
        end
      end
    end
  end
end
