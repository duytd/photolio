class Content < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
