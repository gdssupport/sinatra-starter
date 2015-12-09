class MyApplication < Sinatra::Base

  before "/transactions*" do
    protected!
  end

  # get "/transactions" do
  #   @transactions = Transaction.paginate( page: params["page"] , per_page: 4  )
  #   erb :transaction_list
  # end

  get "/transactions" do
    @transactions = Transaction.all
    @transactions = Transaction.paginate( page: params["page"] , per_page: 4  )
    erb :transaction_list
  end

  get "/transactions/new/:customer_id/:concept_id" do

    @customer = Customer.find( params[:customer_id ] )
    @concept = Concept.find( params[:concept_id ])

    #TODO: Check that transaction is valid
    #valid = true
    #if !valid
    #   halt 400 , "Invalid"
    #end

    erb :transaction_new
  end

  post "/transactions/new/:customer_id/:concept_id" do

    #TODO: Check that transaction is valid
    #valid = true
    #if !valid
    #   halt 400 , "Invalid"
    #end

    @transaction = Transaction.new
    @transaction.cust_id     = params["customer_id"]
    @transaction.concept_id  = params["concept_id"]
    @transaction.pay_type    = params["pay_type"]
    @transaction.amount      = params["amount"]
    @transaction.approv_code = params["approv_code"]
    @transaction.trans_date  = params["trans_date"]
    @transaction.user_id     = authenticated_user.id
    @transaction.trans_notes = params["trans_notes"]
    @transaction.save!

    redirect "/customers/" + @transaction.cust_id

  end
  # Transactions Find GET and redirect to Transactions new form
  get "/transactions/:id/edit" do
    @transaction = Transaction.find( params["id"] )
    @edit  = true
    erb :transaction_new
  end

  # Transactions UPDATE POST and redirect to transactions list
  post "/transactions/:id/edit" do
    @transaction = Transaction.find( params["id"] )
    @transaction.update!( params["user"] )
    flash[:success] = "Sucessfully Updated Transaction"
    redirect "/transactions"
    #erb :agent_new
  end

  # Transactions DESTROY GET and redirect to Transactions list
  get "/transactions/:id/delete" do
    @transaction = Transaction.find( params["id"] )
    @transaction.destroy!
    flash[:success] = "Sucessfully Deleted Transaction"
    redirect "/transactions"
  end

  get "/transactions/:id" do
    erb :index
  end

end
