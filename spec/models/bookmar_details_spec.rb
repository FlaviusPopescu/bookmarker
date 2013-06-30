require 'spec_helper_lite'
needs 'models'
require 'bookmark_details'

describe BookmarkDetails do

  let(:host_and_path) { 'trial.somewebsite.ro/smth/else/goes?here=123' }

  context 'with protocol' do
    subject { described_class.new("https://#{host_and_path}") }

    it 'parses protocol' do
      expect(subject.protocol).to eq('https')
    end

    it 'parses host' do
      expect(subject.host).to eq('trial.somewebsite.ro')
    end

    it 'parses path' do
      expect(subject.path).to eq('smth/else/goes?here=123')
    end

  end

  context 'withouth protocol' do
    subject { described_class.new(host_and_path) }

    it 'gets a default protocol' do
      expect(subject.protocol).to eq('http')
    end

    it 'parses host' do
      expect(subject.host).to eq('trial.somewebsite.ro')
    end

    it 'parses path' do
      expect(subject.path).to eq('smth/else/goes?here=123')
    end

  end

end
