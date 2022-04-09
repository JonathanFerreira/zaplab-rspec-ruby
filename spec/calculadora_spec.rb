require './calculadora'

RSpec.describe Calculadora do
  subject { Calculadora.new(10, 5) }

  describe '#new' do
    it 'inicializa uma instancia da classe calculadora' do
      expect(subject).to be_instance_of Calculadora
    end
  end

  describe '#soma' do
    it 'soma dois numeros' do
      expect(subject.soma).to eq 15
    end
  end

  describe '#subtrair' do
    it 'subtrai dois numeros' do
      expect(subject.subtrair).to eq 5
    end
  end

  describe '#multiplicar' do
    it 'multiplica dois numeros' do
      expect(subject.multiplica).to eq 50
    end
  end

  describe '#dividir' do
    context 'quando o divisor é diferente de zero' do
      it 'divide dois numeros' do
        expect(subject.dividir).to eq 2
      end
    end

    context 'quando o divisor é zero' do
      subject { Calculadora.new(10, 0) }

      it 'exibe mensagem de divisão impossivel' do
        expect(subject.dividir).to eq 'Impossivel dividir por zero'
      end
    end
  end
end