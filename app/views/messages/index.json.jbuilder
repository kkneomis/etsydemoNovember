json.array!(@messages) do |message|
  json.extract! message, :id, :name, :email, :content, :bname, :bcondition
  json.url message_url(message, format: :json)
end
