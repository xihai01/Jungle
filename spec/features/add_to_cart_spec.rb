require 'rails_helper'

RSpec.feature "add a product to cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    2.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "they can add an item to cart" do
    visit root_path
    first('footer.actions').click_on 'Add'
    # check its same page
    expect(page.current_path).to eq '/'
    # check cart increase by 1
    elm = find('ul.navbar-right')
    expect(elm).to have_text "My Cart (1)"
    save_screenshot
  end

  scenario "they can add two items to cart" do
    visit root_path
    expect(page.current_path).to eq '/'
    elm = find('ul.navbar-right')
    all('footer.actions button')[0].click
    all('footer.actions button')[1].click
    expect(elm).to have_text "My Cart (2)"
    save_screenshot
  end
end
