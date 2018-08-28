json.extract! solicitud, :id, :titulo, :descripcion, :fecha_recoleccion, :usuario_id, :created_at, :updated_at
json.url solicitud_url(solicitud, format: :json)
