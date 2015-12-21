# Use +Draper+ to decorate resources in the HTML +DecentExposure+
# methods. Authorize all resources with +Pundit+ policies.
class ApplicationStrategy < DecentExposure::StrongParametersStrategy
  def collection_resource
    policy_scope super
  end

  def singular_resource
    super.tap do |model|
      authorize model
    end
  end

  def resource
    super.tap(&:decorate)
  end
end
