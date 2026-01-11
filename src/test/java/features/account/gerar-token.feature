Feature: Gerar token de autenticação

  Background:
    * def setup = callonce read('classpath:features/account/setup-usuario.feature')

  @smoke
  Scenario: Gerar token com credenciais válidas
    Given url baseUrl
    And path '/Account/v1/GenerateToken'
    And request
    """
    {
      userName: #(setup.username),
      password: #(setup.password)
    }
    """
    When method post
    Then status 200
    And match response.token != null
    And match response.status == 'Success'

  @smoke
  Scenario: Gerar token com senha inválida
    Given url baseUrl
    And path '/Account/v1/GenerateToken'
    And request
    """
    {
      userName: #(setup.username),
      password: 'senhaErrada123'
    }
    """
    When method post
    Then status 200
    And match response.status == 'Failed'
    And match response.token == null
