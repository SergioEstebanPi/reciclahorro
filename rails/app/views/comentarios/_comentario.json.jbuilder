json.extract! comentario, :id, :usuario_id, :publicacion_id, :descripcion, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
