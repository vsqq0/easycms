class Category < ApplicationRecord
  has_many :cate_details, dependent: :destroy

end
