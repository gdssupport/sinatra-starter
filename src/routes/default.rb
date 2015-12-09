class MyApplication < Sinatra::Base

  get "/" do
    redirect "/login"
  end

  get "/reciepts/:id" do
    @names = [ params["first_name"] ]
    erb :index
  end


end
