json.extract! noticium, :id, :usuario_id, :titulo, :descripcion, :imagen, :tipo, :created_at, :updated_at
json.url noticium_url(noticium, format: :json)
