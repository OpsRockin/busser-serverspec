Feature: Plugin install command
  In order to use this plugin
  As a user of Busser
  I want to run the postinstall for this plugin

  Background:
    Given a test BUSSER_ROOT directory named "busser-shindo-install"
    And a sandboxed GEM_HOME directory named "busser-shindo-gem-home"

  Scenario: Running the postinstall generator
    When I run `busser plugin install busser-shindo --force-postinstall`
    Then a gem named "shindo" is installed
    And the exit status should be 0
