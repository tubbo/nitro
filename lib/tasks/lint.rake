begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new :lint
rescue LoadError
end
