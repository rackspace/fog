class Fog::Rackspace::CloudKeep::Real

  def destroy_consumer(container_id, consumer)
    request(
      :expects => 200,
      :method  => 'DELETE',
      :body    => Fog::JSON.encode(consumer),
      :path    => "containers/#{container_id}/consumers"
    )
  end
end
