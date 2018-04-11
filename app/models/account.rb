class Account < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy
end
