class Producto
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nombre, type: String
  field :stock, type: Integer
  field :precio, type: Float
  
  validates :nombre, uniqueness: true
end

