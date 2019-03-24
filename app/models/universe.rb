# frozen_string_literal: true

class Universe < ApplicationRecord

  validates :name, presence: true
  has_many :heroes, dependent: :destroy

end
