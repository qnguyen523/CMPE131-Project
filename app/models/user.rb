class User < ApplicationRecord
	has_many :posts
	validates :first, :last, :email, presence: true
end
