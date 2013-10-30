require_relative '../spec_helper'

module Gracenote
  describe User do
    let(:user_info){
      {
       user_id: '123456-A34566',
       client_id: '155524',
       client_tag: '1343241354'
      }
    }
    let(:no_user_id){
      {
       client_id: '155524',
       client_tag: '1343241354'
      }
    }

    subject{User.new(user_info)}

    it 'must instantiate with complete spec' do
      subject.must_be_kind_of User
    end

    describe 'incomplete spec' do
      it 'must not instantiate without client_id' do
        incomplete_spec = {client_id: "", client_tag: "1234"}
        err = proc {User.new(incomplete_spec)}.must_raise MissingClientID
        err.message.must_equal 'client_id cannot be nil'
      end

      it 'must not instantiate without client_tag' do
        incomplete_spec = {client_id: "14342", client_tag: ""}
        err = proc {User.new(incomplete_spec)}.must_raise MissingClientTag
        err.message.must_equal 'client_tag cannot be nil'
      end
    end

    describe '#client_id_tag' do
      it 'must be correctly formatted' do
        subject.client_id_tag.must_equal '155524-1343241354'
      end
    end

    describe '#registered?' do
      it 'must be true when user is registered' do
        subject.registered?.must_equal true
      end
    end
  end
end
