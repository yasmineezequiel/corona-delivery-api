class V1::OrdersController < ApplicationController

    def index
        orders = Order.all
        render json: orders, each_serializer: Orders::IndexSerializer
    end

    def create
      order = Order.create(order_params)
      if order.persisted?
        render json: { message: 'The order was successfully created.' }, status: 201
      else
        render json: { error_message: 'Unable to create order' }, status: 422
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:accessible_item, :email, :location, :phone)
    end
  end