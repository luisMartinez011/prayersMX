class Venta
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :producto
  #validates_presence_of :producto
  field :comprado, type: Integer
  field :total, type: Float
end
