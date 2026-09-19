class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: {greater_than: :start_date}
  validates :body, length: {maximum: 500}
end
