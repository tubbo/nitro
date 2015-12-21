require 'rails_helper'

RSpec.describe ProjectSerializer, type: :serializer do
  let(:project) { projects :org }
  subject { described_class.new project }

  it 'has a name'
  it 'has a user'
  it 'has an id'
end
