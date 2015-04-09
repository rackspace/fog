class Fog::Rackspace::CloudKeep::Real

  def create_consumer(container_id, data)
    request(
      :method => 'POST',
      :body => Fog::JSON.encode(data),
      :path => "containers/#{container_id}/consumers",
      :expects => 200
    )
  end

end
