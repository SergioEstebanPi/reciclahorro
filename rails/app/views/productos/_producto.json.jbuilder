json.extract! producto, :id, :tipoproducto_id, :nombre, :descripcion, :precio, :created_at, :updated_at
json.url producto_url(producto, format: :json)
