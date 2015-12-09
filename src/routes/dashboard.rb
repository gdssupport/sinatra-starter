class MyApplication < Sinatra::Base

     get "/dashboard" do
       erb :dashboard
     end
    
end
