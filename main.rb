require './lib/dh.rb'

alice = Host.new('alice')
bob   = Host.new('bob')

# Creamos la red.

intranet = Net.new('udlap')
intranet.add(alice)
intranet.add(bob)

# cuando se realiza el envio de msg, se establece el handshake y se intercambian llaves
alice.send(bob, 'hola como estas')
