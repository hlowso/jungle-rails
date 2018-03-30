class ReviewsController < ApplicationController
	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to product_path review_params[:product_id]
		else
			render 'products/show'
		end
	end

	private
		def review_params
			params.require(:review).permit(
				:user_id,
				:product_id,
				:rating,
				:description
			)
		end
end
