require_relative '../spec_helper'
require 'ostruct'
require 'ox'

describe Gracenote::QueryBuilder do
  before do
  @user = OpenStruct.new(:client_id => "12524",
                         :client_tag => "23252454",
                         :user_id => "adf2352")
  end
  subject{Gracenote::QueryBuilder.new(@user)}

  def load_sample(filename, user)
    file = File.expand_path(filename, __FILE__) 
    sample = Ox.parse(File.open(file, "r"){|f| f.read})
    sample.auth.user << user.user_id
    sample.auth.client << user.client_id
    sample
  end

  it "returns xml query" do
    subject.register.must_equal "<queries><query CMD=\"REGISTER\"><client>12524</client></query></queries>"
  end

  describe "#album_search" do
    it "creates xml for album search" do
      search_params = {artist: "flying lotus",
                       album_title: "until the quiet comes",
                       track_title: "all in"}
      subject_xml = Ox.parse(subject.album_search(search_params))
      subject_xml.nodes[2].nodes[0].text.must_equal 'flying lotus'
      subject_xml.nodes[2].nodes[1].text.must_equal 'until the quiet comes'
    end
  end
end
