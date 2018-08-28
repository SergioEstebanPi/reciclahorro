json.extract! entrega, :id, :vecino_id, :recolector_id, :estado, :peso, :created_at, :updated_at
json.url entrega_url(entrega, format: :json)
