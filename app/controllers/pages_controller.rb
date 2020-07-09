class PagesController < ApplicationController

    def index

    end

    def services

    end

    def residential

    end

    def corporate

    end

    def quote
         @quotes = Quote.all
    end

    def new
      @quote = Quote.new #Generate data blank new form
    end

    def edit
    end


    private

      def set_quote
        @quote = Quote.find(params[:id])
      end


      def quote_params
        params.permit(:Full_Name, :Phone_Number, :Email, :Business_Name, :Project_Name, :buildingSelect, :nappartement,:nfloor,:nbasement,
        :nbusiness, :nbpark, :nShaft, :nbcompagnie, :MaxOccCorp, :hybrid_active)
      end

    # POST /quote
    def create
      @quote = Quote.new(quote_params)

      if params[:buildingSelectt] == 'Residential'
          @quote.FullName = quote_params[:Full_Name]
          @quote.Phone = quote_params[:Phone_Number]
          @quote.Email = quote_params[:Email]

          @quote.Business_Name = quote_params[:Business_Name]
          @quote.Building_Type = quote_params[:buildingSelect]
          @quote.Project_Name = quote_params[:Project_Name]
          @quote.Nb_Appartement = quote_params[:nappartement]
          @quote.Nb_Floor = quote_params[:nfloor]
          @quote.Nb_Basement = quote_params[:nbasement]

      end

      if  params[:buildingSelect] == 'Commercial'
          @quote.FullName = quote_params[:Full_Name]
          @quote.Phone = quote_params[:Phone_Number]
          @quote.Email = quote_params[:Email]

          @quote.Business_Name = quote_params[:Business_Name]
          @quote.Building_Type = quote_params[:buildingSelect]
          @quote.Project_Name = quote_params[:Project_Name]
          @quote.Nb_Appartement = quote_params[:nappartement]
          @quote.Nb_Floor = quote_params[:nfloor]
          @quote.Nb_Basement = quote_params[:nbasement]
          @quote.Nb_Parking = quote_params[:nbpark]
          @quote.Nb_shaft = quote_params[:nShaft]
      end

      if params[:buildingSelect] == 'Corporate'
          @quote.FullName = quote_params[:Full_Name]
          @quote.Phone = quote_params[:Phone_Number]
          @quote.Email = quote_params[:Email]

          @quote.Nb_compagnie = quote_params[:nbcompagnie]
          @quote.Building_Type = quote_params[:buildingSelect]
          @quote.Project_Name = quote_params[:Project_Name]
          @quote.Nb_Appartement = quote_params[:nappartement]
          @quote.Nb_Floor = quote_params[:nfloor]
          @quote.Nb_Basement = quote_params[:nbasement]
          @quote.Nb_Parking = quote_params[:nbpark]
          @quote.Nb_OccupantPerFloor = quote_params[:MaxOccCorp]

      end

      if params[:buildingSelect] == 'Hybrid'
        @quote.FullName = quote_params[:Full_Name]
        @quote.Phone = quote_params[:Phone_Number]
        @quote.Email = quote_params[:Email]

        @quote.Nb_compagnie = quote_params[:nbcompagnie]
        @quote.Building_Type = quote_params[:buildingSelect]
        @quote.Project_Name = quote_params[:Project_Name]
        @quote.Nb_Appartement = quote_params[:nappartement]
        @quote.Nb_Floor = quote_params[:nfloor]
        @quote.Nb_Basement = quote_params[:nbasement]
        @quote.Nb_Parking = quote_params[:nbpark]
        @quote.Nb_OccupantPerFloor = quote_params[:MaxOccCorp]
        @quote.Building_active = quote_params[:hybrid_active]

      end

      respond_to do |format|
        if @quote.save
          format.html { redirect_to thanks_path, notice: 'Quote was successfully created.' }
          format.json { render :show, status: :created, location: @quote }
        else
          format.html { render :new }
          format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @quote.update(quote_params)
          format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
          format.json { render :show, status: :ok, location: @quote }
        else
          format.html { render :edit }
          format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @quote.destroy
      respond_to do |format|
        format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  end
