Feature: Adicionar livro ao usuário

  Background:
    * def setup = callonce read('classpath:features/account/setup-usuario.feature')
    * def userId = setup.userId
    * def token = setup.token

  @smoke
  Scenario: Adicionar livro ao usuário com sucesso
    Given url baseUrl
    And path '/BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And header Content-Type = 'application/json'
    And request
    """
    {
      "userId": "#(userId)",
      "collectionOfIsbns": [
        {
          "isbn": "9781449325862"
        }
      ]
    }
    """
    When method post
    Then status 201

  @smoke
  Scenario: Adicionar livro ao usuário sem token
    Given url baseUrl
    And path '/BookStore/v1/Books'
    And request
    """
    {
      "userId": "#(userId)",
      "collectionOfIsbns": [
        {
          "isbn": "9781449325862"
        }
      ]
    }
    """
    When method post
    Then status 401
