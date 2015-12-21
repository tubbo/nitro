# Ensure that we use the HTTP cache in JSON API scenarios and return
# with Flash messages in the locale file.
class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
end
