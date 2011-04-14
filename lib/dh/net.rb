class Net
  def initialize(name)
    @name = name
    @nodes  = {}
  end
  
  def add(host)    
    @nodes[host.name.to_sym] = host
    host.connect_to_network(self)
    puts "Conectado a la red: #{host.name}"
  end
  
  def find_host(host)
    if host.is_a?(Symbol)
      @nodes[host]
    else
      @nodes[host.name.to_sym]
    end
  end
  
  def send(host,guest,msg)
    # Existe el nodo al que se quiere enviar el msg?        
    receiver = find_host(guest)
    trudy    = find_host(:trudy) #Trudy esta conectado!
    if receiver
      #Do the Handshake
      DH::Handshake.new(host,receiver) if (host.handshake.nil? and guest.handshake.nil?)
      msg = DH::Message.new(msg)
      msg = msg.cipher(host.key.shared)
      puts "\n#{host.name} envio: #{msg} \n\n"
      if trudy
        # hacer un ataque.
        msg = trudy.attack(msg)
      end
      receiver.receive(msg)
    else
      puts "\n\n El nodo al que quieres enviar informacion no esta conectado a esta red \n\n"
    end
  end
  
  def receive(host,msg)
    msg = DH::Message.new(msg)
    puts "#{host.name} recibio: #{msg.plaintext}"
    msg.decypher(host.key.shared)
    puts "\n#{host.name} descifro: #{msg.plaintext}\n"
  end

end
