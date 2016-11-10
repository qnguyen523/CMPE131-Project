class Book < ApplicationRecord
	validates :title, presence: true
	validates :picture, presence: true
  belongs_to :post
  mount_uploader :picture, PictureUploader
end
