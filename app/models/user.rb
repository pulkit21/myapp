class User < ActiveRecord::Base
  attr_accessible :location, :name, :nickname, :provider, :uid
end
