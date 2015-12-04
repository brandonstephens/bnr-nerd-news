json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :commentalbe_id, :commentalbe_type, :body
  json.url comment_url(comment, format: :json)
end
