class Fog::Rackspace::CloudKeep::Real

  def get_secret_decrypt(secret)
    request(
      :method => 'GET',
      :headers => { "Accept" => secret.payload_content_type},
      :path => "secrets/#{secret.id}",
      :expects => 200
    )
  end
end
