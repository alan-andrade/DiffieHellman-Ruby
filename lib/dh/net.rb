class Net
  def initialize(name)
    @name = name
    @nodes  = {}
  end
  
  def add(host)
    name_of_host  = host.name
    @nodes[name_of_host.to_sym] = host
    host.connect_to_network(self)
  end
  
  def find_host(host)
    @nodes[host.name.to_sym]
  end
end
