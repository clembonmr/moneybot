class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_and_belongs_to_many :tag
  has_one :user, through: :account
end
