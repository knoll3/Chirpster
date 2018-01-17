class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, precense: true
end
