class Venta
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :productos, as: :gestion_compras
  #validates_presence_of :producto
  field :comprado, type: Integer
  field :total, type: Float
end
