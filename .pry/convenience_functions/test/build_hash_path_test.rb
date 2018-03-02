require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative "../lib/#{File.basename(__FILE__).gsub(/_test.rb$/, '')}"

describe NathanUtility::BuildHashPath do
  describe '::[]' do
    let(:input) do
      {
        'apple' => 'APPLE',
        'john' => 'JOHN',
        'hash1' => {
          'banana' => 'BANANA',
          'jacob' => 'JACOB',
          'hash2' => {
            'citron' => 'CITRON',
            'jingle' => 'JINGLE',
            'hash3' => {
              'durian' => 'DURIAN',
              'heimer' => 'HEIMER',
              'hash4' => {
                'elderberry' => 'ELDERBERRY',
                'schmidt' => 'SCHMIDT',
              },
            },
          },
        },
      }
    end

    let(:expected) do
      [
        %w[apple],
        %w[john],
        %w[hash1 banana],
        %w[hash1 jacob],
        %w[hash1 hash2 citron],
        %w[hash1 hash2 jingle],
        %w[hash1 hash2 hash3 durian],
        %w[hash1 hash2 hash3 heimer],
        %w[hash1 hash2 hash3 hash4 elderberry],
        %w[hash1 hash2 hash3 hash4 schmidt],
      ]
    end

    it 'returns an array of arrays showing all hash keys' do
      output = NathanUtility::BuildHashPath[input]

      assert_equal expected.sort, output.sort
    end
  end
end
