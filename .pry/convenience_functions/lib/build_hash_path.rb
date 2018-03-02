# frozen_string_literal: true

module NathanUtility
  class BuildHashPath
    class << self
      def call(hash)
        new(hash).call
      end

      alias_method :[], :call
    end

    def initialize(hash)
      @hash = hash
    end

    def call
      crawl(hash)

      paths
    end

    private

    attr_reader :hash

    def paths
      @paths ||= []
    end

    def crawl(node, path = [])
      case node
      when Hash
        node.each { |key, value| crawl(value, path + [key]) }
      else
        paths << path
      end
    end
  end
end
