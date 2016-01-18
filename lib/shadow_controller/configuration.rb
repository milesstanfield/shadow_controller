module ShadowController
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :file_extensions

    def initialize
      @file_extensions = ["js", "html", "haml", "json"]
    end
  end
end