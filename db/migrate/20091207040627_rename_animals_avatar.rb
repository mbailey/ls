class RenameAnimalsAvatar < ActiveRecord::Migration
  def self.up
    change_table :animals do |t|
      t.rename :avatar_file_name, :image_file_name
      t.rename :avatar_content_type, :image_content_type
      t.rename :avatar_file_size, :image_file_size
      t.rename :avatar_updated_at, :image_updated_at
    end
    
    # if File.exists? "#{RAILS_ROOT}/public/system/avatars"
    #   File.rename "#{RAILS_ROOT}/public/system/avatars" "#{RAILS_ROOT}/public/system/images"
    # end
  end

  def self.down
    change_table :animals do |t|
      t.rename :image_file_name, :avatar_file_name
      t.rename :image_content_type, :avatar_content_type
      t.rename :image_file_size, :avatar_file_size
      t.rename :image_updated_at, :avatar_updated_at
    end
    # if File.exists? "#{RAILS_ROOT}/public/system/images"
    #   File.rename "#{RAILS_ROOT}/public/system/images" "#{RAILS_ROOT}/public/system/avatars"
    # end
  end
end