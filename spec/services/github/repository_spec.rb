require 'rails_helper'

module Github
  RSpec.describe Repository, type: :service do
    let :user do
      double 'User', name: 'lester'
    end

    let :name do
      'tester'
    end

    subject { described_class }

    it 'can be found'
    it 'can be created'

    context 'with a given repo' do
      subject do
        described_class.new user: user, name: name
      end

      it 'is valid'
      it 'is persisted'
      it 'computes a path'
      it 'creates itself on github'
      it 'can be committed to'
    end
  end
end
