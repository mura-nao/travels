class Travel < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture

  validates :resource,  presence: true, length: {maximum: 30}
  has_many :comments
end
