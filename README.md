# aoc_20_rb

Advent of Code 2020 in ruby, with an occasional serving of [sorbet](https://sorbet.org/)

## Running Tests

Run one day:

```bash
aoc_20_rb (main)$ bundle exec ruby day_01/test*
```

Run all tests:

```bash
TODO aoc_20_rb (main)$ bundle exec ruby test/test_all_days.rb
```

## Day 1 - done, with sorbet.

For part 2, my first solution was a brute force triple loop. It ran fast enough. Then I tried a simple optimization based on the data: If the sum of the two outer loops is already over the target sum, skip the third loop. That improved performance a couple of orders of magnitutude:

```bash
day_01 (main)$ ./benchmark.rb
Rehearsal ----------------------------------------------
part_2       0.134078   0.000649   0.134727 (  0.138099)
part_2_opt   0.002489   0.000060   0.002549 (  0.002560)
------------------------------------- total: 0.137276sec

                 user     system      total        real
part_2       0.129338   0.000642   0.129980 (  0.131435)
part_2_opt   0.002445   0.000064   0.002509 (  0.002539)
day_01 (main)$
```

## Day 2 - done, with sorbet.

Hooking up sorbet meant some code changes that feel a bit un-rubyish, especially in the [PasswordEntry](https://github.com/bfollek/aoc_20_rb/blob/main/day_02/password_entry.rb) `initialize` method.

## Day 3 - done.

## Day 4 - done.

## Day 5 - done.

## Day 6 - done.

## Day 7 - done.

## Day 8 - done.

## Day 9 - done.

## Day 10 - Part 1 done. Part 2 on hold.
