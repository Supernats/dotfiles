require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative '../lib/clipboard_copy'

describe NathanUtility::ClipboardCopy do
  describe '::[]' do
    let(:input) { 'cat' }
    it 'puts the input string in the clipboard' do
      NathanUtility::ClipboardCopy[input]

      assert_equal input, `pbpaste`
    end
  end
end
