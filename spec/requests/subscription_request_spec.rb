require 'rails_helper'

RSpec.describe "Subscription Request" do
  xit 'creates new subscription' do
    subs = Subscription.all.count
    cust = Customer.create!(first_name: "Jimmy", last_name: "Dean", email: "baconwrangler@gmail.com", address: "Hidden Valley Ranch")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "title": "Tea",
            "price": 9.99,
            "status": "active",
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

  it 'creates adds tea to subscription' do
    teas = Tea.all.count
    cust = Customer.create!(first_name: "Jimmy", last_name: "Dean", email: "baconwrangler@gmail.com", address: "Hidden Valley Ranch")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "title": "Tea",
            "price": 9.99,
            "status": "active",
            "frequency": "Monthly",
            "customer_id": cust.id,
            "tea": {
                    "title": "Black Tea",
                    "description": "It's a tea",
                    "temperature": 165,
                    "brew_time": 6
                   }
            }

    post '/api/v1/subscriptions', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(Tea.all.count).to eq(teas + 1)
    expect(response.status).to eq(201)
    expect(response_body[:data][:attributes][:tea][:title]).to eq("Black Tea")
  end

  it 'cancels subscription' do
    cust = Customer.create!(first_name: "Jimmy", last_name: "Dean", email: "baconwrangler@gmail.com", address: "Hidden Valley Ranch")
    sub = Subscription.create!(title: "Creamium", price: 9.99, status: "active", frequency: "Monthly", customer_id: cust.id)
    tea = Tea.create!(title: "Black Tea", description: "It's a tea", temperature: 165, brew_time: 6, subscription_id: sub.id)


    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "id": sub.id,
            "title": "Tea",
            "price": 9.99,
            "status": "inactive",
            "frequency": "Monthly",
            "customer_id": cust.id,
            }

    patch "/api/v1/subscriptions/#{sub.id}", headers: header, params: JSON.generate(body)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_body[:data][:attributes][:status]).to eq("inactive")
  end
end
