Rails.application.config.generators do |g|
  g.test_framework :rspec, fixtures: true, fixture_location: "spec/fixtures"
  g.javascripts :es6
end
