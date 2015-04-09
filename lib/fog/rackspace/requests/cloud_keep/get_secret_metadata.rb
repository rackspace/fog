class Fog::Rackspace::CloudKeep::Real

  def get_secret_metadata(id)
    request(
      :method => 'GET',
      :path => "secrets/#{id}",
      :expects => 200
    )
  end
end
