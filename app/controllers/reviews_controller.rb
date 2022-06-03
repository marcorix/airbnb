class ReviewsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.flat = @flat

    respond_to do |format|
      if @review.save
        format.html { redirect_to flat_path(@flat) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "flats/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
