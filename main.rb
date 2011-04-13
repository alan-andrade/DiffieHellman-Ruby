['key.rb', 'host.rb', 'primitive_root.rb', 'net.rb'].each do |file|
  require "./" + file
end

p = 19
g = primitive_root(p)

alice = Host.new('alice', p,g)
bob   = Host.new('bob', p,g)

# Creamos la red.

intranet = Net.new('udlap')
intranet.add(alice)
intranet.add(bob)

alice.send(bob, 'hola como estas')
p alice.key
p bob.key
#alice.send(bob, msg)
