begin
  require 'rspec/core/rake_task'

  namespace :test do
    desc ''
    RSpec::Core::RakeTask.new :all

    desc 'Run all unit tests'
    RSpec::Core::RakeTask.new :units do |t|
      folders = %w(
        controllers decorators helpers jobs mailers
        models policies serializers services
      ).join(',')
      t.pattern = "spec/{#{folders}}/**/*_spec.rb"
    end

    desc 'Run all feature tests'
    RSpec::Core::RakeTask.new :features do |t|
      t.pattern = 'spec/features/**/*_spec.rb'
    end
  end

  desc 'Run all tests'
  task test: %w(test:all)
end
