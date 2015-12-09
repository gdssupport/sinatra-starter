class MyApplication < Sinatra::Base

  before "/customers*" do
    protected!
  end

    get "/customers" do
      @customers =  Customer.paginate( page: params["page"] , per_page: 7  )

      if params[:first_name] != nil
        @customers = @customers.where(" first_name ILIKE ?" , "%" + params[:first_name] + "%" )
      end

      if params[:last_name] != nil
        @customers = @customers.where(" last_name ILIKE ?" , "%" + params[:last_name] + "%" )
      end

      erb :customer_list
    end
    # Customers New GET
    get "/customers/new" do
      erb :customer_new
    end
    # Customers New POST and redirect to agents list
    post "/customers/new" do
      @customer = Customer.new
      @customer.first_name  = params["first_name"]
      @customer.last_name   = params["last_name"]
      @customer.tel         = params["tel"]
      @customer.email       = params["email"]
      @customer.lead        = params["lead"]
      @customer.add_contact = params["add_contact"]
      @customer.contact_tel = params["contact_tel"]
      #@customer.create_date = params["create_at"]
      @customer.save!
      redirect "/customers"
      # erb :customer_new
    end

    get "/customers/:id" do
      @customer = Customer.find(params[:id])
      @concept = Concept.where(cust_id: @customer.id).first

      if @concept == nil
        @transactions = []
        @total_cost   = 0
      else
        @transactions = Transaction.where(concept_id: @concept.id)
        @total_cost = @transactions.inject(0) do |result, trans|
          result + trans.amount
        end
      end

      erb :customer_show

    end

end
