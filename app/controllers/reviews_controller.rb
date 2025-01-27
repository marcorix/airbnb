class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @flat = Flat.find(params[:flat_id])
    @review.flat = @flat
    @review.user = current_user

    respond_to do |format|
      if @review.save!
        # redirect_to flat_path(@review.flat), notice: 'Review was successfully created.'
        format.html { redirect_to flat_path(@review.flat), notice: 'Review was successfully created.' }
        format.json
      else
        # render 'flats/show', alert: 'Review was not created.', status: :unprocessable_entity
        format.html { render 'flats/show', alert: 'Review was not created.', status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
