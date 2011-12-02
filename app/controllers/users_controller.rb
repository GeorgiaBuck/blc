class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
	before_filter :authenticate, :only => [:edit, :users, :index, :update]
	before_filter :correct_user, :only => [:edit, :users]
	before_filter	:admin_user,		:only => :destroy

	def admin_user
		current_user.admin?
	end
	
  def index
		@title = "All users"
    @users = User.order(:last_name, :first_name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
		@user.name = @user.first_name + " " + @user.last_name
		@title = @user.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
		@title = "Sign Up"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
		@title = "Edit User"
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

#    respond_to do |format|
     if @user.save
				sign_in @user
#       format.html { redirect_to(users_url, :notice => "User #{@user.name} was successfully created.") }
#       format.xml  { render :xml => @user, :status => :created, :location => @user }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
 				flash[:success] = "Welcome to the Breakthrough Living Class"
				redirect_to @user
			else
				@title = "Sign up"
				render 'new'
     end
#    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
		@user.name = @user.first_name + " " + @user.last_name	

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url, :notice => "User #{@user.name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

	def picture
		picture = user.image? ? user.image : "Picture unavailable"
		@picture = picture
	end
	
	private
	
		def authenticate
			deny_access unless signed_in?
		end
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(:home) unless current_user?(@user) || current_user.admin?
	end
end
