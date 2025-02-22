require 'rails_helper'

RSpec.describe Track, type: :model do

  describe "#associations" do
    it "has many papers" do
      association = Track.reflect_on_association(:papers)
      expect(association.macro).to eq(:has_many)
    end

    it "has and belong to many editors" do
      association = Track.reflect_on_association(:editors)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end

    it "has many track_aeics" do
      association = Track.reflect_on_association(:track_aeics)
      expect(association.macro).to eq(:has_many)
    end

    it "has many aeics" do
      association = Track.reflect_on_association(:aeics)
      expect(association.macro).to eq(:has_many)
    end

    it "has many subjects" do
      association = Track.reflect_on_association(:subjects)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe "#full_name" do
    it "includes code and name" do
      track = create(:track, code: 33, name: "Earth sciences and Ecology", short_name: "ESE")

      expect(track.full_name).to eq "33 Earth sciences and Ecology"
    end
  end

  describe "#label" do
    it "includes code and short name" do
      track = create(:track, code: 33, name: "Earth sciences and Ecology", short_name: "ESE")

      expect(track.label).to eq "Track: 33 (ESE)"
    end
  end
end
