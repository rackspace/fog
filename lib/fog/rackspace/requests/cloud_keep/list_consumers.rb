class Fog::Rackspace::CloudKeep::Real
  def list_consumers(container_id)
    request(
      :expects => [200, 203],
      :method => 'GET',
      :path => "containers/#{container_id}/consumers"
    )
  end
end
