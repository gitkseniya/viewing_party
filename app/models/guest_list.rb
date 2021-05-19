class GuestList < ApplicationRecord
  belongs_to :party
  belongs_to :friend, class_name: 'User'

  enum status: [:pending, :accepted, :rejected]

  # def self.add_party_guest(friends, party_id)
  #   friends.shift
  #   friends.each do |friend|
  #     Friendship.find_by(friend_id: friend)
  #     create!(party_id: party.id, friendship_id: friendship.id)
  #   end
  # end
end
