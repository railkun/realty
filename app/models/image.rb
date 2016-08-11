class Image < ActiveRecord::Base
  belongs_to :property
  mount_uploader :img_url, ImageUploader
end
