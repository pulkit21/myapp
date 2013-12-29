class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :screen_name, :url, :profile_image_url, :location, :description
  # attr_accessible :title, :body
  # validates_uniqueness_of :username
  # validates_presence_of :username
  # has_many :psts
  # has_many :comments

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end

  def self.new_with_session(parms, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true ) do |user|
        user.attributes = parms 
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(parms, *options)
    if encrypted_password.blank?
      update_attributes(parms, *options)
    else
      super
    end
  end
  def username_required?
    super && provider.blank?
  end
  def email_required?
    super && provider.blank?
  end
end
