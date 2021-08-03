class Factura
    IMPUESTOESTADO = {'UT'=> 6.85, 'NV' => 8.0, 'TX' => 6.25, 'AL' => 4.00, 'CA' => 8.25}
    #DESCUENTO = {1000 => 3, 5000 => 5}

    @@qty = 0
    @@punit = 0

    def initialize(estado)
        @estado = estado
       end

    def cantidad(cant)
        @@qty = cant.to_f
        puts "Cantidad: #{@@qty}"
      # puts "#{HOLA[@lang]} #{nombre}, #{PUEDO_AYUDAR[@lang]}"
    end

    def preciounitario(preciouni)
        @@punit = preciouni.to_f
        puts "Precio Unitario: #{@@punit}"    
    end

    def facturar
        costo = @@qty * @@punit
        costoImp = costo*IMPUESTOESTADO[@estado]/100
        costototal = costo + costoImp
        
        descuento = 0
        case costototal
        when (1000..4999) then descuento = 3
        when (5000..6999) then descuento = 5
        when (7000..9999) then descuento = 7
        when (10000..49999) then descuento = 10
        when (50000..1009999) then descuento = 15
        end
        
        descu = costototal * descuento/100
        costototal = costototal - descu
        #costo = 123
        #puts "Impuesto Estado: #{IMPUESTOESTADO[@estado]} | Costo: #{costo} | Costo con Imp: #{costototal} " 
        puts "Impuesto Estado [%]: #{IMPUESTOESTADO[@estado]}" 
        puts "Descuento [%]: #{descuento}" 
        puts "Costo: #{costo} | Costo con Imp: #{costoImp} | Descuento: #{descu}"
        puts "Costo Total: #{costototal}"

        puts "---------------------------------------------------------"
        puts "Cantidad | Precio c/u | Tasa  | Descuento |  Costo Total"
        puts "#{@@qty}      | #{@@punit}      | #{costoImp}  | #{descu}    | #{costototal}"

    end

end

factura = Factura.new ARGV[2]
factura.cantidad ARGV[0]
factura.preciounitario ARGV[1]
factura.facturar

