require 'yaml'

module Punt
  module Receiver
    class Config
      def initialize(config_file,env=ENV,yaml=YAML)
        @env = env
        @yaml = yaml
      end

      def github_token
        @env.fetch("GITHUB_TOKEN")
      end

      def relevant_repos
        file_name = @env.fetch("PR_REPOS_FILE")
        @yaml.load_file(file_name)["repos"]
      end
    end
  end
end
