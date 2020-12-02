# aoc_20_rb

Advent of Code 2020 in ruby, with [sorbet](https://sorbet.org/)

## Day 1 - done

For part 2, my first solution was a brute force triple loop. It ran fast enough. Then I added a simple optimization based on the data: If the sum of the two outer loops is already over the target sum, skip the third loop. That improved performance a couple of orders of magnitutude:

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
