module NathanUtility
  module EvalPaste
    def call
      # pbpaste is only a thing on OSX
      return 0 unless `uname` =~ /darwin/i
    end

    alias_method :[], :call
    module_function :call, :[]
  end
end
