class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(permitted_params)
    if @user.save
      flash[:success] = "Object successfully created"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  # GET /users/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
      if @user.update(permitted_params)
        flash[:success] = "Object was successfully updated"
        redirect_to users_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  # GET /user/:id

  def show
    @user = User.find(:id)
  end
  
  
  # DELETE /users/:id

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to users_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to users_url
    end
  end 

  private

  def permitted_params
    params.require(:user).permit(
      :name, 
      :email,
      :password
    )
  end
end
