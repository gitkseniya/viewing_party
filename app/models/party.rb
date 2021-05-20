class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :guest_lists, dependent: nil
  has_many :friends, through: :guest_lists, class_name: 'User'
end
