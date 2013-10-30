require_relative '../spec_helper'
require 'ostruct'

describe Gracenote::Request do
  before do
    @response = Object.new
    @api = Minitest::Mock.new
    @api.expect(:post, @response, [user.client_id_tag])
  end

  let(:user){OpenStruct.new(:client_id => '124545',
                            :client_tag => '454566644',
                            :client_id_tag => "124545-545666")}
  let(:query){"<hello><world></world></hello>"}
  subject{Gracenote::Request.new(user, query, @response, @api)}

  describe "#register" do
    it "sends a request query and url to http" do
      http = Minitest::Mock.new
      http.expect(:post, @response, ["http://some.url.com", query])
      subject.register
      http.verify
    end
  end
end
