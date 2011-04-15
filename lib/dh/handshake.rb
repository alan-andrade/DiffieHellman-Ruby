module DH
  class Handshake
    def initialize(host1, host2)
      print "\n** Inicio de Handshake **\n"
      @hosts  = [host1,host2]
      prime = 353
      proot = primitive_root(prime)
      share_prime_and_proot(prime,proot)  # Se ponene de acuerdo para usar p y g.
      generate_private_keys               # Los nodos generan sus numero random.
      share_public_keys                   # Se comparten los numeros generados.
      generate_session_keys               # Cada nodo saca sus llaves de sesion.
      
      completed_handshake
      print "** Termina el Handshake **\n\n"
    end
    
    private
    
    def share_prime_and_proot(p,g)
      puts "#{@hosts.first.name} y #{@hosts.last.name} usaran p:#{p} , g: #{g}"
      @hosts.each{|host| host.key = DH::Key.new(p,g)  }
    end
    
    def generate_private_keys
      @hosts.each{|host| host.key.generate_secret_key }
    end
    
    def share_public_keys
      @hosts.each{ |host| puts "#{host.name} will be using public key: #{host.key.public}" }
    end
    
    def generate_session_keys
      @hosts.first.key.generate_shared_key(@hosts.last.key.public)
      @hosts.last.key.generate_shared_key(@hosts.first.key.public)
      puts "Llave de session: #{@hosts.first.key.shared}"
    end
    
    def completed_handshake
      @hosts.each{ |host| host.handshake = true }
    end
  end
end
