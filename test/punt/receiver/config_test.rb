require "minitest/autorun"
require 'minitest/mock'
require "punt/receiver/config" 

describe Punt::Receiver::Config do
  before do
    @mock = MiniTest::Mock.new
    @config = Punt::Receiver::Config.new("a",@mock)
  end

  
  it "gets the github token data" do
    @mock.expect(:fetch,"a-gh-token",["GITHUB_TOKEN"])
    @config.github_token.must_equal "a-gh-token"
  end
end
