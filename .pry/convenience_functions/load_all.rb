Dir.entries(File.dirname(__FILE__)).each do |file|
  next unless File.extname(file) == '.rb'
  next if file =~ /#{Regexp.quote(File.basename(__FILE__))}/

  require_relative File.basename(file, File.extname(file))
end
