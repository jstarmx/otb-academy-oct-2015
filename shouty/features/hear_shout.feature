Feature: Hear Shout

  In order to find out whats going on locally
  As a shouty subscriber
  I want to hear shouts in my area

  Business Rules:
    - Range is 50m

  Background:
    Given the following subscribers
      | name | location |
      | Sean |        0 |
      | Lucy |       15 |
      | Tom  |       65 |

  Scenario: Listener is within range
    # Given Lucy is 15m from Sean
    When Sean shouts "Free Bagels!"
    Then Lucy hears Sean's message

  Scenario: Listener hears a different message
    # Given Lucy is 15m from Sean
    When Sean shouts "Free Coffee!"
    Then Lucy hears Sean's message

  Scenario: Listener is out of range
    # Given Tom is 60m from Sean
    When Sean shouts "Free Bagels!"
    Then Tom does not hear Sean's message
  
  Scenario: Message is too long
    # Given Lucy is 15m from Sean
    When Sean shouts "Free Bagels! Free Bagels! Free Bagels! Free Bagels!"
    Then Lucy does not hear Sean's message

  # Scenario: Listener hears a message when coming into range after shout
  #   Given Lucy is 60m from Sean
  #   And Sean shouts "Free Coffee!"
  #   When Lucy moves to 50m from Sean
  #   Then Lucy hears Sean's message