require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:quote) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:author_about) }
    it { should validate_presence_of(:tags) }
  end

  describe 'scopes' do
    describe '.tags_exist?' do
      let!(:quote1) { create(:quote, tags: ['tag1', 'tag2']) }
      let!(:quote2) { create(:quote, tags: ['tag2', 'tag3']) }

      it 'returns quotes that have the specified tag' do
        quotes = Quote.tags_exist?('tag1')
        expect(quotes).to include(quote1)
        expect(quotes).not_to include(quote2)
      end
    end

    describe '.search_tag' do
      let!(:quote1) { create(:quote, tags: ['tag1', 'tag2']) }
      let!(:quote2) { create(:quote, tags: ['tag2', 'tag3']) }

      it 'returns quotes that have the specified tag' do
        quotes = Quote.search_tag('tag2')
        expect(quotes).to include(quote1, quote2)
      end
    end
  end
end