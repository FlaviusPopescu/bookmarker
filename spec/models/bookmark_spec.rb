require 'spec_helper'

describe Bookmark do

  let(:new_site) { Site.new }
  let(:site) { double 'site', id: 1, protocol: 'http', host: 'website.com', path: 'some/path' }
  subject { described_class.new(bookmark: 'http://website.com') }

  before { BookmarkDetails.stub(:new).with('http://website.com').and_return(site) }

  it 'finds or creates a site' do
    Site.should_receive(:find_or_create_by!).with(host: 'website.com', protocol: 'http').and_return(new_site)

    expect(subject.send(:find_or_create_site)).to eq(new_site)
  end

  it 'sets path' do
    expect(subject.send(:set_path)).to eq('some/path')
  end

end
