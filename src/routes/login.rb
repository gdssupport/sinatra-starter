class MyApplication < Sinatra::Base

  get "/login" do
      erb :user_login
  end

  # Users login Get
  post "/login" do
    @user = authenticate( params["user"]["username"],  params["user"]["password"] )
    if authenticated?
      redirect "/dashboard" #todo
    else
      @success = false
      erb:user_login
    end
  end

  get "/logout" do
    logout!
  end

end
