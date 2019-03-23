# frozen_string_literal: true

Universe.create(name: "DC-Comics")
Universe.create(name: "Marvel")

35.times do
  Universe.create(name: Faker::Superhero.prefix)
end
