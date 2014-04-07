require 'spec_helper'

describe Violation do
  it "has a valid factory" do
    expect(create(:violation)).to be_valid
  end

  it "can be marked as critical" do
    expect(create(:violation).critical?).to be_true
  end

  it "should generate a short description" do
    new_restaurant = create(:violation)
    expect(new_restaurant.short_desc.length).to eq(64)
  end

  it "should find the most common violations" do
    violation = create(:violation)
    violation2 = create(:violation, vio_code: "01F")
    violation3 = create(:violation, vio_code: "01G")
    violation4 = create(:violation, vio_code: "01H")
    rest1 = Restaurant.create(name: "Subway")
    rest2 = Restaurant.create(name: "Burger King")
    violation.restaurants << rest1
    violation.restaurants << rest2
    violation2.restaurants << rest1
    violation2.restaurants << rest2
    violation3.restaurants << rest1
    violation3.restaurants << rest2
    expect(Violation.most_common).to include(violation, violation2, violation3)
    expect(Violation.most_common).to_not include(violation4)
  end

  it "should find the three most common violations for a particular zipcode" do
    zip = create(:zipcode)
    violation = create(:violation)
    violation2 = create(:violation, vio_code: "01F")
    violation3 = create(:violation, vio_code: "01G")
    violation4 = create(:violation, vio_code: "01H")
    violation4 = create(:violation, vio_code: "01I")
    violation4 = create(:violation, vio_code: "01J")
    rest1 = create(:restaurant)
    rest2 = create(:restaurant, name: "Subway")
    zip.restaurants << rest1
    zip.restaurants << rest2
    rest1.violations << [violation, violation2, violation3]
    expect(zip.most_common_vios).to include(violation, violation2, violation3)
    expect(zip.most_common_vios).to_not include(violation4)
  end

  it "should return bad restaurants" do
    zip = create(:zipcode)
    rest1 = create(:restaurant)
    zip.restaurants << rest1
    expect(zip.bad_restaurants.length).to eq(1)
  end

end