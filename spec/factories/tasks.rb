FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'Rspec & Capybara & FacctoryBotを準備する' }
    user
  end
end
