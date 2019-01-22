# frozen_string_literal: true

require 'json'

def give_response(response_code, response_message, response_data = '')
  response = {
    response_code: response_code,
    response_message: response_message,
    response_data: response_data
  }
  status = if response_code == '00'
             'success'
           else
             'failed'
           end
  create_log(response.to_json, status)
  render json: response, status: 200
end

def create_hash(value)
  Digest::SHA1.hexdigest value
end
