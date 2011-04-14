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
      receiver.receive(msg)
    end
  end
  
  def receive(msg)
    p "#{self.name} received: #{msg}"
  end

#  Estos metodos se reemplazaron con DH::Handshake  
#  def connect_with_host(host)
#    self.key.shared_key(host.key.public)
#    host.key.shared_key(self.key.public)
#  end
end
