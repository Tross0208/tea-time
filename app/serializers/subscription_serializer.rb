class SubscriptionSerializer
  def self.serialize_subscription(sub)
        {
          "data": {
            "type": "subscription",
            "id": sub.id,
            "attributes": {
              "title": sub.title,
              "price": sub.price,
              "status": sub.status,
              "frequency": sub.frequency,
              "customer_id": sub.customer_id
            }
          }
        }
  end
end
