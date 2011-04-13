def primitive_root(p)
  raise "tu numero no es primo" unless p.primo?
  raices_primitivas = []
	g = 1 		# Primer guess de 'g'

	begin
		modulos_de_g = []
		g += 1
		(1..p-1).each do |potencia|
			potencia_g    =   g ** potencia
			modulo	      =   potencia_g % p
			modulos_de_g  <<  modulo
		end
		raices_primitivas.push(g) if modulos_de_g.uniq.size == p-1
	end while g < p
  random = rand(raices_primitivas.size)
  return raices_primitivas[ random ]
end

class Fixnum
	def primo?
		true
	end	
end
