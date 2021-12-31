# Buda exercise - Metro

This is an exercise of a metro network and consist on search the best road between two stations.

-------

First, the solution was created on `ruby 2.7.2`. To run the solution you have to run on console:

    ruby main.rb <red.txt> <name_node_start> <name
    _node_end> <color_train>
  
Where:

* `red.txt:` File that contains the metro network.

* `name_node_start:` Name of the station where the train start.

* `name_node_end:` Name of the station where the train finish.

* `color_train:` (Optional) Color of the metro.

----

On the other hand, if you want to run the test, you must previously install the gem `test-unit`:

    gem install test-unit

Later, to run the tests you must run on console:

    ruby testing.rb

----

### `red.txt` File Format

The first line indicates the number of stations of the network. For example:

    3
    A,none
    B,red
    C,green

That will indicate the existence of three stations on the metro network. Later, the next lines indicate the specifications of each station: `name station, color station`. If the station does not have a color, the file will indicates that the color it's `none`.

After declaring the stations, we continue to declaring the connections between the stations. For example:

    2
    A,B
    B,C

The first line indicates that exists two edges. The first connection between the station A with B and finally the connection between B with C. 

Finally, the `red.txt` looks like this:

    3
    A,none
    B,red
    C,green
    2
    A,B
    B,C
