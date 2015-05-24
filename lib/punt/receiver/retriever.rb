module Punt
  module Receiver
    class Retriever
      def initialize(config)
        @config = config
        @client = Octokit::Client.new(:access_token => @config.github_token)
      end

      def retrieve_pull_requests
        @config.relevant_repos.each do |repo|
          prs = @client.pull_requests(repo)
          prs.each do |pr|
            puts "#{pr[:title]} - #{pr[:user][:login]} - #{pr[:created_at]} - #{pr[:url]}"
          end
        end
      end
    end
  end
end
