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

  def post_lead
    # Get data from the form and omit unecessary data
    lead_params = params.except(:authenticity_token, :controller, :action, :utf8, :button)
    lead_params.permit!
    
    
    file = lead_params[:AttachedFile]

    lead_params = lead_params.except(:AttachedFile)
    lead_params[:filename] = file.original_filename
    lead_params[:content_type] = file.content_type
    lead_params[:file_contents] = file.read

    # Save lead
    @lead = Lead.create(lead_params)
    @lead.save!

    # Redirect to confirm
    #redirect_to root_path
  end

  def download_lead
    lead = Lead.find(params[:id])
   
    data = lead.file_contents
    send_data(data, :type => lead.content_type, :filename => lead.filename, :disposition => 'download')
  end
  
end