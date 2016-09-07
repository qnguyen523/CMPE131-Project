class Goal < ActiveRecord::Base
	
  has_many :steps, dependent: :destroy

  accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true

end
