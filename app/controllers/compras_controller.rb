class ComprasController < ApplicationController
  before_action :authorize_request

  # GET /compras/1
  def show
    render json: @compra
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_compra
    @compra = Compra.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def compra_params
    params.require(:compra).permit(:nombre_producto)
  end
end
