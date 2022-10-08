class Usuario
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, type: String
  field :password, type: String
  field :nombre, type: String
  field :apellido, type: String
  field :direccion, type: String
  field :telefono, type: Integer
  field :tarjeta, type: String
  has_one :carrito
end
