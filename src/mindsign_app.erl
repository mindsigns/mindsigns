-module(mindsign_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, _StartArgs) ->
    {ok, _} = mindsign:http_start(),
    mindsign_sup:start_link().

stop(_State) ->
    ok.
