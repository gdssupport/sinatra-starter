class MyApplication < Sinatra::Base

  get "/customers" do
    @customers = Customer.all
    erb :customer_list
  end

  get "/customers/new" do
    erb :customer_new
  end

  post "/customers/new" do
    @customer = Customer.new
    @customer.first_name  = params["first_name"]
    @customer.last_name   = params["last_name"]
    @customer.tel         = params["tel"]
    @customer.email       = params["email"]
    @customer.lead        = params["lead"]
    @customer.add_contact = params["add_contact"]
    @customer.contact_tel = params["contact_tel"]
    @customer.create_date = params["create_date"]

    @customer.save!
    erb :customer_new
  end

  get "/customers/:id" do
    @customer = Customer.find(params[:id])
    @concept = Concept.where(cust_id: @customer.id).first
    @transactions = Transaction.where(concept_id: @concept.id)
    @total_cost = @transactions.inject(0) do |result, trans|
      result + trans.amount
    end

    erb :customer_show
  end



end
