require 'rails_helper'

RSpec.describe "Subscription Request" do
  it 'creates new subscription' do
    subs = Subscription.all.count
    cust = Customer.create!(first_name: "Jimmy", last_name: "Dean", email: "baconwrangler@gmail.com", address: "Hidden Valley Ranch")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "title": "Tea",
            "price": 9.99,
            "status": true,
            "frequency": "Monthly",
            "customer_id": cust.id
            }

    post '/api/v1/subscriptions', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(Subscription.all.count).to eq(subs + 1)
    expect(response.status).to eq(201)
    expect(response_body[:data][:attributes][:title]).to eq("Tea")
    expect(response_body[:data][:attributes][:price]).to eq(9.99)
    expect(response_body[:data][:attributes][:status]).to eq(true)
    expect(response_body[:data][:attributes][:frequency]).to eq("Monthly")
    expect(response_body[:data][:attributes][:customer_id]).to eq(cust.id)
  end
end