require 'rails_helper'

module Github
  RSpec.describe User, type: :service do
    let :user do
      users :tubbo
    end

    subject do
      described_class.new name: user.name
    end

    it 'finds a github user by that name'
    it 'is not valid unless user is found'
  end
end
