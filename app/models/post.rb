class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 500 }
	validates :user_id, presence: true
    validates :professor, presence: true
	DEPARTMENT = [ ["ECON", 0], ["CPSC", 1] ]
end
