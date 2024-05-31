=begin
    5.- Crear una clase Transporte con métodos para mostrar la marca y el modelo de un vehículo genérico.
=end

module Mostrar
    def mostrar
        puts "Marca: #{@marca} "
        puts "Modelo: #{@modelo}"
    end
end 

class Transporte
    def initialize(marca, modelo)
        @marca = marca
        @modelo = modelo
    end
end

class Vehiculo < Transporte
    include Mostrar
end

vehiculo = Vehiculo.new("Hyundai", "Tucson")
vehiculo.mostrar