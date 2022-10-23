class CarritosController < ApplicationController
  before_action :set_carrito, only: %i[ show update destroy ]
  before_action :set_producto, only: %i[ show update destroy create ]

  # GET /carritos
  def index
    @carritos = Carrito.all
    render json: @carritos
  end

  # GET /carritos/1
  def show
    render json: @carrito
  end

  # POST /carritos
  def create
    #find or create by Carrito
    #@carrito = Carrito.find_or_create_by()
    @carrito = Carrito.create(
      productos: [@producto.first]
    )

    if @carrito.save
      render json: @carrito, status: :created, location: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carritos/1
  #Agregar productos al carrito
  #Renombrar update -> agregar_producto
  def update 
    
    @carrito.update_attributes(
      productos: @carrito.productos.append(@producto)
    )
    if @carrito.update()
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carritos/1
  #destroy -> quitarProducto
  def destroy
    nuevos_productos = @carrito.productos.not.where(nombre: params[:nombre_producto])
    @carrito.update_attributes(
      productos: nuevos_productos
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
      @carrito = Carrito.find(params[:id])
    end

    def set_producto
      @producto = Producto.where(nombre: params[:nombre_producto])
    end

    # Only allow a list of trusted parameters through.
    def carrito_params
      params.require(:carrito).permit(:cantidadComprada,
        :nombre_producto
      )
    end
end
