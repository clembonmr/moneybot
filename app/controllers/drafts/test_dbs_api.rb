require 'rest-client'
require 'json'


class TestApi
  def auth_end_user
    @client_id = ENV['DBS_CUSTOMER_CLIENT_ID']
    url_auth = "https://www.dbs.com/sandbox/api/sg/v1/oauth/authorize?client_id=#{@client_id}&redirect_uri=http%3A%2F%2F0.0.0.0%3A3000%2Foperations&scope=Read&response_type=code&state=0399"

    return url_auth
    # response = RestClient::Request.execute(
    # method: :get,
    # url: url_auth
    # )

  end
end
