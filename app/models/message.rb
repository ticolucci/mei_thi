class Message < ActiveRecord::Base
  validates :email, :from, :message, presence: true

  default_scope ->(){order('created_at DESC')}
end
