require './lib/dh/rc4.rb'
require 'digest/sha1'
module DH
  class Message
    attr_reader :plaintext
    def initialize(msg)
      @plaintext  = msg
    end
    
    def cipher(key)
      insert_hash_in_msg
      encryptor = RC4.new(key.to_s)
      encryptor.encrypt(@plaintext)
    end
    
    def decypher(key)
      decryptor   = RC4.new(key.to_s)
      @plaintext  = decryptor.decrypt(@plaintext)
      if get_hash_from_msg == Digest::SHA1.hexdigest(@plaintext)
        return @plaintext
      else
        puts "\n\n******  TRUDY metio mano! el paquete no es autentico *****\n\n"
        return false
      end
    end
    
    private
    def insert_hash_in_msg
      #Hash using SHA1.
      digest  = Digest::SHA1.hexdigest(@plaintext)
      @plaintext  = digest + @plaintext
    end
    
    def get_hash_from_msg
      @plaintext.slice!(0..39)
    end
  end
end
