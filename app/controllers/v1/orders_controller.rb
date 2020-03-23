class V1::OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

    def index
        orders = Order.all
        render json: orders, each_serializer: Orders::IndexSerializer
    end

    def create
      order = current_user.order.create(order_params)
      if order.persisted?
        render json: { message: 'The order was successfully created.' }, status: 201
      else
        render json: { error_message: 'Unable to create order' }, status: 422
      end
    end

    def update
        order = Order.find(params[:id])
        if order.update(order_params)
          render json: { message: 'Your order has been updated.' }, status: 200
        else
          render json: { error_message: order.errors.full_messages.to_sentence }, status: 422
        end
    end    
  
    private
  
    def order_params
      params.require(:order).permit(:accessible_item, :email, :location, :phone)
    end
  end