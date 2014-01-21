Feature: Test command
  In order to run tests written with shindo
  As a user of Busser
  I want my tests to run when the shindo runner plugin is installed

  Background:
    Given a test BUSSER_ROOT directory named "busser-shindo-test"
    And a sandboxed GEM_HOME directory named "busser-shindo-gem-home"
    When I successfully run `busser plugin install busser-shindo --force-postinstall`
    Given a suite directory named "shindo"

  Scenario: A passing test suite
    Given a file in suite "shindo" named "tests/shindo_tests.rb" with:
    """
    Shindo.tests do
      returns(true) { true }
      returns(false) { false }
    end
    """
    When I run `busser test shindo`
    Then the output should contain:
    """
    2 succeeded in
    """
    And the exit status should be 0

  Scenario: A failing test suite
    Given a file in suite "shindo" named "tests/shindo_tests.rb" with:
    """
    Shindo.tests do
      returns(true) { true }
      returns(false) { true }
    end
    """
    When I run `busser test shindo`
    Then the output should contain:
    """
    1 failed, 1 succeeded
    """
    And the exit status should not be 0
