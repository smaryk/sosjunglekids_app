json.array!(@newspost_attachments) do |newspost_attachment|
  json.extract! newspost_attachment, :newspost_id, :file
  json.url newspost_attachment_url(newspost_attachment, format: :json)
end