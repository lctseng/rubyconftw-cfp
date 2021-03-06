require 'rails_helper'

RSpec.describe Review, type: :model do

  # TODO: let shulda validate_uniqueness_of matcher work
  it "should validate uniqinuess of review" do
    review = FactoryGirl.create(:review)
    duplicate_review = Review.new(paper: review.paper, user: review.user)
    duplicate_review.valid?

    expect(duplicate_review.errors.full_messages).to include("Paper has already been taken")
  end

  it "should update paper status after create" do
    paper = FactoryGirl.create(:paper)
    expect(paper).to have_state(:submitted)

    FactoryGirl.create(:review, paper: paper)
    expect(paper).to have_state(:reviewed)
  end

end
