require 'factory_girl'
require 'spec/factories/user_factory'

module Seeds

  class SampleOrders
    def self.run
    u = Factory(:order)
  end
end