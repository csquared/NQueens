Feature:
  In order to correctly solve the N-Queens Problem
  As Chris the Awesome Coder
  I need to satisfy the Problem Constraints

  Scenario: I solve for N=4
    Given I have an exhaustive solver
    When I solve for N equals 4
    Then there should be 4 queens on the board
    And there should be only 1 Queen per row
    And there should be only 1 Queen per column
    And there should be only 1 Queen per diagonal
    And I should visually inspect the board

  Scenario: I solve for N=10
    Given I have an exhaustive solver
    When I solve for N equals 10
    Then there should be 10 queens on the board
    And there should be only 1 Queen per row
    And there should be only 1 Queen per column
    And there should be only 1 Queen per diagonal
    And I should visually inspect the board

  Scenario Outline: I solve for N=n
    Given I have an exhaustive solver
    When I solve for N equals <n>
    Then there should be <n> queens on the board
    And there should be only 1 Queen per row
    And there should be only 1 Queen per column
    And there should be only 1 Queen per diagonal

  Scenarios:
    |   n   |
    |   5   |
    |   6   |
    |   7   |
    |   8   |
    |   9   |
