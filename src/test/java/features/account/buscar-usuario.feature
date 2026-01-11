Feature: Buscar usuário por ID

  Background:
    * def setup = callonce read('classpath:features/account/setup-usuario.feature')
    * def userId = setup.userId
    * def token = setup.token

  @smoke
  Scenario: Buscar usuário com sucesso
    Given url baseUrl
    And path '/Account/v1/User', userId
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response.userId == userId
    And match response.username == setup.username
    And match response ==
    """
    {
      userId: '#string',
      username: '#string',
      books: '#array'
    }
    """

  @smoke
  Scenario: Buscar usuário sem token
    Given url baseUrl
    And path '/Account/v1/User', userId
    When method get
    Then status 401
