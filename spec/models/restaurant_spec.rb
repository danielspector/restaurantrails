require 'spec_helper'

describe Restaurant do

  it "allows a restaurant to be created" do 
    expect(create(:restaurant)).to be_valid
  end

  it "finds the zip code id of the current restaurant" do
    rest = create(:restaurant)
    zip = Zipcode.create(zip: 10009)
    expect(rest.ziparg).to eq(zip.id)
  end

  it "can save the relationship between a restaurant and zip code" do
    rest = create(:restaurant)
    zip = Zipcode.create(zip: 10009)
    rest.zipify
    expect(rest.zipcode_id).to eq(zip.id)
  end

  it "translates a phone number into a human readable output" do 
    rest = create(:restaurant)
    expect(rest.phone_num).to eq("610-291-0233")
  end

  # This test probably needs more than one factory to be tested correctly
  it "results a list of restaurants based on the zip code given" do 
    rest = create(:restaurant)
    expect(Restaurant.zip_list(10009)).to include(rest)
  end

  # This test probably needs more than one factory to be tested correctly
  it "resturns all the zip codes for all restaurants" do 
    rest = create(:restaurant)
    rest2 = create(:restaurant, name: "cafe", zip: 10003)
    count = Restaurant.count
    expect(Restaurant.all_zips.count).to eq(2)
  end

  it "results the address in address in a human readable outout." do 
    rest = create(:restaurant)
    expect(rest.address).to eq("145 East 7th Street, 10009")
  end

  it "results a list of the worst restaurants by zip code, it accepts a number of restaurants to return" do 
    rest = create(:restaurant)
    rest2 = create(:restaurant, name: "cafe")
    results = Restaurant.worst_restaurant_in_zip(10009, 2)
    expect(results).to eq([rest, rest2])
  end

end