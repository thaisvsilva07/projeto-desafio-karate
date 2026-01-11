Feature: Criar usuário

  @smoke
  Scenario: Criar usuário com sucesso
    Given url baseUrl
    And path '/Account/v1/User'
    And request read('classpath:features/account/dadosTesteAccount/criar-usuario.json')
    When method post
    Then status 201
    And match response.userID != null

  @smoke
  Scenario: Criar usuário com dados inválidos
    Given url baseUrl
    And path '/Account/v1/User'
    And request read('classpath:features/account/dadosTesteAccount/criar-usuario-invalido.json')
    When method post
    Then status 400
