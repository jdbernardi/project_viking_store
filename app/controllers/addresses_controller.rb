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

		state = State.find_or_create_by(name: params[:state])
binding.pry
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

		@address = Address.new( address_params )

		binding.pry

	end


	def edit

		@address = Address.find( params[:id] )
		user_id = Address.find( params[:id] ).user_id
		@user = User.find( user_id )
		@url = "/admin/user/addresses/#{@address.id}"


	end


end
