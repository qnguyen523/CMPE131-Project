class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.jsons
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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
        UserMailer.registration_confirmation(@user).deliver_now
        log_in @user
        format.html { redirect_to root_url, notice: 'Welcome to our website, please confirm your email' }
        # format.html { redirect_to @user, notice: 'Welcome to our website, ' + @user.first }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Something is wrong in create' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Account was successfully updated.' }
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
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = 'in usercontroller, confirm_email success. Your account has been confirmed'
      redirect_to root_url
    else
      flash[:error] = 'Error: User does not exist.'
      redirect_to root_url
    end 
  end

  
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "please log in"
        redirect_to login_url
      end
    end
    
     #make sure if the one doing action is the correct user
    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:notice] = "Only edit your own account"
        redirect_to(users_path) 
      end
    end
   

end 