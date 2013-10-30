require_relative '../spec_helper'

describe Gracenote::QueryBuilder do
  it "returns xml query" do
    q = Gracenote::QueryBuilder.new
    q.register("12346").must_equal "blue"
  end
end
