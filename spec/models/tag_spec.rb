require 'spec_helper'

describe Tag do

  context '.tokens' do

    let(:tag1) { double('tag1', id: '1', title: 'bookmark') }
    let(:tag2) { double( 'tag2', id: '2', title: 'book') }

    it 'retrieves tags when NO exact matching query' do
      tags = [tag1, tag2]
      described_class.stub(where: tags)

      expect(described_class.tokens('book')).to eq(tags)
    end

    it 'retrieves tags plus new tag hash when there is an exact match' do
      new_tag = { id: '<<<boo>>>', title: 'New: "boo"' }
      described_class.stub(where: [tag1, tag2])
      tags = [new_tag, tag1, tag2]

      expect(described_class.tokens('boo')).to eq(tags)
    end

  end

end
