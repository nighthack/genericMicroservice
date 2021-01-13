# Call any helpers directly in code
require './utils/helpers'

get '/users' do
  users = User.all
  return { users: users }.to_json
end

get '/users/info' do
  user = User.where(phone: params[:phone]).first
  return { user: user, phone: params[:phone] }.to_json
end

post '/users' do
  user = User.where(
    phone: params[:phone],
    name: params[:name],
    profile: params[:profile],
    balance: params[:balance]
  ).first_or_create
  return { user: user, phone: params[:phone] }.to_json
end

private
  
  # response format for bots
  def build_response(message)
    return {
      "fulfillmentMessages" => [
        {
          "text": {
            "text": [
              message
            ]
          }
        }
      ]
    }.to_json
  end