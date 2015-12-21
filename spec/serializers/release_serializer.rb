require 'rails_helper'

RSpec.describe ReleaseSerializer, type: :serializer do
  let(:release) { releases :one }
  subject { described_class.new release }
end
