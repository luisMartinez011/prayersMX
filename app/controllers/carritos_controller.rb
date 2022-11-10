class CarritosController < ApplicationController
  before_action :set_carrito, except: :create
  before_action :set_producto
  before_action :set_order
  before_action :authorize_request
  # GET /carritos/1
  def ver_carrito
    #@carrito.orders.map(&:productos)
    productines = @carrito.orders.delete_if {|a| a.producto.nombre == params[:nombre_producto] }
    render json: @carrito
  end

  # PATCH /carritos/1
  # Agregar productos al carrito
  # Renombrar update -> agregar_producto
  def agregar_producto 

    @order.update_attributes!(
      cantidad: params[:cantidadComprada],
      total: @order.producto.precio * params[:cantidadComprada]
    )
    @order.update()

    @carrito.update_attributes(
      orders: @carrito.orders.append(@order)
    )

    @carrito.update_attributes(
      total: @carrito.orders.sum("total")
    )
    
    if @carrito.update() 
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  
  # # DELETE /carritos/1
  # #destroy -> quitarProducto
  def quitar_producto
    new_orders = @carrito.orders.select {|a| a.producto.nombre != params[:nombre_producto] }
    

    @carrito.update_attributes(
      orders: new_orders,
      total: new_orders.sum("total")
    )
    if @carrito.update
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  def comprar

    @carrito.update_attributes(
      orders: [],
      total: 0
    )
    if @carrito.update
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrito
      @carrito = Usuario.find(params[:id]).carrito
    end

    def set_producto
      @producto = Producto.where(nombre: params[:nombre_producto])
    end

    def set_order
      @order = Order.create!(producto: @producto.first)
    end

    # Only allow a list of trusted parameters through.
    def carrito_params
      params.require(:carrito).permit(:cantidadComprada,
        :nombre_producto
      )
    end
end
