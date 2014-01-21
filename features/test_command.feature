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
    Given a file in suite "serverspec" named "localhost/default_spec.rb" with:
    """
    require 'serverspec'
    require 'pathname'
    include Serverspec::Helper::Exec
    include Serverspec::Helper::DetectOS
    RSpec.configure do |c|
      c.before :all do
        c.os = backend(Serverspec::Commands::Base).check_os
      end
    end

    describe command( "echo 'hello'" ) do
      it { should return_exit_status 0 }
      it { should return_stdout 'hello' }
    end
    """
    When I run `busser test serverspec`
    Then the output should contain:
    """
    2 examples, 0 failures
    """
    And the exit status should be 0

  Scenario: A failing test suite
    Given a file in suite "serverspec" named "localhost/default_spec.rb" with:
    """
    require 'serverspec'
    require 'pathname'
    include Serverspec::Helper::Exec
    include Serverspec::Helper::DetectOS
    RSpec.configure do |c|
      c.before :all do
        c.os = backend(Serverspec::Commands::Base).check_os
      end
    end

    describe command( 'which uhoh-whatzit-called' ) do
      it { should return_exit_status 0 }
    end
    """
    When I run `busser test serverspec`
    Then the output should contain:
    """
    1 example, 1 failure
    """
    And the exit status should not be 0
