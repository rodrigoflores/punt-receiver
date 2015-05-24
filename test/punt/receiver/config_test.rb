require "minitest/autorun"
require 'minitest/mock'
require "punt/receiver/config" 

describe Punt::Receiver::Config do
  before do
    @mock_env = MiniTest::Mock.new
    @mock_yaml = MiniTest::Mock.new
    @config = Punt::Receiver::Config.new("a",@mock_env,@mock_yaml)
  end

  it "gets the github token data" do
    @mock_env.expect(:fetch,"a-gh-token",["GITHUB_TOKEN"])
    @config.github_token.must_equal "a-gh-token"
    assert @mock_env.verify
  end

  it "gets the relevant repos" do
    @mock_env.expect(:fetch,"a-file.yaml", ["PR_REPOS_FILE"])
    @mock_yaml.expect(:load_file,{"repos" => ["rails/rails"]},["a-file.yaml"])
    @config.relevant_repos.must_equal ["rails/rails"]
    assert @mock_env.verify
    assert @mock_yaml.verify
  end
end
