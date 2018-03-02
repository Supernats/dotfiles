# frozen_string_literal: true

LIB_DIR_STRING = 'lib'
Dir.entries(File.join(File.dirname(__FILE__), LIB_DIR_STRING)).each do |file|
  next unless File.extname(file) == '.rb'

  require_relative "lib/#{File.basename(file, File.extname(LIB_DIR_STRING))}"
end
