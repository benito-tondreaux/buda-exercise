# Buda exercise - Metro

This is an exercise to apply Buda. This is an exercise of a metro network and consist on search the best road between two stations.

-------

First, the solution was created on `ruby 2.7.2`. To run the solution only you have to run on console:

    ruby main.rb <red.txt> <name_node_start> <name
    _node_end> <color_train>
  
Where:

* `red.txt:` File that contains the metro red.

* `name_node_start:` Name of the station where the train start.

* `name_node_end:` Name of the station where the train finish.

* `color_train:` (Optional) Color of the metro.

----

On the other hand, if you want to run the test, first you must install the gem `test-unit`:

    gem install test-unit

Later, to run the tests you must run on console:

    ruby testing.rb

----

### Format of the file `red.txt`

In the first line indicates the number of stations of the red. For example:

    3
    A,none
    B,red
    C,green

This Indicate that exist three stations on the metro red. Later, the next lines indicate the specifications of each station: `name station, color station`. If the station not have color the file will indicates that the color it's `none`.

After that all stations, appears the connections between the stations. For example:

    2
    A,B
    B,C

The first line indicates that exists two edges. The first connection between the station A with B and finally the connection between B with C. 

Finally, the red file looks like this:

    3
    A,none
    B,red
    C,green
    2
    A,B
    B,C
