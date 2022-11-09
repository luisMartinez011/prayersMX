class Producto
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nombre, type: String
  field :stock, type: Integer
  field :precio, type: Float
  field :descripcion, type: String
  field :imagen, type: String

  # validates :nombre, uniqueness: true, presence: true
  # validates :stock, presence: true
  # validates :precio, presence: true 
  # validates :descripcion, presence: true
  # validates :imagen, presence: true
  
end

