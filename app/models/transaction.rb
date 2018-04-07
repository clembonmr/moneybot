class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  belongs_to :tag
  belongs_to :user, through: :account
end
