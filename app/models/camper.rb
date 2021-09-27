class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups
    validates :name, presence: true
    validates :age, :inclusion => { :in => 8..18 }
end


# Add validations to the Camper model:

# must have a name
# must have an age between 8 and 18