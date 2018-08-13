# Se tiene un array que contiene los números de una ruleta.
# Crear una clase llamada Roulette.
class Roulette
  def initialize(number)
    @r = (1..10).to_a
    @number = number.to_i
    @random = @r[rand(0..9)]
  end

  # Crear un método de instancia llamado play que reciba como argumento un número
  # al cual se está apostando. Luego debe tomar un valor -del array- al azar
  # y compararlo con el número al cual se apostó.
  def play
    @number == @random
  end

  # Crear un método de instancia que:
  # Debe almacenar el número generado al azar en un archivo llamado roulette_history.txt
  def save_numbers
    File.open('roulette_history.txt', 'a') { |f| f.puts @random }

    # Si el número al cual se apostó corresponde al generado al azar entonces, debe
    # además almacenar ese número en un archivo llamado winners.txt
    File.open('winners.txt', 'a') { |f| f.puts @number } if play
  end

  # Crear un método que lea el archivo rouletter_history.txt y retorne el valor
  # que más ha generado la ruleta históricamente.
  def most_repetitive
    f = File.read('roulette_history.txt').split("\n")
    grouped = f.group_by { |number| number }
    grouped.values.each { print |n| n.size }
  end

  def init
    play
    save_numbers
    most_repetitive
  end
end

first_attempt = Roulette.new(7)
first_attempt.init