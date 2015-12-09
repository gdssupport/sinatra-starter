require 'sinatra/base'

module Sinatra
  module Formatting
    module Helpers
      def format_money(decimal_value)
        "$%.2f" % decimal_value
      end
    end
  end
end
