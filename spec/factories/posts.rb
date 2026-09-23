FactoryBot.define do
  factory :post do
    sequence(:title)  { |n| "タイトル#{n}" }
    sequence(:start_date) { |n| Date.new(2026, 9, 21) + (n - 1).days }
    sequence(:end_date) { |n| Date.new(2026, 9, 21) + (n).days }
    sequence(:created_at) { |n| DateTime.new(2026, 9, 21, 0, 0, 0) + (n - 1).days }
    sequence(:updated_at) { |n| DateTime.new(2026, 9, 21, 0, 0, 0) + (n).days  }
  end
end
