class MyApplication < Sinatra::Base

  get "/" do
    @names = [ "Default" ]
    erb :index
  end

  get "/reciepts/:id" do
    @names = [ params["first_name"] ]
    erb :index
  end


end
