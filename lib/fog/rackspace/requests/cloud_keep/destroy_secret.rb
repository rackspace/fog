class Fog::Rackspace::CloudKeep::Real

  def destroy_secret(id)
    request(
      :expects  => 204,
      :method   => 'DELETE',
      :path     => "secrets/#{id}"
    )
  end
end
