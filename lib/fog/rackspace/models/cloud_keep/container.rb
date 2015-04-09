require 'fog/core/model'

class Fog::Rackspace::CloudKeep::Container < Fog::Model

  Types = %w{generic rsa certificate}
  UUID_REGEX = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

  attr_accessor :errors, :container_ref, :id

  identity :id
  attribute :name
  attribute :secret_refs
  attribute :type
  attribute :status
  attribute :updated
  attribute :consumers

  def save
    if valid?
      self.container_ref = service.create_container(self).body["container_ref"]
      self.id = UUID_REGEX.match(self.container_ref).to_s
    else
      self.errors
    end
  end

  def valid?
    self.errors = []

    case self.type
    when "rsa" then
      self.errors << "RSA requires a 'public_key' secret_ref" unless has_ref?("public_key")
      self.errors << "RSA requires a 'private_key' secret_ref" unless has_ref?("private_key")
    when "certificate" then
      self.errors << "Certificate requires a 'certificate' secret_ref" unless has_ref?("certificate")
    end

    self.errors.size == 0
  end

  def add_secret_ref(secret)
    self.secret_refs ||= []
    self.secret_refs << {name: secret.name, secret_ref: secret.secret_ref}
  end

  def has_ref?(name)
    self.secret_refs.any?{ |sf| sf[:name] == name }
  end
end
