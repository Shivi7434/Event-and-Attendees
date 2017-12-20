class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :messages
  has_many :attends
  has_many :attending, through: :attends, source: :event

  email_regex = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  before_save :downcase

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness:true, format: { with: email_regex}
  validates :city, presence: true, length: { in: 2..30 }
  validates :state, presence:true, length: {is: 2 }

  def downcase
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
      self.city.downcase!
      self.state.downcase!
  end  
end
