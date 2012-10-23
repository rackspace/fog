Shindo.tests('Fog::Compute[:gce] | operation requests', ['gce']) do

  @gce = Fog::Compute[:gce]

  @insert_operation_format = {
      'kind' => String,
      'id' => String,
      'selfLink' => String,
      'name' => String,
      'targetLink' => String,
      'targetId' => String,
      'status' => String,
      'user' => String,
      'progress' => Integer,
      'insertTime' => String,
      'startTime' => String,
      'operationType' => String
  }

  @get_operation_format = {
      'kind' => String,
      'error' => { 'errors' => [] },
      'id' => String,
      'selfLink' => String,
      'name' => String,
      'targetLink' => String,
      'status' => String,
      'user' => String,
      'progress' => Integer,
      'insertTime' => String,
      'startTime' => String,
      'httpErrorStatusCode' => Integer,
      'httpErrorMessage' => String,
      'operationType' => String
  }

  @list_operations_format = {
      'kind' => String,
      'id' => String,
      'selfLink' => String,
      'nextPageToken' => String,
      'items' => []
  }

  tests('success') do

    tests("#get_operation").formats(@get_operation_format) do
      operation_name = @gce.list_operations.body["items"][0]["name"]
      @gce.get_operation(operation_name).body
    end

    tests("#list_operations").formats(@list_operations_format) do
      @gce.list_operations.body
    end

  end

end
