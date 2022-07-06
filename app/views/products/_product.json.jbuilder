json.extract! product, :id, :name, :title, :discription, :price, :image_path, :company_id, :created_at, :updated_at
json.url product_url(product, format: :json)
