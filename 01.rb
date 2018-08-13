# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes de cada día.
# Hint: El constructor debe recibir 5 argumentos. Uno para el nombre de la mesa y los demás para cada recaudación correspondiente a esa mesa.
# Crear un método que permita leer el archivo e instanciar un objeto de la clase Table por cada línea del archivo.
# Crear métodos que permitan:
# Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día corresponde (día 1, día 2, día 3 o día 4).
# Calcular el promedio total de lo recaudado por todas las mesas en todos los días.
class Table
  def initialize (name, *days)
    @name = name
    @day1 = days[0].to_i
    @day2 = days[1].to_i
    @day3 = days[2].to_i
    @day4 = days[3].to_i
  end

  def max_by_table
    d = [@day1, @day2, @day3, @day4]
    d_max = d.max
    d_val = d.index(d_max) + 1
    print "Mayor recaudación por mesas\n"
    print "Mesa nombre #{@name}\n"
    print "Mayor recaudación día: #{d_val}, "
    print "Por un valor de: #{d_max}\n\n"
  end

  def average
    [@day1,@day2,@day3,@day4].sum / 4
  end

  def to_s
    "#{@name}: #{@day1}, #{@day1}, #{@day1}, #{@day1}, #{@day1}"
  end
end

def llama_tabla
  o = []
  f = File.read('casino.txt')
  f.split("\n").each do |line|
    campos = line.split(', ')
    o << Table.new(campos[0], campos[1], campos[2], campos[3], campos[4], campos[5])
  end
  o
end

t = llama_tabla

print "Recaudación por mesa\n"
t.each { |mesa| print mesa.max_by_table }

print "Promedio mesas\n"
ta = t.inject(0) { |suma, mesa| suma + mesa.average }
print ta / t.length
