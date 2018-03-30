class ReviewsController < ApplicationController
	before_action :check_session

	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to product_path review_params[:product_id]
		else
			render 'products/show'
		end
	end

	private
		def check_session
			if session[:user_id].nil?
				render nothing: true, status: :unauthorized
			end
		end

		def review_params
			params.require(:review).permit(
				:user_id,
				:product_id,
				:rating,
				:description
			)
		end
end
