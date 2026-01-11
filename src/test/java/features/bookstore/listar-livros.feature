Feature: Listar livros

  @smoke
  Scenario: Listar catálogo de livros
    Given url baseUrl
    And path '/BookStore/v1/Books'
    When method get
    Then status 200
    And match response.books != null
