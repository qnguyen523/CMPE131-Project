class User < ActiveRecord::Base

  has_secure_password
  has_many :steps, through: :goals
  has_many :goals, dependent: :destroy
  has_many :to_dos, dependent: :destroy
  has_one :calendar, dependent: :destroy

end