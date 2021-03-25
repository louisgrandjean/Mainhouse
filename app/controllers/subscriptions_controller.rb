class SubscriptionsController < ApplicationController
  before_action :authenticate_agency!

  def new 
  end

  def update
    #gets the credit card details submitted in the form
    token = params[:stripeToken]

    #create a customer
    customer = Stripe::Customer.create(
      card: token,
      plan: 'price_1IXuT8K77H3ogMHNct9OBQE2',
      email: current_agency.email,
      trial_end: (Time.now + 1.month).to_i
    )

    current_agency.subscribed = true
    current_agency.stripeid = customer.id
    current_agency.save


    redirect_to agency_buildings_path(current_agency), notice: "Your subscription was set up successfully! Happy learning!"

  end
  
end
