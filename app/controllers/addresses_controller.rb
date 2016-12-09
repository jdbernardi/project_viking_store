class AddressesController < ApplicationController

	include AddressesHelper



	def index

		if params[:user]

			@addresses = User.find( params[:user] ).addresses

		else

			@addresses = Address.all

		end


	end

	def show

		user_id = Address.find(params[:id]).user_id

		@address = Address.find(params[:id])

		@url = '/admin/user/addresses/'

		@user = User.find( user_id )


	end


	def update

		@address = Address.find( params[:id] )
		city = City.create_or_find_by!(name: params[:city])
		state = State.create_or_find_by!(name: params[:state])
		@address.update( city_id: city.id, state_id: state.id )

	end

	def edit

		@user = User.find( params[:id] )

	end


end
