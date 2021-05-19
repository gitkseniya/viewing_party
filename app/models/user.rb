class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :friends,
              class_name: 'User',
              join_table: :friendships,
              foreign_key: :user_id,
              association_foreign_key: :friend_id

  has_many :parties, class_name: 'Party',
                     foreign_key: :host_id,
                     inverse_of: :host


  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true

end
