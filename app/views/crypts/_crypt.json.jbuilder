json.extract! crypt, :id, :symbol, :user_id, :cost_per, :amount_owned, :created_at, :updated_at
json.url crypt_url(crypt, format: :json)
