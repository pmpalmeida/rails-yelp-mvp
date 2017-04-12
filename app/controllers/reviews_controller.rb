class ReviewsController < ApplicationController


before_action :set_review, only: [:new, :create]



 def index

    @reviews = Review.all
  end


def new

# we need @restaurant in our `simple_form_for`

#@restaurant = Restaurant.find(params[:restaurant_id])

@review = Review.new
end

def create

@review = Review.new(review_params)

# we need `restaurant_id` to asssociate review with corresponding restaurant

@review.restaurant = @restaurant
@review.save
redirect_to restaurant_path(@restaurant)
end

private

def review_params
  params.require(:review).permit(:content, :rating)
end

def set_review
  @restaurant = Restaurant.find(params[:restaurant_id])
end

end
