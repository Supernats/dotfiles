module NathanUtility
  module HarvestHashKeys
    def call(hash)
      values = hash.values
      return values if values.none? { |v| v.respond_to?(:keys) }
      hashes, non_hash_values = values.partition { |v| v.respond_to?(:keys) }
      (non_hash_values + hashes.map { |h| call(h) }).flatten
    end

    alias_method :[], :call

    module_function :call, :[]
  end
end
