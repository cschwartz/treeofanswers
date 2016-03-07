json.text :description
json.nodes response.children do |child|
  json.partial!(child, n: child)
end unless response.children.empty?
