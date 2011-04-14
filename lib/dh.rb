['key.rb', 'host.rb', 'primitive_root.rb', 'net.rb', 'handshake.rb', 'message.rb'].each do |file|
  require "./lib/dh/" + file
end
