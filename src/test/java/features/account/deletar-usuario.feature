Feature: Deletar usuário

  Background:
    * def setup = callonce read('classpath:features/account/setup-usuario.feature')
    * def userId = setup.userId
    * def token = setup.token

  @smoke
  Scenario: Deletar usuário com sucesso
    Given url baseUrl
    And path '/Account/v1/User', userId
    And header Authorization = 'Bearer ' + token
    When method delete
    Then status 204

  @smoke
  Scenario: Deletar usuário sem token
    Given url baseUrl
    And path '/Account/v1/User', userId
    When method delete
    Then status 401
