class UsersController < ApplicationController

	include UsersHelper

	def index

		@users = User.all


	end

end
