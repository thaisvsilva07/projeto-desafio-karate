Feature: Deletar todos os livros do usuário

  Background:
    * def setup = callonce read('classpath:features/account/setup-usuario.feature')
    * def userId = setup.userId
    * def token = setup.token

    Given url baseUrl
    And path '/BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And request
    """
    {
      "userId": "#(userId)",
      "collectionOfIsbns": [
        { "isbn": "9781449325862" }
      ]
    }
    """
    When method post
    Then status 201

  @smoke
  Scenario: Deletar todos os livros do usuário com sucesso
    Given url baseUrl
    And path '/BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And param UserId = userId
    When method delete
    Then status 204

  @smoke
  Scenario: deletar todos os livros do usuário sem token
    Given url baseUrl
    And path '/BookStore/v1/Books'
    And param UserId = userId
    When method delete
    Then status 401
