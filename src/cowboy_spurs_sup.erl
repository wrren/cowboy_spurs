%%
%%  @author Warren Kenny
%%  @doc Application Supervisor. Starts the spurs event manager.
%%
-module( cowboy_spurs_sup ).
-behaviour( supervisor ).
-export( [start_link/0] ).
-export( [init/1] ).

-define( SERVER, ?MODULE ).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init( [] ) ->
    { ok, { { one_for_all, 0, 1 }, [
        #{  id      => cowboy_spurs_events,
            start   => { gen_event, start_link, [{ local, cowboy_spurs_events }] },
            modules => dynamic
        }
    ] } }.