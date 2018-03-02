module NathanUtility
  module ClipboardCopy
    def call(string)
      IO.popen('pbcopy', 'w') { |f| f.write(string) }
    end

    alias_method :[], :call
    module_function :call, :[]
  end
end
