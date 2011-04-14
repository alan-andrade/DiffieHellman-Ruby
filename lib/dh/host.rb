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
    @network.receive(self,msg)
  end

end
