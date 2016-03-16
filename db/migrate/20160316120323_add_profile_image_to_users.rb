class AddProfileImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :profile_image_filename, :string
    add_column :users, :profile_image_content_type, :string
    add_column :users, :profile_image_size, :integer
  end
end
