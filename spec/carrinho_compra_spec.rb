require './carrinho_compra'

RSpec.describe CarrinhoCompra do
  subject { CarrinhoCompra.new }

  describe '#new' do
    it 'inicializa um carrinho de compra' do
      expect(subject).to be_instance_of CarrinhoCompra
    end
  end

  describe 'adicionar' do
    context 'quando o item já existe' do
      it 'nao duplica o item' do
        subject.adicionar('placa de video')
        expect { subject.adicionar('placa de video') }.not_to change{ subject.items.size }
      end

      it 'incrementa o item em +1' do
        subject.adicionar('placa de video')
        subject.adicionar('placa de video')

        expect(subject.verificar_quantidade('placa de video')).to eq 2
      end
    end

    context 'quando o item não existe' do
      context 'quando fornece o nome' do
        it 'adiciona item no carrinho' do
          expect { subject.adicionar('placa de video') }.to change{ subject.items.size }.by(1)
        end
      end

      context 'quando nao fornece o nome' do
        it 'retorna mensagem de erro' do
          expect(subject.adicionar('')).to eq 'Você precisa fornecer um nome!'
        end
      end
    end
  end

  describe '#verificar_quantidade' do
    it 'retornar a quantidade do item desejado' do
      subject.adicionar('placa de video')
      expect(subject.verificar_quantidade('placa de video')).to eq 1
    end
  end

  describe '#remover_todos' do
    it 'remove todos os items do carrinho' do
      subject.adicionar('placa de video')
      expect { subject.remover_todos }.to change { subject.items.size }.to(0)
    end
  end

  describe 'remover' do
    context 'quando o item existe no carrinho' do
      it 'remove o item' do
        subject.adicionar('placa de video')
        subject.adicionar('processador')
        expect { subject.remover('processador') }.to change { subject.items.size }.from(2).to(1)
      end
    end

    context 'quando o item nao existe no carrinho' do
      it 'informa mensagem de erro' do
        subject.adicionar('placa de video')
        subject.adicionar('processador')
        expect(subject.remover('placa mae')).to eq 'O item não existe no carrinho'
      end
    end
  end
end
