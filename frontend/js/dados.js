/* =========================================================
   DADOS.JS — os produtos da loja (por enquanto, "de mentira")
   ---------------------------------------------------------
   Os campos são IGUAIS aos da tabela "produto" do banco
   (banco/criar_banco.sql). Assim, quando a API do backend
   ficar pronta, só trocamos esta lista por um fetch().
   ========================================================= */

const PRODUTOS = [
  {
    id: 1,
    nome: 'Carvão Faveiro',
    descricao: 'Carvão vegetal de madeira Faveiro. Alta durabilidade, brasa forte e uniforme.',
    preco: 25.0,
    peso: 4,
    categoria: 'Carvão vegetal',
    detalhe: '100% madeira faveiro',   // texto curto que aparece no card
    disponivel: 1,
    imagem: 'assets/img/produto-faveiro.svg'
  },
  {
    id: 2,
    nome: 'Carvão Misto',
    descricao: 'Mistura de madeiras selecionadas. Ótimo custo-benefício.',
    preco: 20.0,
    peso: 3,
    categoria: 'Carvão vegetal',
    detalhe: 'Mistura selecionada',
    disponivel: 1,
    imagem: 'assets/img/produto-misto.svg'
  },
  {
    id: 3,
    nome: 'Carvão Premium',
    descricao: 'Lenha nobre selecionada.',
    preco: 32.0,
    peso: 5,
    categoria: 'Linha premium',
    detalhe: 'Lenha nobre selecionada',
    disponivel: 0,                     // no protótipo ele aparece "Indisponível"
    imagem: 'assets/img/produto-premium.svg'
  }
];
