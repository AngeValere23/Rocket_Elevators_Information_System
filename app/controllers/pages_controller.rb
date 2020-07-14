class PagesController < ApplicationController

  def post_quote
    # Get data from the form and omit unecessary data
    quote_params = params.except(:authenticity_token, :controller, :action, :utf8)
    quote_params.permit!

    #Save quote
    @quote = Quote.create(quote_params)
    @quote.save!

    # Redirect to confirm
    redirect_to root_path
  end
  
end