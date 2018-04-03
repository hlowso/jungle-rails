require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "They can click on a product to navigate to its details page" do
    
    #ACT
  	visit root_path
  	product_links = page.all("a[href^='/products']")
  	chosen_link = product_links.sample()
  	chosen_link.trigger('click')

    # VERIFY
  	expect(page).to have_selector('section.products-show')

  end
end
