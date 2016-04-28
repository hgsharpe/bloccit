class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :labelings, as: :labelable
    has_many :labels, through: :labelings
    has_many :sponsored_posts, :dependent => :destroy
    
    scope :publically_viewable, -> { where(public: true) }
    scope :privately_viewable, -> { where(public: false) }
    
    scope :visible_to, -> (user) { user ? all : publically_viewable }
end
