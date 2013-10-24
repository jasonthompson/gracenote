require_relative '../spec_helper'

describe Gracenote::User do
  let(:spec){
    {
      user_id: '123456-A34566',
      client_id: '155524',
      client_tag: '1343241354'
    }
  }
  subject{Gracenote::User.new(spec)}

  it "must instantiate with complete spec" do
    subject.must_be_kind_of Gracenote::User
  end

  describe "incomplete spec" do
    it "must not instantiate with incomplete user info" do
      incomplete_spec = {}
      err = proc {Gracenote::User.new(incomplete_spec)}.must_raise RuntimeError
      err.message.must_equal 'client_id cannot be nil'
    end
  end
end
