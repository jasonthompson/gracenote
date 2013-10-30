require 'builder'

module Gracenote
  class QueryBuilder
    attr_accessor :xml
    attr_reader :builder, :user

    def initialize(user)
      @xml = ""
      @builder = Builder::XmlMarkup.new(target: @xml)
      @user = user
    end

    def register
      builder.queries {
        builder.query('CMD' => 'REGISTER'){
          builder.client user.client_id
          }
      }
      xml
    end

    def album_search(params)
      builder.queries {
        builder.lang "eng"
        builder.auth {
          builder.client user.client_id
          builder.user user.user_id
          }
        builder.query(cmd: "ALBUM_SEARCH"){
          builder.text(params[:artist], type: "ARTIST")
          builder.text(params[:album_title], type: "ALBUM_TITLE")
          builder.text(params[:track_title], type: "TRACK_TITLE")
          }
        }
      end
  end
end
