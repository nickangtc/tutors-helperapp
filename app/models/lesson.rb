class Lesson < ApplicationRecord
  belongs_to :user
  has_one :payment_method
end
