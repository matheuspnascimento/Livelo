Dado('que estou na Home sem estar logado') do
    
    visit "https://www.livelo.com.br/"
    sleep 3
  end
  
  Quando('adicionar {int} produtos diferentes no carrinho') do |int|
    page.driver.browser.manage.delete_cookie 'ak_bmsc'

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

    ####################################
  # segundo produto
      #pesquisando produto
      fill_in('input-search', with: 'Kit Ferramentas Sparta 129 Peças 13564 - com Maleta -').native.send_keys(:enter)
      sleep 5
  
      #clicando no produto
      find('img[src*="//i.mlcdn.com.br/410x308/220907400.jpg"]').click
      sleep 5

  
      #inserindo CEP
      fill_in('inpt-cep__pdp', with: '25080-010')
      find('span', text: 'Buscar').click
      sleep 5
  
      #adicionando no carrinho
      click_button(class: 'button button__primary button--large')
      sleep 6

      expect(page).to have_content('Kit Ferramentas Sparta 129 Peças 13564 - com Maleta')
      sleep 3
      expect(page).to have_content('5.400 Pontos')
      #Continuar comprando
      find('span', text: 'Continuar Comprando').click
      sleep 5

      ######## Adicionando 3
        # terceiro produto

      #pesquisando produto
      fill_in('input-search', with: 'Conjunto de Frigideiras Tramontina Turim com Revestimento Antiaderente - 3 Peças').native.send_keys(:enter)
      sleep 5
  
      #clicando no produto
      find('img[src*="//imagens.extra.com.br/Control/ArquivoExibir.aspx?IdArquivo=989592893"]').click
      sleep 5
  
      #inserindo CEP
      fill_in('inpt-cep__pdp', with: '25080-010')
      find('span', text: 'Buscar').click
      sleep 5
  
      expect(page).to have_content('Conjunto de Frigideiras Tramontina Turim com Revestimento Antiaderente - 3 Peças')
      expect(page).to have_content('3.700 Pontos')

      #adicionando no carrinho
      click_button(class: 'button button__primary button--large')
      sleep 6
      #Continuar comprando
      find('span', text: 'Continuar Comprando').click
      sleep 5

  end
  
  Entao('valido Tipo, Nome e QTD Pontos') do
   
    #Validando QTD do Carrinho
    expect(page).to have_css('#span-ball-cart', text: '3')
   
  end