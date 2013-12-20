class Comment < ActiveRecord::Base
	belongs_to :pst
	validates_presence_of :body
	attr_accessible :body
end
