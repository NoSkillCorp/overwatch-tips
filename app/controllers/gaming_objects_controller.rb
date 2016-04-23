class GamingObjectsController < ApplicationController
  before_action :set_gaming_object, only: [:show, :edit, :update, :destroy]

  # GET /gaming_objects
  # GET /gaming_objects.json
  def index
    @gaming_objects = GamingObject.where(type: params[:type])
  end

  # GET /gaming_objects/1
  # GET /gaming_objects/1.json
   def show
   end

  # # GET /gaming_objects/new
  # def new
  #   @gaming_object = GamingObject.new
  # end

  # # GET /gaming_objects/1/edit
  # def edit
  # end

  # # POST /gaming_objects
  # # POST /gaming_objects.json
  # def create
  #   @gaming_object = GamingObject.new(gaming_object_params)

  #   respond_to do |format|
  #     if @gaming_object.save
  #       format.html { redirect_to @gaming_object, notice: 'Gaming object was successfully created.' }
  #       format.json { render :show, status: :created, location: @gaming_object }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @gaming_object.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /gaming_objects/1
  # # PATCH/PUT /gaming_objects/1.json
  # def update
  #   respond_to do |format|
  #     if @gaming_object.update(gaming_object_params)
  #       format.html { redirect_to @gaming_object, notice: 'Gaming object was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @gaming_object }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @gaming_object.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /gaming_objects/1
  # # DELETE /gaming_objects/1.json
  # def destroy
  #   @gaming_object.destroy
  #   respond_to do |format|
  #     format.html { redirect_to gaming_objects_url, notice: 'Gaming object was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gaming_object
      @gaming_object = GamingObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gaming_object_params
      params.require(:gaming_object).permit(:name, :description, :type)
    end
end
