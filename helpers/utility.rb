def give_response(response_code, response_message, response_data = '')
  render json: {
      response_code: response_code,
      response_message: response_message,
      response_data: response_data
  }, status: 200
end

def create_hash(value)
  Digest::SHA1.hexdigest value
end
