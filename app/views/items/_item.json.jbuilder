json.extract! item, :id, :filename, :filetype, :fileformat, :filesize, :dimensions, :content_description, :content_keywords, :file_date_created, :created_at, :updated_at
json.url item_url(item, format: :json)
