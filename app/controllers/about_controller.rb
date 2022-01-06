class AboutController < ApplicationController
  def index
    # generate fake descriptions
    @story = Faker::Hipster.paragraph(100)
    @mission = Faker::Hipster.paragraph(100)
    @location = Faker::Hipster.paragraph(100)
  end
end
