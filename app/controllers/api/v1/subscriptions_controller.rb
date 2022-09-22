module Api
  module V1
    class SubscriptionsController < ApplicationController
      def create
        sub = Subscription.create(sub_params)
        render json SubscriptionSerializer.new(sub), status: :created
      end

      private

      def sub_params
        params.permit (:title, :price, :status, :frequency, :customer_id)
      end
    end
  end
end
