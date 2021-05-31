Dado('já coloquei os produtos balanca digital e Conjunto de Frigideiras no carrinho') do
    
    visit "https://www.livelo.com.br/"
    sleep 3

    #pesquisando produto
    fill_in('input-search', with: 'Balança Digital Multilaser Digi-Health Serene – Preto').native.send_keys(:enter)
    sleep 5

    #clicando no produto
    find('img[src*="//imagens.extra.com.br/Control/ArquivoExibir.aspx?IdArquivo=316560210"]').click
    sleep 5

    #inserindo CEP
    fill_in('inpt-cep__pdp', with: '25080-010')
    find('span', text: 'Buscar').click
    sleep 5

    #adicionando no carrinho
    click_button(class: 'button button__primary button--large')
    sleep 6
    #Continuar comprando
    find('span', text: 'Continuar Comprando').click
    sleep 5

    #Validando QTD do Carrinho
    expect(page).to have_css('#span-ball-cart', text: '1')
    sleep 5

    find(:id, 'a-linkCart').click
    sleep 5

end
  
    Quando('remover balanca digital') do
    
      click_link_or_button 'Remover'
      sleep 5
    end
  
    Entao('deverá exibir mensagem de nao existir itens no carrinho') do
      expect(page).to have_content('Ainda não existem itens no seu carrinho')
      sleep 5
    end
  