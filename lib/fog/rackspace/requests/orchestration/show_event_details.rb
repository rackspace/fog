module Fog
  module Rackspace
    class Orchestration
      class Real
        def show_event_details(event)
          stack = event.stack
          resource = event.resource
          request(
            :method  => 'GET',
            :path    => "stacks/#{stack.stack_name}/#{stack.id}/resources/#{resource.resource_name}/events/#{event.id}",
            :expects => 200
          )
        end
      end

      class Mock
        def show_event_details(stack, event)
          events = self.data[:events].values
          response(:body => { 'events' => events })
        end
      end
    end
  end
end
