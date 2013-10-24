require_relative '../spec_helper'

describe Gracenote do
  let(:spec){
    {
      user_id: '123456-A34566',
      client_id: '155524',
      client_tag: '1343241354'
    }
  }
  subject{Gracenote.new(spec)}

  it "must instantiate with spec" do
    subject.must_be_kind_of Gracenote
  end
end
