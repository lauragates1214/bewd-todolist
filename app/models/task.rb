class Task < ApplicationRecord
  # validations
  validates :content, length: { maximum: 200 }, presence: true
end
