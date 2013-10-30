require 'crack'

module Gracenote
  class Response
    def self.check(resp)
      if resp.code.to_s != '200'
        raise "Problem!! Got #{resp.code} with #{resp.message}"
      end
      json = nil
      begin
        json = Crack::XML.parse resp.body
      rescue Exception => e
        raise e
      end

      status = json['RESPONSES']['RESPONSE']['STATUS'].to_s
      case status
      when "ERROR"
        raise "ERROR in response"
      when "NO_MATCH"
        raise "No match found"
      else
        if status != "OK"
          raise "Problems found in the response"
        end
      end
      return json
    end
  end
end
