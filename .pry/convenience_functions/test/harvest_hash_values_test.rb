require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative "../lib/#{File.basename(__FILE__).gsub(/_test.rb$/, '')}"

describe NathanUtility::HarvestHashValues do
  describe '::[]' do
    let(:input) do
      {
        'john' => 'john',
        'hash1' => {
          'jacob' => 'jacob',
          'hash2' => {
            'jingle' => 'jingle',
            'hash3' => {
              'heimer' => 'heimer',
              'hash4' => {
                'schmidt' => 'schmidt',
              },
            },
          },
        },
      }
    end

    let(:expected) do
      %w[
        john
        jacob
        jingle
        heimer
        schmidt
      ]
    end

    it 'returns all non-hash values in given hash' do
      assert_equal expected.sort, NathanUtility::HarvestHashValues[input].sort
    end
  end
end
