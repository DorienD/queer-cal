-module(queercal_ticket_warning).
-mod_depends([server_storage]).

-export([event/2]).

-include_lib("zotonic_core/include/zotonic.hrl").
  
event(#submit{message={set_skip_ticket_warning, TicketUrl}}, Context) ->
    Hide = z_context:get_q(<<"is_hide_disclaimer">>, Context),
    
    case Hide of
        <<"on">> ->
            z_notifier:first({server_storage, store, <<"skip_ticket_warning">>, true}, Context);
        _ ->
            ok
    end,
    z_render:wire([{redirect, TicketUrl}], Context).