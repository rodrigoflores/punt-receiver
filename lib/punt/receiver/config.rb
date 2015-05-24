module Punt
  module Receiver
    class Config
      def initialize(config_file,env=ENV)
        @env = env
      end

      def github_token
        @env.fetch("GITHUB_TOKEN")
      end
    end
  end
end
