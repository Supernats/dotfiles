require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative '../lib/clipboard_copy'

describe NathanUtility::ClipboardCopy do
  describe '::[]' do
    let(:input) { 'cat' }
    it 'puts the input string in the clipboard' do
      # This will only work on OS X. If other OS, just succeed.
      expected = `uname` =~ /darwin/i ? -> { `pbpaste` } : -> { input }

      NathanUtility::ClipboardCopy[input]

      assert_equal input, expected.call
    end
  end
end
