class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  belongs_to :tag
  has_one :user, through: :account
end
