%%
%%  @author Warren Kenny
%%  @doc Application
%%
-module( cowboy_spurs_app ).
-behaviour( application ).

-export( [start/2, stop/1] ).

start( _StartType, _StartArgs ) ->
    cowboy_spurs_sup:start_link().

stop( _State ) ->
    ok.
