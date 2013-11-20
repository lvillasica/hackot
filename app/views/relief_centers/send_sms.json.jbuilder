result = @result[:result]

json.result result.each do |res|
    json.result res[:result]
    json.message res[:message]
end