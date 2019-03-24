# frozen_string_literal: true

FactoryBot.define do
  factory :hero do
    name { Faker::DcComics.hero }
    real_name { Faker::DcComics.name }
    species { Faker::Games::HeroesOfTheStorm.class }
    abilities { [Faker::Superhero.power, Faker::Superhero.power, Faker::Superhero.power] }
    universe
  end
end
