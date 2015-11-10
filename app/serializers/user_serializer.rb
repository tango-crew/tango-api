class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token, :integration_id, :integration_type, :birthday, :bio
end
