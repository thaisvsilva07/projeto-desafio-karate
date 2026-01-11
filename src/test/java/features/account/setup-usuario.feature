Feature: Setup usuário BookStore

  Scenario: Criar usuário e gerar token
    * def username = 'user_' + java.util.UUID.randomUUID()
    * def password = 'Senha123@@'

    Given url baseUrl
    And path '/Account/v1/User'
    And request
    """
    {
      userName: #(username),
      password: #(password)
    }
    """
    When method post
    Then status 201
    * def userId = response.userID

    Given url baseUrl
    And path '/Account/v1/GenerateToken'
    And request
    """
    {
      userName: #(username),
      password: #(password)
    }
    """
    When method post
    Then status 200
    * def token = response.token
