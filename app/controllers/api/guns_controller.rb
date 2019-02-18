class Api::GunsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_gun, only: [:show, :update, :destroy]

  # GET /api/guns
  def index
  	if(params.has_key?(:brand_id))
      @guns = Gun.where(brand_id: params[:brand_id])
    else
      @guns = Gun.all
    end
    
    render json: @guns
  end

  # GET /api/guns/1
  def show
    render json: @gun
  end

  # POST /api/guns
  def create
    @gun = Gun.new(gun_params)
    if(params.has_key?(:brand_id))
    	@gun.brand_id = params[:brand_id];
    end

    if @gun.save
      render json: @gun, status: :created, location: @gun
    else
      render json: @gun.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/guns/1
  def update
    if @gun.update(gun_params)
      render json: @gun
    else
      render json: @gun.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/guns/1
  def destroy
    @gun.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gun
      @gun = Gun.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gun_params
      params.require(:gun).permit(:name, :caliber, :brand_id)
    end

end