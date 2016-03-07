json.text @request.description
json.nodes @request.responses do |response|
  json.partial!(response, response: response)
end unless @request.responses.empty?
