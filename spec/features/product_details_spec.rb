require 'rails_helper'

RSpec.feature "navigate to product detail page by click on a product", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They visit product details by clicking on details button" do
    # ACT
    visit root_path
    click_link 'Details'
    # DEBUG / VERIFY
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

  scenario "They visit product details by clicking on product image" do
    visit root_path
    find('article.product header ').click
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

  scenario "They visit product details by clicking on product name" do
    visit root_path
    find('article.product header h4').click
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end
end
