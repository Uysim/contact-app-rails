class ContactSerializer < BaseSerializer
  attributes :name, :email, :bio
  attributes :avatar_url

  def avatar_url
    object.avatar.service_url
  end
end
