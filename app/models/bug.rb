class Bug < ApplicationRecord
	enum issue_type: [:issue, :enhancement, :feature]
	enum priority: [:low, :medium, :high]
	enum status: [:open, :closed, :monitor]

	validates :title, presence:true
	validates :description, presence:true

	belongs_to :user
	
end
