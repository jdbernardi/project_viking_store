class AnalyticsController < ApplicationController


	def index

		@user_week = User.count_since(7.days.ago)


	end


end
