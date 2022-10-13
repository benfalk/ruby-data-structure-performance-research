# Common Data Structure Benchmark

This is a performance breakdown between several different data structures
that you are likely to encounter with ruby.  It highlights how poor
`OpenStruct` is and also demonstrates the read/write difference between
structs, hashes, and POROs.

## tl;dr

Positional argument based POROs are you best best for performance assuming
your code reads and writes more often to the data structure compared to
initializing them.

Stop using `OpenStruct` at all costs.

## ruby 2.7.5 Breakdown Results

### Init Results

```
Calculating -------------------------------------
                hash     13.874M (± 3.9%) i/s -     69.642M in   5.027836s
              struct      4.760M (± 5.2%) i/s -     23.820M in   5.020111s
        kwarg-struct      2.303M (± 4.3%) i/s -     11.524M in   5.015536s
         open-struct      1.351M (± 4.4%) i/s -      6.797M in   5.043154s
      postional-poro      4.461M (± 3.7%) i/s -     22.340M in   5.015203s
          kwarg-poro      2.223M (± 5.2%) i/s -     11.187M in   5.049344s

Comparison:
                hash: 13874105.5 i/s
              struct:  4759540.8 i/s - 2.92x  (± 0.00) slower
      postional-poro:  4461225.9 i/s - 3.11x  (± 0.00) slower
        kwarg-struct:  2302506.2 i/s - 6.03x  (± 0.00) slower
          kwarg-poro:  2222530.4 i/s - 6.24x  (± 0.00) slower
         open-struct:  1350708.7 i/s - 10.27x  (± 0.00) slower
```


### Read Results

```
Calculating -------------------------------------
                hash     20.387M (± 4.3%) i/s -    103.697M in   5.097220s
              struct     18.508M (± 5.1%) i/s -     93.370M in   5.059890s
      struct-as-hash     13.674M (± 4.5%) i/s -     68.673M in   5.033799s
        kwarg-struct     18.590M (± 4.8%) i/s -     93.958M in   5.067785s
kwarg-struct-as-hash     13.652M (± 4.5%) i/s -     69.224M in   5.082161s
         open-struct     10.129M (± 5.7%) i/s -     50.782M in   5.033136s
 open-struct-as-hash     12.508M (± 4.0%) i/s -     63.585M in   5.092901s
      postional-poro     21.772M (± 5.0%) i/s -    109.617M in   5.049640s
          kwarg-poro     22.102M (± 4.2%) i/s -    111.619M in   5.060634s

Comparison:
          kwarg-poro: 22101870.5 i/s
      postional-poro: 21772451.5 i/s - same-ish: difference falls within error
                hash: 20387090.4 i/s - same-ish: difference falls within error
        kwarg-struct: 18590115.7 i/s - 1.19x  (± 0.00) slower
              struct: 18508396.1 i/s - 1.19x  (± 0.00) slower
      struct-as-hash: 13673790.0 i/s - 1.62x  (± 0.00) slower
kwarg-struct-as-hash: 13652136.2 i/s - 1.62x  (± 0.00) slower
 open-struct-as-hash: 12508273.0 i/s - 1.77x  (± 0.00) slower
         open-struct: 10129121.5 i/s - 2.18x  (± 0.00) slower
```


### Write Results

```
Calculating -------------------------------------
                hash     14.483M (± 4.6%) i/s -     72.598M in   5.024147s
              struct     15.246M (± 4.4%) i/s -     76.451M in   5.025828s
      struct-as-hash     12.125M (± 5.3%) i/s -     60.935M in   5.042192s
        kwarg-struct     15.251M (± 4.7%) i/s -     77.038M in   5.063840s
kwarg-struct-as-hash     12.247M (± 3.3%) i/s -     62.192M in   5.084182s
         open-struct      6.603M (± 4.8%) i/s -     33.533M in   5.091866s
 open-struct-as-hash      4.557M (± 4.0%) i/s -     23.007M in   5.057435s
      postional-poro     19.148M (± 4.5%) i/s -     95.645M in   5.006590s
          kwarg-poro     19.002M (± 4.9%) i/s -     95.706M in   5.050509s

Comparison:
      postional-poro: 19148301.6 i/s
          kwarg-poro: 19001631.1 i/s - same-ish: difference falls within error
        kwarg-struct: 15250917.2 i/s - 1.26x  (± 0.00) slower
              struct: 15246356.0 i/s - 1.26x  (± 0.00) slower
                hash: 14483153.4 i/s - 1.32x  (± 0.00) slower
kwarg-struct-as-hash: 12247190.9 i/s - 1.56x  (± 0.00) slower
      struct-as-hash: 12125055.2 i/s - 1.58x  (± 0.00) slower
         open-struct:  6603234.7 i/s - 2.90x  (± 0.00) slower
 open-struct-as-hash:  4556824.4 i/s - 4.20x  (± 0.00) slower
```

## ruby 3.1.1 Breakdown Results

### Init Results

```
Calculating -------------------------------------
                hash     14.268M (± 4.4%) i/s -     72.172M in   5.069022s
              struct      5.186M (± 5.0%) i/s -     26.304M in   5.085795s
        kwarg-struct      2.311M (± 4.7%) i/s -     11.733M in   5.089285s
         open-struct     60.260k (± 8.2%) i/s -    304.654k in   5.097034s
      postional-poro      5.599M (± 4.9%) i/s -     28.065M in   5.025571s
          kwarg-poro      2.582M (± 4.6%) i/s -     13.025M in   5.056409s

Comparison:
                hash: 14267756.3 i/s
      postional-poro:  5598792.4 i/s - 2.55x  (± 0.00) slower
              struct:  5185713.1 i/s - 2.75x  (± 0.00) slower
          kwarg-poro:  2581862.0 i/s - 5.53x  (± 0.00) slower
        kwarg-struct:  2310996.6 i/s - 6.17x  (± 0.00) slower
         open-struct:    60259.5 i/s - 236.77x  (± 0.00) slower
```

### Read Results

```
Calculating -------------------------------------
                hash     18.193M (± 6.2%) i/s -     91.194M in   5.033827s
              struct     19.759M (± 6.6%) i/s -     99.044M in   5.037826s
      struct-as-hash     12.376M (± 7.3%) i/s -     62.040M in   5.043743s
        kwarg-struct     20.002M (± 5.5%) i/s -    100.336M in   5.033676s
kwarg-struct-as-hash     12.327M (± 6.6%) i/s -     62.285M in   5.077731s
         open-struct      9.378M (± 5.8%) i/s -     47.222M in   5.055197s
 open-struct-as-hash     11.058M (± 6.6%) i/s -     55.932M in   5.084142s
      postional-poro     18.993M (± 5.1%) i/s -     95.342M in   5.034748s
          kwarg-poro     18.897M (± 6.8%) i/s -     94.978M in   5.053189s

Comparison:
        kwarg-struct: 20001780.7 i/s
              struct: 19758511.8 i/s - same-ish: difference falls within error
      postional-poro: 18992543.3 i/s - same-ish: difference falls within error
          kwarg-poro: 18896729.0 i/s - same-ish: difference falls within error
                hash: 18193283.9 i/s - same-ish: difference falls within error
      struct-as-hash: 12375882.1 i/s - 1.62x  (± 0.00) slower
kwarg-struct-as-hash: 12326748.7 i/s - 1.62x  (± 0.00) slower
 open-struct-as-hash: 11057653.8 i/s - 1.81x  (± 0.00) slower
         open-struct:  9377670.3 i/s - 2.13x  (± 0.00) slower
```

### Write Results

```
Calculating -------------------------------------
                hash     13.492M (± 6.7%) i/s -     68.047M in   5.070933s
              struct     17.486M (± 6.9%) i/s -     87.778M in   5.046860s
      struct-as-hash     11.644M (± 6.0%) i/s -     58.304M in   5.027767s
        kwarg-struct     17.253M (± 6.6%) i/s -     86.487M in   5.037820s
kwarg-struct-as-hash     11.374M (± 5.4%) i/s -     57.091M in   5.036302s
         open-struct      7.159M (± 7.3%) i/s -     35.987M in   5.057771s
 open-struct-as-hash      5.629M (± 6.0%) i/s -     28.559M in   5.094190s
      postional-poro     16.799M (± 7.2%) i/s -     84.586M in   5.064876s
          kwarg-poro     16.462M (± 9.6%) i/s -     83.069M in   5.102951s

Comparison:
              struct: 17486419.2 i/s
        kwarg-struct: 17253488.1 i/s - same-ish: difference falls within error
      postional-poro: 16798976.1 i/s - same-ish: difference falls within error
          kwarg-poro: 16462258.2 i/s - same-ish: difference falls within error
                hash: 13491903.3 i/s - 1.30x  (± 0.00) slower
      struct-as-hash: 11644084.5 i/s - 1.50x  (± 0.00) slower
kwarg-struct-as-hash: 11374405.8 i/s - 1.54x  (± 0.00) slower
         open-struct:  7159476.7 i/s - 2.44x  (± 0.00) slower
 open-struct-as-hash:  5628956.0 i/s - 3.11x  (± 0.00) slower
```

## Ruby Version Comparison Table

### Hash

| action | ruby 2.7.5 | ruby 3.1.1 |
|--------|------------|------------|
| init   | 13.874M    | 14.268M    |
| read   | 20.387M    | 18.193M    |
| write  | 14.483M    | 13.492M    |

### Struct

| action | ruby 2.7.5 | ruby 3.1.1 |
|--------|------------|------------|
| init   | 4.760M     | 5.186M     |
| read   | 18.508M    | 19.759M    |
| write  | 15.246M    | 17.486M    |

### Positional PORO

| action | ruby 2.7.5 | ruby 3.1.1 |
|--------|------------|------------|
| init   | 4.461M     | 5.599M     |
| read   | 21.772M    | 18.993M    |
| write  | 19.148M    | 16.799M    |

### Keyword PORO

| action | ruby 2.7.5 | ruby 3.1.1 |
|--------|------------|------------|
| init   | 2.223M     | 2.223M     |
| read   | 22.102M    | 18.993M    |
| write  | 19.002M    | 16.462M    |

### OpenStruct

| action | ruby 2.7.5 | ruby 3.1.1 |
|--------|------------|------------|
| init   | 1.351M     | 60.260k    |
| read   | 10.129M    |  9.378M    |
| write  |  6.603M    |  7.159M    |
