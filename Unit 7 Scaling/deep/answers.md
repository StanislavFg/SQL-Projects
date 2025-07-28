# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

With random partioning you can evenly distribute the data and each boat can perform queries parallel to each other, taking less time overall to process through all the data.
the downside of it is the randomness itself. If the, for example, would like to get the data with specific timestamp we might need to scan data on all of the boats instead of just 1

## Partitioning by Hour

Portioning by hour on the other hand have smaller issues with quering data by some attributes, at the same time increasing the total time of operation if all 3 boats would run a query.

## Partitioning by Hash Value

Out all of them, Partitioning by Hash Value seems to be the best method of Partioning. Since they are all equally distributed, each boat can perform queries parallel to each other, taking less time overall to process through all the data. Then, It has the similar advantage of Partitioning by Hour, since the data is not fully random, making quering by specific parameters much easier.
