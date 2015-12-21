require 'rails_helper'

module Github
  RSpec.describe Commit, type: :service do
    let :repo do
      double 'Repository'
    end

    let :msg do
      'message'
    end

    let :changes do
      { 'filename.txt' => 'new contents' }
    end

    let :params do
      {
        repository: repo,
        message: msg,
        changes: diff
      }
    end

    subject { described_class }

    it 'can be created' do
      expect(
        subject.create(params)
      ).to be_a Commit
    end

    context 'with a given commit' do
      subject do
        described_class.new(**params)
      end

      it 'is valid' do
        expect(subject).to be_valid
      end

      it 'can be saved' do
        expect(subject.save).to be true
        expect(subject).to be_persisted
      end
    end
  end
end
