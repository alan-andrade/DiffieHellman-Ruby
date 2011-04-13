class Key
  attr_reader :public
  def initialize(p,g)
    @p  =  p
    @g  =  g
    @private = secret_key
    @public  = public_key
    @shared  =  nil
  end
  
  def secret_key
    #print "\n Generating secret key \n"
    @private ||= rand(@p-2)+2 # para que genere numeros del 2 a p-1.
  end

  def public_key
    #print "\n Generating public key \n"
    (@g ** @private) % @p
  end

  def shared_key(guest_public_key)
    # privada de alice ** publica de bob.
    @shared = ((guest_public_key ** @private) % @p)
  end
end
