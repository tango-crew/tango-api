class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token, :integration_id,
             :integration_type, :birthday, :bio,
             :profile_image_id,
             :profile_image_filename,
             :profile_image_content_type,
             :profile_image_size
end
