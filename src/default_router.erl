-module(default_router).
-export([init/2]).

init(Req, Page) ->
    AllHeaders = [erlang:time()] ++ cowboy_req:headers(Req),

    R = io_lib:format("~p",[AllHeaders]),
    B = lists:flatten(R),
    Bin = base64:encode(B),

    {ok, ResponseBody} = templates_base:render([{bin, Bin}]),
    Reply = cowboy_req:reply(200, [{<<"content-type">>, <<"text/html">>}], ResponseBody, Req),
    {ok, Reply, Page}.
