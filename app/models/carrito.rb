class Carrito
  include Mongoid::Document
  include Mongoid::Timestamps
  has_one :producto
end