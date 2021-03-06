class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :add_gun_to_favorites, :remove_gun_from_favorites]
  before_action :validate_user, only: [:edit, :update, :destroy, :add_gun_to_favorites, :remove_gun_from_favorites]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, notice: "#{@user.first_name}, you successfully created your account." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #PUT /users/1/add_gun_to_favorites/:gun_id
  def add_gun_to_favorites
    gun = Gun.find(params[:gun_id])
    if (gun)
      @user.favorite_guns << gun
      redirect_to gun, notice: 'Gun added to favorites.'
    else
      redirect_to root_url, notice: 'Error.'
    end 
  end

  #PUT users/1/remove_gun_from_favorites/:gun_id
  def remove_gun_from_favorites
    gun = Gun.find(params[:gun_id])
    if (gun && @user.favorite_guns.include?(gun))
      @user.favorite_guns.delete(gun)
      redirect_to @user, notice: 'Gun removed from favorites.'
    else
      redirect_to @user, notice: 'Error.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    # See if user the acting user is acting on themselves
    def validate_user
      if (!current_user || current_user.id.to_s != params[:id])
        redirect_to root_url
      end
    end
end
