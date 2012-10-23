module Fog
  module Compute
    class GCE

      class Mock

        def get_disk(disk_name)
          Fog::Mock.not_implemented
        end

      end

      class Real

        def get_disk(disk_name)
          api_method = @compute.disks.get
          parameters = {
            'project' => @project,
            'disk' => disk_name
          }

          result = self.build_result(api_method, parameters)
          response = self.build_response(result)
        end

      end

    end
  end
end
