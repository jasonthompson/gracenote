module Gracenote
  class User
    attr_reader :client_id, :client_tag, :user_id, :client_id_tag

    def initialize(spec)
      if(spec[:client_id].nil? || spec[:client_id] == "") 
        raise "client_id cannot be nil"
      end
      if(spec[:client_tag].nil? || spec[:client_tag] == "")
        raise "client_tag cannot be nil"
      end

      @client_id = spec[:client_id]
      @client_tag = spec[:client_tag]
      @user_id = spec[:user_id].nil? ? nil : spec[:user_id]
      @client_id_tag = @client_id + "-" + @client_tag
    end
  end
end
