module Api
  module V1
    class SubscriptionsController < ApplicationController
      def create
        #binding.pry
        sub = Subscription.create(sub_params)
        tea = Tea.create!(title: params[:tea][:title],
                          description: params[:tea][:description],
                          temperature: params[:tea][:temperature],
                          brew_time: params[:tea][:brew_time],
                          subscription_id: sub.id)
        render json: SubscriptionSerializer.serialize_subscription(sub, tea), status: :created
      end

      private

      def sub_params
        params.permit(:title, :price, :status, :frequency, :customer_id)
      end

      #def tea_params
      #  params.permit(:tea) => [:title, :description, :temperature, :brew_time])
      #end
    end
  end
end
