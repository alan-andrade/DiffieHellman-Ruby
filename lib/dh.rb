['key.rb', 'host.rb', 'primitive_root.rb', 'net.rb'].each do |file|
  require "./lib/dh/" + file
end
require 'rc4.rb'