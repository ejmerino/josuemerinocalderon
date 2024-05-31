=begin
    4.- Crear una clase Camión que hereda de la clase Vehículo y tiene un atributo carga y un método para mostrar la carga del camión.
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

class Camion < Vehiculo
    def initialize(marca, modelo, carga)
        super(marca,modelo)
        @carga = carga
    end

    def mostrar_carga
        puts "La carga del Camion #{@marca} #{@modelo} es #{@carga}"
    end
end

Camion = Camion.new("Volvo", "FH16", "25 toneladas")
Camion.mostrar_carga