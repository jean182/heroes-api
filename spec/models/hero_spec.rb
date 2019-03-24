# frozen_string_literal: true

require "rails_helper"

RSpec.describe Hero, type: :model do
  describe "#validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:real_name) }
    it { is_expected.to validate_presence_of(:species) }
    it { is_expected.to belong_to(:universe) }
  end
end
