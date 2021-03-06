class ChargesController < ApplicationController

before_action :authenticate_user!

	def new
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => 'current_user.email',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Pic Purchase',
	    :currency    => 'gbp'
	  )
	  flash[:notice] = "Thanks for buying!"
	  redirect_to new_charge_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
