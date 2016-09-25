json.extract! ad, :id, :title, :body, :book_title, :edition, :author, :subject, :isbn, :price, :picture, :user_id, :created_at, :updated_at
json.url ad_url(ad, format: :json)