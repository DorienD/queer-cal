-module(filter_unique_cities).

-export([unique_cities/2]).

-include_lib("zotonic_core/include/zotonic.hrl").

%% Get unique cities from a search result 
unique_cities(#search_result{result = Records}, Context) ->
    Cities0 = [ m_rsc:p(Id, <<"address_city">>, Context) || Id <- Records ],
    Cities  = [ City || City <- Cities0, City =/= undefined ],
    lists:usort(Cities).