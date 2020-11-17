require 'rails_helper'

RSpec.feature "User clicks 'Add to Cart' and cart increases by one", type: :feature, js: true do
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

  scenario "The cart increases by one" do
    visit root_path

    expect(page).to have_content('My Cart (0)')

    first("article.product").click_button('Add')

    expect(page).to have_content('My Cart (1)')

    save_screenshot
  end

end
