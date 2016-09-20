require 'rails_helper'

RSpec.describe Apartment, type: :model do

  it "is a thing" do
    expect {Apartment.new}.to_not raise_error
  end

  it "has an address" do
    apartment1 = Apartment.new
    apartment1.address1 = "3803 Ray St."
    apartment1.address2 = "Suite B"
    apartment1.city = "San Diego"
    apartment1.postal_code = "92104"
    apartment1.state = "CA"
    apartment1.country = "USA"
    apartment1.image_file_name = "spec/assets/apt.jpeg"
    expect(apartment1.save).to be true
  end

  it "has a full address" do
    apartment2 = Apartment.new
    apartment2.address1 = "3803 Ray St."
    apartment2.address2 = "Suite B"
    apartment2.city = "San Diego"
    apartment2.postal_code = "92104"
    apartment2.state = "CA"
    apartment2.country = "USA"
    apartment2.image_file_name = "spec/assets/apt.jpeg"
    apartment2.save
    apartment3 = Apartment.find_by_address1("3803 Ray St.")
    expect(apartment3.address1).to eq "3803 Ray St."
    expect(apartment3.address2).to eq "Suite B"
    expect(apartment3.city).to eq "San Diego"
    expect(apartment3.postal_code).to eq "92104"
    expect(apartment3.state).to eq "CA"
    expect(apartment3.country).to eq "USA"
    expect(apartment3.image_file_name).to eq "spec/assets/apt.jpeg"
    expect(apartment3.full_address).to eq "3803 Ray St., Suite B, San Diego, 92104, CA, USA"
  end

end
