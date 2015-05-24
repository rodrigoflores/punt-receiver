require 'octokit'

module Punt
  module Receiver
    class Retriever
      def initialize(config,octokit_client=Octokit::Client)
        @config = config
        @client = octokit_client.new(:access_token => @config.github_token)
      end

      def retrieve_pull_requests(output=$stdout)
        @config.relevant_repos.each do |repo|
          prs = @client.pull_requests(repo)
          prs.each do |pr|
            output.puts "#{pr[:title]}\t#{pr[:user][:login]}\t#{pr[:created_at]}\t#{pr[:html_url]}"
          end
        end
      end
    end
  end
end
