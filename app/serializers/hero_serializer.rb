# frozen_string_literal: true

class HeroSerializer < ActiveModel::Serializer

  attributes :id, :name, :real_name, :species, :abilities
  belongs_to :universe

end
