module DH
  class Key
    attr_reader :public, :shared
    def initialize(p,g)
      @p  =  p
      @g  =  g
      @private = nil
      @public  = nil
      @shared  = nil
    end
    
    def generate_secret_key
      @private ||= rand(@p-2)+2 # para que genere numeros del 2 a p-1.
      generate_public_key
    end

    def generate_public_key
      @public ||= (@g ** @private) % @p
    end

    def generate_shared_key(guest_public_key)
      # privada de alice ** publica de bob.
      @shared = ((guest_public_key ** @private) % @p)
    end
  end
end
