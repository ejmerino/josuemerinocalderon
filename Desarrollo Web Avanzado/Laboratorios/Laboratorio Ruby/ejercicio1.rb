=begin 
    1.- Crear una clase Vehículo con atributos marca y modelo y métodos para mostrar la marca y el modelo del vehículo 
=end

class Vehicle
    def initialize(marca, modelo)
        @marca = marca
        @modelo = modelo
    end

    def mostrar
        puts "Marca: #{@marca}"
        puts "Modelo: #{@modelo}"
    end

end

vehicle = Vehicle.new("Hyundai","Tucson")
vehicle.mostrar