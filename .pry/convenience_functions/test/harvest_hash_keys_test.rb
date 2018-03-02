require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative '../lib/harvest_hash_keys'

describe NathanUtility::HarvestHashKeys do
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
      assert_equal expected.sort, NathanUtility::HarvestHashKeys[input].sort
    end
  end
end
