# N-Queens

This isn't even a lib.  This is more code from my grad school days.
I'm running it through cucumber and sharing it with the world.
For why this matters, check out my talk on Bundler (link coming soon)

## Running the n-queens solver
  $ ruby exhaustive.rb N

  $ ruby ginat.rb N

  $ ruby backtracking.rb N

## Example Tests

  Scenario: I solve for N=10
    Given I have an exhaustive solver
    When I solve for N equals 10
    Then there should be 10 queens on the board
    And there should be only 1 Queen per row
    And there should be only 1 Queen per column
    And there should be only 1 Queen per diagonal
<pre>
====== Solution ========
[0, 2, 5, 7, 9, 4, 8, 1, 3, 6]
====== Board ===========
  0 1 2 3 4 5 6 7 8 9
0 Q . . . . . . . . .
1 . . Q . . . . . . .
2 . . . . . Q . . . .
3 . . . . . . . Q . .
4 . . . . . . . . . Q
5 . . . . Q . . . . .
6 . . . . . . . . Q .
7 . Q . . . . . . . .
8 . . . Q . . . . . .
9 . . . . . . Q . . .
</pre>
    And I should visually inspect the board
