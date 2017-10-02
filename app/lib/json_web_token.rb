# frozen_string_literal: true

class JSONWebToken
  class << self
    # Generate a JWT token
    #
    # @param payload [Hash] Payload for the encoding
    # @param exp [ActiveSupport::TimeWithZone] Token expiration time
    #
    # @return [String]
    def encode(payload, exp=24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end

    # Decode provided JWT token
    #
    # @param token [String] JWT token
    #
    # @return [Hash]
    def decode(token)
      body = JWT.decode(
        token,
        Rails.application.secrets.secret_key_base,
        true,
        algorithm: 'HS256'
      )[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
