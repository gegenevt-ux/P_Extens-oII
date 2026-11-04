document.addEventListener('DOMContentLoaded', () => {
    // Usar o ID específico do botão de cadastrar produto
    const btnCadastrar = document.getElementById('btn-cadastrar-produto');
    
    if (btnCadastrar) {
        btnCadastrar.addEventListener('click', (e) => {
            e.preventDefault();

            // Capturar os valores pelos IDs corretos do formulário
            const nomeInput = document.getElementById('prod-nome');
            const descInput = document.getElementById('prod-desc');
            const precoInput = document.getElementById('prod-preco');
            const pesoInput = document.getElementById('prod-peso');
            
            const nome = nomeInput ? nomeInput.value.trim() : '';
            const desc = descInput ? descInput.value.trim() : 'Novo item';
            const preco = precoInput ? precoInput.value.trim() : '0,00';
            const estoque = pesoInput ? pesoInput.value.trim() : '1';

            if (!nome) {
                alert('Por favor, informe o nome do produto.');
                if (nomeInput) nomeInput.focus();
                return;
            }

            // Encontrar a tabela de produtos na tela
            const tabelaProdutos = document.querySelector('table tbody');
            if (!tabelaProdutos) return;

            // Criar a nova linha (tr) com os botões empilhados (Editar em cima, Excluir em baixo)
            const novaLinha = document.createElement('tr');
            
            novaLinha.innerHTML = `
                <td>
                    <strong>${nome}</strong><br>
                    <small>${desc}</small>
                </td>
                <td>R$ ${preco}</td>
                <td>${estoque} un.</td>
                <td><span class="badge ready">Ativo</span></td>
                <td>
                    <div class="btn-group-column">
                        <button class="btn-action">Editar</button>
                        <button class="btn-action btn-danger" onclick="this.closest('tr').remove()">Excluir</button>
                    </div>
                </td>
            `;

            // Adicionar a nova linha no topo da tabela
            tabelaProdutos.prepend(novaLinha);

            // Limpar os campos do formulário após o cadastro
            if (nomeInput) nomeInput.value = '';
            if (descInput) descInput.value = '';
            if (precoInput) precoInput.value = '';
            if (pesoInput) pesoInput.value = '';

            alert('Produto cadastrado com sucesso!');
        });
    }
});