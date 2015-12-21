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
    super.tap do |r|
      r.decorate
    end
  end
end
