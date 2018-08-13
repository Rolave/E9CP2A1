require 'date'
class Course
  def initialize(name, start_date, end_date)
    @name = name
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end

  # Ambos metodos deben levantar una excepcion si la fecha >= 2019-01-01.
  # Saber que cursos comienzan previo a una fecha entregada como argumento.
  def upcomming_courses(date)
    raise "Esta es una excepción" if date >= Date.parse('2019-01-01')
    @start_date > date ? "El curso #{@name} empieza próximamente." : "El curso #{@name} ya empezó."
  end

  # Saber qué cursos finalizan posterior a una fecha entregada como argumento.
  def ending_courses(date)
    @end_date > date ? "El curso #{@name} termina próximamente." : "El curso #{@name} aún no empieza."
  end
end

def llama_curso
  o = []
  f = File.read('cursos.txt')
  f.split("\n").each do |line|
    campos = line.split(', ')
    o << Course.new(campos[0], campos[1], campos[2])
  end
  o
end

t = llama_curso
current_date = Date.today
# print llama_curso
print t.each { |curso| puts curso.upcomming_courses(current_date) }
print t.each { |curso| puts curso.ending_courses(current_date) }
