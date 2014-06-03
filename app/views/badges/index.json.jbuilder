json.array!(@badges) do |badge|
  json.extract! badge, :id, :name, :company, :email
  json.url badge_url(badge, format: :json)
end
