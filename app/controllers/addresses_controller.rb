class AddressesController < ApplicationController

	include AddressesHelper



	def index

		if params[:user]

			@addresses = User.find( params[:user] ).addresses
			@user = User.find( params[:user] )

		else

			@addresses = Address.all

		end


	end


	def new

		@user = User.find(params[:format])

	end



	def show

		user_id = Address.find(params[:id]).user_id

		@address = Address.find(params[:id])

		@url = "/admin/user/addresses/"

		@user = User.find( user_id )

	end


	def update

		@address = Address.find( params[:id] )
		city = City.create_or_find_by!(name: params[:city])
		state = State.create_or_find_by!(name: params[:state])

 		if @address.update( city_id: city.id, state_id: state.id )

 			flash.notice = "Address updated!"

 			redirect_to addresses_path

 		else

 			flash.notice = errors
 			redirect_to edit_address_path( @address )

 		end



	end



	def edit

		@address = Address.find( params[:id] )
		user_id = Address.find( params[:id] ).user_id
		@user = User.find( user_id )



	end


end
