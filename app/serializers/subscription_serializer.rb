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

  def self.serialize_subscriptions(subs)
        {
          "data":
            subs.map do |sub|
            {
            "type": "subscription",
            "id": sub.id,
            "attributes": {
              "title": sub.title,
              "price": sub.price,
              "status": sub.status,
              "frequency": sub.frequency,
              "customer_id": sub.customer_id,
              "tea": {
                "title": sub.teas.first.title,
                "description": sub.teas.first.description,
                "temperature": sub.teas.first.temperature,
                "brew_time": sub.teas.first.brew_time
              }
            }
          }
        end
        }
  end
end
