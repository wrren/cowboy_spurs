-module( cowboy_spurs_last ).
-author( "Warren Kenny <warren.kenny@gmail.com>" ).
-export( [execute/2] ).

%%
%%	@doc Last middleware component. Should be set as the last middleware in the overall chain. 
%%	Extracts the timestamp inserted by cowboy_spurs_first and generates an event which will
%%	be broadcast through the cowboy_spurs_events gen_event.
%%
-spec execute( cowboy:req(), cowboy_middleware:env() ) -> 
	{ ok, cowboy:req(), cowboy_middleware:env() } 	|
	{ suspend, module(), atom(), [any()] } 			|
	{ stop, cowboy:req() }.
execute( Req, Env ) ->
	case proplists:get_value( spur_start, Env ) of
		undefined -> 
			{ ok, Req, Env };
		Start ->
			MicroSeconds = erlang:monotonic_time( micro_seconds ) - Start,
			gen_event:notify( cowboy_spurs_events, { request, Req, MicroSeconds } ),
			{ ok, Req, Env }
	end.
