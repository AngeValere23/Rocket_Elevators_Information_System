
class QuotesController < ApplicationController
before_action :set_quote, only: [:show, :edit, :update, :destroy]

 def index
   @quotes = Quote.all
 end

 def show

 end


 def new
   @quote = Quote.new
 end

 def edit
 end

 # POST /quote
 def create
   @quote = Quote.new()

   if params[:department] == 'Residential'
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

   if  params[:department] == 'Commercial'
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

   if params[:department] == 'Corporate'
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

   if params[:department] == 'Hybrid'
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

 # PATCH/PUT /quotes/1
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

 private

   def set_quote
     @quote = Quote.find(params[:id])
   end


   def quote_params
     params.permit(:department, :Check, :NbApartRes, :NbStageRes, :NbSsRes, :nb_of_cage, :totalprice, :NbStageCom,
       :NbSsCom, :NbParkCom, :NbBusiCom, :NbCageCom, :NbBusiCorp,:NbStageCorp, :NbSsCorp, :NbParkCorp,
       :MaxOccCorp, :NbBusiHyb, :NbStageHyb, :NbSsHyb, :NbParkHyb, :MaxOccHyb, :OppHourHyb, :Full_Name, :Phone_Number)
   end
end
