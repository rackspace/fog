class Fog::Rackspace::CloudKeep::Real

  def get_container(id)
    request(
      :method => 'GET',
      :path => "containers/#{id}",
      :expects => 200
    )
  end
end
