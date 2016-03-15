json.text response.user.email
json.description response.description
json.icon status_for response
json.nodes response.children do |child|
  json.partial!(child, n: child)
end unless response.children.empty?
