class Comment < ActiveRecord::Base
	belongs_to :pst
	belongs_to :user
	validates_presence_of :body
	attr_accessible :body
	
end
