begin
  require 'yard'

  YARD::Rake::YardocTask.new 'doc:app'
rescue LoadError; end
