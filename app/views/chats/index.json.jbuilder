json.array!(@chats) do |chat|
  json.extract! chat, :id, :name, :comment
  json.url chat_url(chat, format: :json)
end
