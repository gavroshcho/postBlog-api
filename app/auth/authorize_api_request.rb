class AuthorizeApiRequest
  BEARER = 'Bearer'.freeze

  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return unless headers['Authorization'].present?

    type, token = headers['Authorization'].split(' ')

    if token.present? && type == BEARER
      return token
    else errors.add(:token, 'Missing token')
    end
    nil
  end
end
