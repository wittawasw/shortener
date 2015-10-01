RSpec::Matchers.define :match_response_serializer do |serializer, version|
  match do |body|
    serializer_directory = "#{Dir.pwd}/spec/serializers/schemas"
    serializer_path = "#{serializer_directory}/#{version}/#{serializer}.json"
    JSON::Validator.validate!(serializer_path, body, strict: true)
  end
end