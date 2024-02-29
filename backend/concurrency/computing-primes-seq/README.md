# Info
Running on MacBook Air M2

# Without Threads
checking till 1000000000 found 5761454 prime numbers. took 26.552137958s

# With Threads But No Fairness Distribution
checking till 1000000000 found 5761454 prime numbers. took 6.859925083s
Each thread not doing same amount of work
```
thread 1 [10000003, 20000003) completed in 3.768264333s
thread 2 [20000003, 30000003) completed in 4.683814458s
thread 3 [30000003, 40000003) completed in 5.167479792s
thread 4 [40000003, 50000003) completed in 5.675181292s
thread 5 [50000003, 60000003) completed in 5.805242875s
thread 6 [60000003, 70000003) completed in 6.178538125s
thread 7 [70000003, 80000003) completed in 6.455771666s
thread 8 [80000003, 90000003) completed in 6.63658375s
thread 9 [90000003, 100000000) completed in 6.914830333s
```

# With Threads And Fairness Distribution
checking till 1000000000 found 5761454 prime numbers. took 6.954470542s
Each thread do same amount of work
```
thread 9 completed in 6.851654625s
thread 2 completed in 6.851431834s
thread 6 completed in 6.851908083s
thread 4 completed in 6.851851458s
thread 5 completed in 6.851369083s
thread 7 completed in 6.839982083s
thread 3 completed in 6.851692958s
thread 0 completed in 6.85163s
thread 8 completed in 6.8271575s
thread 1 completed in 6.85171825s
```
