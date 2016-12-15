class AddressesController < ApplicationController

	include AddressesHelper
	include ApplicationHelper


	def index

		if params[:user]

			@addresses = User.find( params[:user] ).addresses
			@user = User.find( params[:user] )

		else

			@addresses = Address.all

		end


	end


	def new



		@user = User.find(params[:user])
		addresses = Address.where(user_id: @user.id)
		user_id = addresses.first.user_id



	end



	def show

		user_id = Address.find(params[:id]).user_id

		@address = Address.find(params[:id])

		@url = "/admin/user/addresses/"

		@user = User.find( user_id )

	end


	def update


		@address = Address.find( params[:id] )
		city = City.find_or_create_by(name: params[:city])

		state = State.find(params[:state][:id])

		zip = params[:zip]

 		if @address.update( city_id: city.id, state_id: state.id,
 		  zip_code: zip )

 			flash.notice = "Address updated!"

 			redirect_to addresses_path

 		else

 			flash.notice = errors
 			redirect_to edit_address_path( @address )

 		end



	end


	def create

		user_id = params[:id]
		street = params[:street_address]
		zip = params[:zip_code]

		city = City.find_or_create_by(name: params[:city])

		state = State.find(params[:state][:id])

		@address = Address.new(
				street_address: street,
				zip_code: zip,
				city: city,
				state: state,
				user_id: user_id  )

 		if @address.save

 			flash.notice = "Address updated!"

 			redirect_to addresses_path

 		else

 			flash.notice = errors
 			redirect_to new_address_path(:user => user_id)

 		end



	end


	def edit

		@address = Address.find( params[:id] )
		user_id = Address.find( params[:id] ).user_id
		@user = User.find( user_id )
		@url = "/admin/user/addresses/#{@address.id}"


	end


end
