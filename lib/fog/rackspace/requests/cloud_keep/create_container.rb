class Fog::Rackspace::CloudKeep::Real

  def create_container(data)
    request(
      :method => 'POST',
      :body => Fog::JSON.encode(data),
      :path => "containers",
      :expects => 201
    )
  end
end
