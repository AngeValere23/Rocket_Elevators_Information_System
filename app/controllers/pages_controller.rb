class PagesController < ApplicationController

    def index

    end

    def services

    end

    def residential

    end

    def corporate

    end


     def new
       @quote = Quote.new #Generate data blank new form
     end

    def submit_quote

      quote_params = params.except(:authenticity_token, :controller, :action)

      quote_params.permit!

      @quote = Quote.create(quote_params)

      respond_to do |format|
        if @quote.save!
          format.html { redirect_to root_path }
          format.json { render :show, status: :created, location: @quote }
        else
          format.html { render :new }
          format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
      end
    end

  end
