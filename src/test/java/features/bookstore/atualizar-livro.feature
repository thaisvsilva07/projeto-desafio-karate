Feature: Atualizar livro do usuário (BookStore)

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
  Scenario: Atualizar livro do usuário com sucesso
    Given url baseUrl
    And path '/BookStore/v1/Books/9781449325862'
    And header Authorization = 'Bearer ' + token
    And request
    """
    {
      "userId": "#(userId)",
      "isbn": "9781449331818"
    }
    """
    When method put
    Then status 200
    And match response.books[0].isbn == '9781449331818'

  @smoke
  Scenario: Atualizar livro do usuário sem o token
    Given url baseUrl
    And path '/BookStore/v1/Books/9781449325862'
    And request
    """
    {
      "userId": "#(userId)",
      "isbn": "9781449331818"
    }
    """
    When method put
    Then status 401
