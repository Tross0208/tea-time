class SubscriptionSerializer
  def self.serialize_subscription(sub, tea)
    
        {
          "data": {
            "type": "subscription",
            "id": sub.id,
            "attributes": {
              "title": sub.title,
              "price": sub.price,
              "status": sub.status,
              "frequency": sub.frequency,
              "customer_id": sub.customer_id,
              "tea": {
                "title": tea.title,
                "description": tea.description,
                "temperature": tea.temperature,
                "brew_time": tea.brew_time
              }
            }
          }
        }
  end
end
