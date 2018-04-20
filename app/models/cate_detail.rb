class CateDetail < ApplicationRecord
  belongs_to :category
  has_many :pics, dependent: :destroy

  def img
    # binding.pry
    self.pics.first.try(:pic).try(:url)
  end
end
