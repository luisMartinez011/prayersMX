class Producto
  include Mongoid::Document
  include Mongoid::Timestamps
  field :stock, type: Integer
  field :precio, type: Integer
  field :nombre, type: String
end

