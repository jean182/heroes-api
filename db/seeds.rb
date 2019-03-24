# frozen_string_literal: true

Universe.create(name: "Marvel")
Universe.create(name: "DC-Comics")

35.times do
  Universe.create(name: Faker::Superhero.prefix)
end

Hero.create(
  name: "Spiderman",
  real_name: "Peter Parker",
  species: "Human",
  abilities: ["Spider Sense", "Wall Crawling", "Agility"],
  universe: Universe.find(1),
)

Hero.create(
  name: "Batman",
  real_name: "Bruce Wayne",
  species: "Human",
  abilities: ["No superpowers", "Martial Arts", "Detective Skills"],
  universe: Universe.find(2),
)

35.times do
  Hero.create(
    name: Faker::DcComics.hero,
    real_name: Faker::DcComics.name,
    species: Faker::Games::HeroesOfTheStorm.class,
    abilities: [Faker::Superhero.power, Faker::Superhero.power, Faker::Superhero.power],
    universe: Universe.find(rand(2..3)),
  )
end
