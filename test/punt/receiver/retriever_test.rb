require 'punt/receiver/retriever'
require 'minitest/autorun'
require 'minitest/pride'

describe "it gathers all the repos" do
  before do
    @output = StringIO.new
    @config = Minitest::Mock.new
    @octokit = Minitest::Mock.new
    @octokit_client = Minitest::Mock.new
  end

  describe "#retrieve_pull_requests" do
    it "outputs pull requests" do
      @config.expect(:github_token,"a-token")
      @octokit.expect(:new, @octokit_client,[{:access_token => "a-token"}])
      @retriever = Punt::Receiver::Retriever.new(@config, @octokit)

      @config.expect(:relevant_repos,["rails/rails"],[])
      @octokit_client.expect(:pull_requests, [{title: "A nice pr",
                                               user: {login: "johndoe"},
                                               created_at: "2010-01-01T00:00:00 UTC",
                                               html_url: "https://github.com/a-nice-pr/url"}], ["rails/rails"])


      buffer = StringIO.new
      @retriever.retrieve_pull_requests(buffer)

      buffer.string.must_equal "A nice pr\tjohndoe\t2010-01-01T00:00:00 UTC\thttps://github.com/a-nice-pr/url\n"
      
      assert @config.verify
      assert @octokit.verify
      assert @octokit_client.verify
    end
  end
end
