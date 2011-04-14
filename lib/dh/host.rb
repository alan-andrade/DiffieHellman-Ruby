class Host
  attr_reader :name
  attr_accessor :key
  def initialize(name='alice')
    @name = name
    @key  = nil
  end
  
  def connect_to_network(network)
    @network  = network
  end
  
  def send(guest,msg)
    
    # Existe el nodo al que se quiere enviar el msg?        
    receiver = @network.find_host(guest)
    
    if receiver
      #Do the Handshake
      DH::Handshake.new(self,receiver)
      msg = DH::Message.new(msg)
      msg = msg.cipher(self.key.shared)
      p "#{self.name} sent: #{msg}"
      receiver.receive(msg)
    end
  end
  
  def receive(msg)
    msg = DH::Message.new(msg)
    msg.decypher(self.key.shared)
    p "#{self.name} received: #{msg.plaintext}"
  end

end
