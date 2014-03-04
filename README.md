Orbit
-----------

Introduction
------------
Given a space X, a list of generators f_1,...,f_n : X -> X and an initial vertex x_0 : X, the /orbit problem/ is to compute the least subset Orb of X such that Orb contains x_0 and is closed under all generators.

The orbit implementation presented here is specialised to the case where the space X is a finite subset of the natural numbers. For the purpose of benchmarking, the generators perform some deliberately irregular
computation (by calling a naive recursive implementation of Fibonacci).

ARCHITECTURE

This orbit implementation operates on a distributed hash table. It follows a master/worker architecture, where each worker hosts a chunk of the hash table; the master simply initiates the computation
and waits for termination.

How to build and run Orbit
----------------------------------------

There are two ways to run the benchmark. .

* Run on the local node (`nonode@nohost`):

		$ git clone git://github.com/amirghaffari/Orbit
		$ Orbit
		$ ./run

The config file for a local run is `bench.config`. After finishing the benchmark, the results are shown on screen. 

* To run the benchmark on a cluster, you need to specify the cluster information (such as number of nodes, nodes name, number of experiments,and path where Erlang has been installed) in both files: `run.sh` and `experiment.sh`

		$ git clone git://github.com/amirghaffari/Orbit
		$ Orbit
		$ ./run.sh

The config file for clusters is `template.config`. After finishing the benchmark, the results are saved in `results` directory.

