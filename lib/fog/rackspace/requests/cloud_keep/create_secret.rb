class Fog::Rackspace::CloudKeep::Real

  def create_secret(secret)
    request(
      :method => 'POST',
      :body => Fog::JSON.encode(secret),
      :path => "secrets",
      :expects => 201
    )
  end
end
