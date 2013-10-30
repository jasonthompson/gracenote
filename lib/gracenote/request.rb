module Gracenote
  class Request
    attr_reader :user, :query, :request_url, :response, :api

    def initialize(user, query, response, api)
      @user = user
      @query = query
      @response = response
      @api = api
      @request_url = "https://c#{user.client_id_tag}.web.cddbp.net/webapi/xml/1.0/"
    end

    def register
      resp = api.post(@request_url, query)
      resp = Response.check resp 
      user.user_id = resp['RESPONSES']['RESPONSE']['USER']
      return @user_id
    end

  end
end
