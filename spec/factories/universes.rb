# frozen_string_literal: true

FactoryBot.define do
  factory :universe do
    name { rand(1..2) == 1 ? "DC Comics" : "Marvel" }
  end
end
