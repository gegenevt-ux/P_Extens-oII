/* =========================================================
   LOJA.JS — funções reutilizadas pelas telas do cliente
   ========================================================= */

/* Formata 25 -> "R$ 25,00" (padrão brasileiro) */
function formatarPreco(valor) {
  return valor.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
}

/* Monta o HTML de UM card de produto.
   Escrevemos o card uma única vez e usamos na Home e na Lista. */
function criarCardProduto(produto) {
  const disponivel = produto.disponivel === 1;
  const imagem = produto.imagem || 'assets/img/produto-padrao.svg';

  return `
    <a class="card-produto ${disponivel ? '' : 'indisponivel'}"
       href="produto.html?id=${produto.id}">
      <div class="card-produto-foto">
        <img src="${imagem}" alt="${produto.nome}" loading="lazy">
      </div>
      <div class="card-produto-info">
        <span class="badge ${disponivel ? 'badge-disponivel' : 'badge-indisponivel'}">
          ${disponivel ? 'Disponível' : 'Indisponível'}
        </span>
        <p class="card-produto-detalhe">${produto.detalhe} · ${produto.peso} kg</p>
        <h3>${produto.nome}</h3>
        <p class="preco">${formatarPreco(produto.preco)}</p>
      </div>
    </a>
  `;
}

/* Recebe uma lista de produtos e "desenha" os cards dentro de um elemento */
function renderizarProdutos(lista, elemento) {
  elemento.innerHTML = lista.map(criarCardProduto).join('');
}
