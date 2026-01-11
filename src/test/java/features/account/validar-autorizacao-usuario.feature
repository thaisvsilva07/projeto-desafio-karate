Feature: Validar autorização do usuário

  Background:
    * def setup = callonce read('classpath:features/account/setup-usuario.feature')

  @smoke
  Scenario: Usuário autorizado com credenciais válidas
    Given url baseUrl
    And path '/Account/v1/Authorized'
    And request
    """
    {
      userName: #(setup.username),
      password: #(setup.password)
    }
    """
    When method post
    Then status 200
    And match response == 'true'

  @smoke
  Scenario: Usuário não autorizado - usuário inexistente
    Given url baseUrl
    And path '/Account/v1/Authorized'
    And request
    """
    {
      userName: 'usuarioInexistente123',
      password: 'senhaErrada'
    }
    """
    When method post
    Then status 404
    And match response.code == '1207'
    And match response.message == 'User not found!'

  @smoke
  Scenario Outline: Usuário não autorizado
    Given url baseUrl
    And path '/Account/v1/Authorized'
    And request
  """
  {
    userName: <user>,
    password: <password>
  }
  """
    When method post
    Then status <status>

    Examples:
      | user            | password           | status |
      | setup.username  | 'senhaErrada123'   | 404    |
