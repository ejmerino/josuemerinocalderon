=begin 
    3.- Crear una clase Motocicleta que hereda de la clase Vehículo y tiene un atributo cilindrada 
    y un método para mostrar la cilindrada de la motocicleta.
=end

class Vehiculo
    def initialize(marca, modelo)
        @marca = marca
        @modelo = modelo
    end

    def mostrar
        puts "Marca: #{@marca}"
        puts "Modelo: #{@modelo}"
    end

end 

class Moto < Vehiculo
    def initialize(marca, modelo, cilindrada)
        super(marca,modelo)
        @cilindrada = cilindrada
    end

    def mostrar_cilindrada
        puts "El cilindrada de la moto #{@marca} #{@modelo} es #{@cilindrada}"
    end
end

Moto = Moto.new("Yamaha", "R7", "321 cc")
Moto.mostrar_cilindrada