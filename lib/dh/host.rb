class Host
  attr_reader :name
  attr_accessor :key, :handshake
  def initialize(name='alice')
    @name = name
    @key  = nil
  end
  
  def connect_to_network(network)
    @network  = network
  end
  
  def send(guest,msg)    
    @network.send(self,guest,msg)    
  end
  
  def receive(msg)
    msg = DH::Message.new(msg)
    puts "#{self.name} recibio: #{msg.plaintext}"
    msg.decypher(self.key.shared)
    puts "\n#{self.name} descifro: #{msg.plaintext}\n"
  end

end
