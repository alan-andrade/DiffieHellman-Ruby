class Host
  attr_reader :key, :name
  def initialize(name='alice',p,g)
    @name = name
    @key  = Key.new(p,g)
  end
  
  def connect_to_network(network)
    @network  = network
  end
  
  def send(host,msg)
    @connection ||= connect_with_host(host)
    receiver  = @network.find_host(host)
    receiver.receive(msg)
  end
  
  def receive(msg)
    p "I: #{self.name}, received: #{msg}"
  end
  
  def connect_with_host(host)
    self.key.shared_key(host.key.public)
    host.key.shared_key(self.key.public)
  end
end
