class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category, optional: true
  belongs_to :tag, optional: true
  belongs_to :user, through: :account
end
