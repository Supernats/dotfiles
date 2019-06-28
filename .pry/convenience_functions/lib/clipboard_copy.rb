module NathanUtility
  module ClipboardCopy
    def call(string)
      # pbcopy is only a thing on OSX
      return 0 unless `uname` =~ /darwin/i

      IO.popen('pbcopy', 'w') { |f| f.write(string) }
    end

    alias_method :[], :call
    module_function :call, :[]
  end
end
