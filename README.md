cowboy_spurs
=====

Middleware for Erlang Cowboy applications that measures the time for incoming requests to be completed. To use, insert
```cowboy_spurs_first``` as the first middleware module in your application's ```middlewares``` configuration and
```cowboy_spurs_last``` as the last. Each completed timing measurement generates a gen_event event notification through
the ```cowboy_spurs_events``` gen_event process with the following signature: ```{ request, Req :: cowboy:req(), MicroSeconds :: integer() }```. 

Build
-----

    $ rebar3 compile


Install
-------

Add to your rebar dependencies:

```erlang

{ deps, [
	{ cowboy_spurs, 		".*", 	{ git, "git://github.com/wrren/cowboy_spurs.erl", { branch, "master" } } }	
] }.

```


Usage
-----

Add a handler to the ```cowboy_spurs_events``` gen_event process and record profiling information for events using an appropriate
storage or calculation method, such as statsD.