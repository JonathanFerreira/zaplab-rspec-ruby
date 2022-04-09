class Calculadora
  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
  end

  def soma
    num1 + num2
  end

  def subtrair
    num1 - num2
  end

  def multiplica
    num1 * num2
  end

  def dividir
    num1 / num2
  rescue ZeroDivisionError
    'Impossivel dividir por zero'
  end

  private

  attr_accessor :num1, :num2
end
