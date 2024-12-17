=begin 
    2.- Crear una clase Automóvil que hereda de la clase Vehículo y tiene un atributo color y un método para mostrar el color del automóvil.
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

class Automovil < Vehiculo
    def initialize(marca, modelo, color)
        super(marca,modelo)
        @color = color
    end

    def mostrar_color
        puts "El Color del automovil #{@marca} #{@modelo} es #{@color}"
    end
end

automovil = Automovil.new("Hyundai", "Tucson", "Rojo")
automovil.mostrar_color