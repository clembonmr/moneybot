require 'rest-client'
require 'json'
require 'uri'


class TestApi

  def initialize
    @client_id = ENV['DBS_CUSTOMER_CLIENT_ID']
    @client_secret = ENV['DBS_CUSTOMER_CLIENT_SECRET']
  end

  def dbs_auth_url
    # generating authorization URL

    redirect_url = URI.encode_www_form_component("http://0.0.0.0:3000/operations")
    url_auth = "https://www.dbs.com/sandbox/api/sg/v1/oauth/authorize?client_id=#{@client_id}&redirect_uri=#{redirect_url}&scope=Read&response_type=code&state=0399"
    return url_auth
  end


  def generate_access_token(auth_code)
    response = RestClient::Request.execute({
      method: :post,
      url: 'https://www.dbs.com/sandbox/api/sg/v1/oauth/tokens',
      payload: {code: auth_code,
      redirect_uri: URI.encode_www_form_component("http://0.0.0.0:3000/operations"),
      grant_type: 'token'},
      headers: {
        Authorization: "Basic #{encode64(@client_id,@client_secret)}"
      }
      })
  end

  private

  def encode64(client_id, client_secret)
    Base64.encode64("#{client_id}:#{client_secret}")
  end

end

