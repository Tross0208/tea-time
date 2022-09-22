require 'rails_helper'

RSpec.describe "Subscription Serializer" do
  it 'returns serialized subscription' do
    cust = Customer.create!(first_name: "Jimmy", last_name: "Dean", email: "baconwrangler@gmail.com", address: "Hidden Valley Ranch")
    sub = Subscription.create!(title: "Creamium", price: 9.99, status: true, frequency: "Monthly", customer_id: cust.id)

    sub_json = SubscriptionSerializer.serialize_subscription(sub)

    expect(sub_json).to be_a(Hash)
    expect(sub_json[:data][:attributes][:title]).to eq("Creamium")
    expect(sub_json[:data][:attributes][:price]).to eq(9.99)
    expect(sub_json[:data][:attributes][:status]).to eq(true)
    expect(sub_json[:data][:attributes][:frequency]).to eq("Monthly")
    expect(sub_json[:data][:attributes][:customer_id]).to eq(cust.id)
  end
end
