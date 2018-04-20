class Pic < ApplicationRecord
  belongs_to :cate_detail
  mount_uploader :pic, ImgUploader
end
