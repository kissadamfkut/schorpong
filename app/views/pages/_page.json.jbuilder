json.extract! page, :id, :title, :name, :content, :created_at, :updated_at
json.url page_url(page, format: :json)
