class Venta
  include Mongoid::Document
  include Mongoid::Timestamps
  has_one :producto
  field :comprado, type: Integer
  field :total, type: Float
end
