class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :producto
  field :total, type: Float
  field :cantidad, type: Integer

  
end
