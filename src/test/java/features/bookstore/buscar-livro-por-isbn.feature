Feature: Buscar livro por ISBN

  @smoke
  Scenario: Buscar livro com ISBN válido
    Given url baseUrl
    And path '/BookStore/v1/Book'
    And param ISBN = '9781449325862'
    When method get
    Then status 200

  @smoke
  Scenario: Buscar livro inexistente
    Given url baseUrl
    And path '/BookStore/v1/Book'
    And param ISBN = '000000'
    When method get
    Then status 400
