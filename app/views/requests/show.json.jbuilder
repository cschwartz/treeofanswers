json.description @request.description
json.text @request.user.email
json.icon status_for @request
json.nodes @request.responses do |response|
  json.partial!(response, response: response)
end unless @request.responses.empty?
