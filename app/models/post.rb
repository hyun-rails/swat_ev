class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
	validates :user_id, presence: true

	def self.search(search, page)
		paginate :per_page => 5, :page => page,
		         :conditions => ['department LIKE ?', "%#{search}%"]
		         
		#if search
		#	find(:all, :conditions => ['department LIKE ?', "%#{search}%"])
		#else
		#	find(:all)
		#end
	end
end
