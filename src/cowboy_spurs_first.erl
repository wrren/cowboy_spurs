-module( cowboy_spurs_first ).
-author( "Warren Kenny <warren.kenny@gmail.com>" ).
-export( [execute/2] ).

%%
%%	@doc First middleware component. Should be set as the first middleware in the overall chain. 
%%	Inserts a timestamp into the middleware environment that marks the beginning of a request.
%%
-spec execute( cowboy:req(), cowboy_middleware:env() ) -> 
	{ ok, cowboy:req(), cowboy_middleware:env() } 	|
	{ suspend, module(), atom(), [any()] } 			|
	{ stop, cowboy:req() }.
execute( Req, Env ) ->
	{ ok, Req, Env#{ spur_start => erlang:monotonic_time( micro_seconds ) } }.