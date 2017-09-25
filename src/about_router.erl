-module(about_router).
-export([init/2]).

init(Req, Page) ->
    AllHeaders = [erlang:time()] ++ cowboy_req:headers(Req),

    R = io_lib:format("~p",[AllHeaders]),
    B = lists:flatten(R),
    Bin = base64:encode(B),
    Title = "Mindsign : About",
    {ok, ResponseBody} = templates_about:render([{bin, Bin}, {title, Title}]),
    Reply = cowboy_req:reply(200, [{<<"content-type">>, <<"text/html">>}], ResponseBody, Req),
    {ok, Reply, Page}.
