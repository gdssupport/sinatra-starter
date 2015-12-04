class MyApplication < Sinatra::Base

  get "/users" do
    @users = User.paginate( page: params["page"] , per_page: 10  )
    erb :user_list
  end

  get "/users/new" do
    @user = User.new
    @edit  = false
    erb :user_new
  end

  # users========== > login Get
  # post "/users/login" do
    # @user = authenticate( params["username"], params["password"] )
    # if authenticated?
      # redirect "/customers/1"
    # else
      # @error= "Invalid Username/Password combination"
      # erb:user_login
    # end
  # end

  # get "/logout" do
    # logout!

  # end
  # before "secrets/*" do
    # protected!
  # end

  # get "/supersecret" do
    # protected!
  # end

  # @user = User.find( params["id"] )
  # post "/users/:id/login" do
    # @user.update!( params["user"] )
    # flash[:success] = "Sucessfully Login User"
    # redirect "/users"
    #erb :agent_new
  # end

  post "/users/new" do
    @user = User.create!( params["user"] )
    flash[:success] = "Sucessfully Created Agent"
    redirect "/users"
    # erb :agent_new
  end

  get "/users/:id/edit" do
    @user = User.find( params["id"] )
    @edit  = true
    erb :user_new
  end

  post "/users/:id/edit" do
    @user = User.find( params["id"] )
    @user.update!( params["user"] )
    flash[:success] = "Sucessfully Updated User"
    redirect "/users"
    #erb :agent_new
  end

  get "/users/:id/delete" do
    @user = User.find( params["id"] )
    @user.destroy!
    flash[:success] = "Sucessfully Deleted User"
    redirect "/users"
  end

end
