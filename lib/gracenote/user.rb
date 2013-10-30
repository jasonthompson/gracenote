require 'gracenote/query_builder'
require 'gracenote/response'
require 'builder'

module Gracenote
  class User
    attr_reader :client_id, :client_tag, :user_id

    def initialize(args)
      validate_user_info args
      @client_id = args[:client_id]
      @client_tag = args[:client_tag]
      @user_id = args.fetch(:user_id, "")
      @client_id_tag = @client_id + "-" + @client_tag
    end

    def client_id_tag
      client_id + '-' + client_tag
    end

    def registered?
      user_id.length > 0
    end

    private

    def validate_user_info(user_info)
      if user_info[:client_id].length == 0
        raise MissingClientID, "client_id cannot be nil" 
      end

      if user_info[:client_tag].length == 0
        raise MissingClientTag, "client_tag cannot be nil"
      end
    end
  end

  class MissingClientID < ArgumentError
  end

  class MissingClientTag < ArgumentError
  end
end
