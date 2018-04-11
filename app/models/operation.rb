class Operation < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_and_belongs_to_many :tags
  has_one :user, through: :account
end
