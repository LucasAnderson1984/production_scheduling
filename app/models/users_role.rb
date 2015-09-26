class UsersRole < ActiveRecord::Base
  self.primary_key = 'user_id'

  belongs_to :user
  belongs_to :role
end
