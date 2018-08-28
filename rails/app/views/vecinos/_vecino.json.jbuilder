json.extract! vecino, :id, :documento, :nombres, :apellidos, :fecha_nacimiento, :usuario_id, :created_at, :updated_at
json.url vecino_url(vecino, format: :json)
