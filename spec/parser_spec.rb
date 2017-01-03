require "spec_helper"
require "parser.rb"

describe RootDriving::Parser do
  let(:testInput) { File.read(File.expand_path("../../test_input.txt", __FILE__)) }

  describe 'parse' do
    it 'properly parses' do
      expect(described_class.parse(testInput)).to eq("test")
    end
  end
end
