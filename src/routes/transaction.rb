class MyApplication < Sinatra::Base

  get "/transactions" do
    @transactions = Transaction.all
    erb :transaction_list
  end

  get "/transactions/new" do
    erb :transaction_new
  end

  post "/transactions/new" do
    @transaction = Transaction.new
    @transaction.cust_id     = params["cust_id"]
    @transaction.con_id      = params["con_id"]
    @transaction.pay_type    = params["pay_type"]
    @transaction.amount      = params["amount"]
    @transaction.approv_code = params["approv_code"]
    @transaction.trans_date  = params["trans_date"]
    @transaction.agent_id    = params["agent_id"]
    @transaction.trans_notes = params["trans_notes"]

    @transaction.save!
    erb :transaction_new
  end

  get "/transactions/:id" do
    erb :index
  end

end
