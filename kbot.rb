class KBot
    HOLA = {'es'=>'Hola', 'en' => 'Hello'}
    PUEDO_AYUDAR = {'es' => '¿Cómo te ayudo?', 'en' => 'How can I help you?'}

    def initialize(lang)
        @lang = lang
    end

    def saludar(nombre)
        hora = Time.now.hour
 
        case hora
        when (0..12) then
            momento = "Buen dia"
        when (13..18) then
            momento = "Buenas tardes"
        end
        puts "#{HOLA[@lang]} #{nombre}, #{PUEDO_AYUDAR[@lang]}"

#        puts "Hola, #{momento} #{nombre}!"
#        puts "Hola, #{nombre}!"
#        puts "Como te ayudo?"
    end    
end

kbot = KBot.new ARGV[1]
kbot.saludar ARGV[0]


#nombre = ARGV[0]
#puts "Hola, #{nombre}!"