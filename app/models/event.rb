class Event < ApplicationRecord
    belongs_to :user, required: true

    has_many :messages

    has_many :attends
    has_many :attendees, through: :attends, source: :user

    validate :future_dated
    before_save :downcase

    validates :name, :city, presence: true, length: { in: 2..30 }
    validates :state, presence: true, length: { is: 2 }

    def downcase
        self.name.downcase!
        self.city.downcase!
        self.state.downcase!
    end    

end
