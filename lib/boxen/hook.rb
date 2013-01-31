module Boxen
  class Hook
    attr_reader :config
    attr_reader :checkout
    attr_reader :puppet
    attr_reader :result

    def self.all
      [
        Boxen::Hook::GitHubIssue,
        Boxen::Hook::Web
      ]
    end


    def initialize(config, checkout, puppet, result)
      @config   = config
      @checkout = checkout
      @puppet   = puppet
      @result   = result
    end

    def enabled?
      raise NotImplementedError
    end

    def run
      raise NotImplementedError
    end
  end
end

require "boxen/hook/github_issue"
require "boxen/hook/web"
