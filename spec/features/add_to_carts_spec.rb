require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

	# SETUP
	before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "n in 'My Cart(n)' in the nav bar is incremented when a user clicks add to cart" do

  	#ACT
  	visit root_path
  	cart_count = page.find("a", :text => /My Cart \(/).text.scan(/\d+/)[0].to_i
  	page.all("a[href^='/cart/add_item']").sample.click
  	new_cart_count = page.find("a", :text => /My Cart \(/).text.scan(/\d+/)[0].to_i

  	#VERIFY
  	expect(new_cart_count).to eq(cart_count + 1)

  end	
end
