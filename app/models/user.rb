class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities

  after_create :set_default_role

  has_many :users_roles

  model_stamper

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_stampers
    User.stamper = self.current_user.email
  end

  def set_default_role
    add_role(:moderator)
  end
end
