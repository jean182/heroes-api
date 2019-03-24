# frozen_string_literal: true

class Hero < ApplicationRecord

  validates :name, :real_name, :species, presence: true
  belongs_to :universe

end
