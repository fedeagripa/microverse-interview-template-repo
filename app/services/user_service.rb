require 'rest-client'

module UserService
  URL = "https://microverse-api-app.herokuapp.com/users"
  TOKEN = 'fetch_your_api_key'
  LIMIT = 5

  def self.fetch(offset)
    response = RestClient.get(URL, { Authorization: TOKEN, params: { offset: offset, limit: LIMIT } })
    JSON.parse(response.body, { symbolize_names: true })
  end
end
