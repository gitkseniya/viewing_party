class GuestList < ApplicationRecord
  belongs_to :party
  belongs_to :friend, class_name: 'User'

  enum status: [:pending, :accepted, :rejected]

end
