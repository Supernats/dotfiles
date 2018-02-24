module NathanUtility
  module ClipboardCopy
    def [](string)
      IO.popen('pbcopy', 'w') { |f| f.write(string) }
    end

    module_function :[]
  end
end
