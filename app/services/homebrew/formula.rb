module Homebrew
  class Formula
    attr_reader :name
    attr_reader :tap
    attr_reader :attributes

    def initialize(tap: Tap.new, name: '')
      @tap = tap
      @name = name
    end

    def self.find(project)
      new tap: project.tap, name: project.name
    end

    def persisted?
      tap.include? name
    end

    def update(params = {})
      params.all? do |key, value|
        self.source[key] = value
      end && save
    end

    def save
      valid? && write
    end

    private

    def write
      tap.update name, file_name, source.to_rb
    end

    def source
      @source ||= Source.find tap, file_name
    end
  end
end
