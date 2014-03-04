
%% starts the benchmark
%%
%% Author: Amir Ghaffari <Amir.Ghaffari@glasgow.ac.uk>
%%
%% RELEASE project (http://www.release-project.eu/)
%%

-module(init_bench).

-export([main/0]).

main() ->
    G=fun bench:g12345/1, 
    N= 1000000, %% calculates Orbit for 0..N
    P= 40, %% Naumber of worker processes on each node
    Nodes=config:get_key(nodes), %% Loads list of node names from config file
    Start = now(),
	bench:dist(G,N,P,Nodes),
    LapsedUs = timer:now_diff(now(), Start),
    io:format("N:~p  ---- Num process: ~p  --- Num Nodes: ~p \n",[N, P, length(Nodes)]),
    io:format("Elapsed time in total (microseconds): ~p \n",[LapsedUs]). %microseconds

