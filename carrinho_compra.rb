class CarrinhoCompra
  attr_accessor :items

  def initialize
    @items = []
  end

  def adicionar(nome)
    return 'Você precisa fornecer um nome!' if nome.empty?

    existe = false
    quantidade_atual = 0

    items.each do |item|
      if item[:nome] == nome
        item[:quantidade] = item[:quantidade] += 1
        existe = true
      end
      break
    end

    return if existe

    hash = { nome: nome, quantidade: 1 }
    items << hash
  end

  def verificar_quantidade(nome)
    retorno = 0

    items.each do |item|
      retorno = item[:quantidade] if item[:nome] == nome
      break
    end

    retorno
  end

  def remover_todos
    @items = []
  end

  def remover(nome)
    existe = false

    items.each_with_index do |item, idx|
      if item[:nome] == nome
        items.delete_at(idx)
        existe = true
      end
    end

    'O item não existe no carrinho' unless existe
  end
end