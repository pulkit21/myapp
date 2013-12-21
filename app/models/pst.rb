class Pst < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :body, :title
  has_many :comments
  belongs_to :user
end
