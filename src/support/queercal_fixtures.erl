-module(queercal_fixtures).

-export([
    datamodel/1,
    maybe_update_fixtures/1,
    install_acl_rules/1
]).

-include_lib("zotonic_core/include/zotonic.hrl").

maybe_update_fixtures(Context) ->
    lists:foreach(
        fun({Name, Cat, _Props}) ->
            case m_rsc:is_a(Name, Cat, Context) of
                true ->
                    ok;
                false ->
                    m_rsc:update(Name, #{ <<"category_id">> => Cat }, z_acl:sudo(Context))
            end
        end,
        keywords()).

datamodel(Context) ->
    Env = m_config:get_value(site, environment, Context),
    #datamodel{
        categories = [
            % {project, undefined, #{
            %     <<"language">> => [ nl ],
            %     <<"title">> => #trans{ tr = [
            %         {nl, <<"Project">>}
            %     ]}
            % }}
        ],
        predicates = [
            {haslocation, #{
                <<"language">> => [ en, nl ],
                <<"title">> => #trans{ tr = [
                    {en, <<"Location">>},
                    {nl, <<"Lokatie">>}
                ]}
            }, [{event,location}]},
            {hasorganisation, #{
                <<"language">> => [ en, nl ],
                <<"title">> => #trans{ tr = [
                    {en, <<"Organisation">>},
                    {nl, <<"Organisatie">>}
                ]}
            }, [{event,organization}]}
        ],
        resources = [
            % {overview_events, query, #{
            %     <<"language">> => [ en, nl ],
            %     <<"title">> => #trans{ tr = [
            %         {en, <<"Events">>},
            %         {nl, <<"Evenementen">>}
            %     ]},
            %     <<"query">> => <<"cat='event'\n
            %                 is_published=1\n
            %                 sort=rsc.publication_start">>
            %     }
            % },
            {page_home, collection, #{
                <<"language">> => [ nl ],
                <<"title">> => #trans{ tr = [
                    {nl, <<"Home">>}
                ]}
            }},
            {page_about, text, #{
                <<"language">> => [ nl ],
                <<"title">> => #trans{ tr = [
                    {nl, <<"Over ons">>}
                ]}
            }},
            {page_contact, text, #{
                <<"language">> => [ nl ],
                <<"title">> => #trans{ tr = [
                    {nl, <<"Contact">>}
                ]}
            }}
        ] ++ keywords()
        ++ testdata(Env),
        media = [] ++ testmedia(Env),
        edges = [
        ] 
        ++ testedges(Env)
    }.


testdata(development) ->
    [
        % {project1, project, [
        %     {title, <<"Wandkast met opklapbaar bed">>}
        % ]}
    ];
testdata(_) ->
    [].


% %% MEDIA - the files can be found in priv/schema_data
% %%         the exact category (image, video, audio, document) is derived from the media file or url.
testmedia(development) ->
    [
        % This is a tuple {unique_name, filename, properties}
        % {media_project_1, "image-1.jpg", #{
        %     <<"title">> => <<"Image 1">>
        % }},
        % {media_project_2, "image-2.jpg", #{
        %     <<"title">> => <<"Image 2">>
        % }},
        % {media_project_3, "image-3.jpg", #{
        %     <<"title">> => <<"Image 3">>
        % }},
        % {media_project_4, "image-4.jpg", #{
        %     <<"title">> => <<"Image 4">>
        % }},
        % {media_project_5, "image-5.jpg", #{
        %     <<"title">> => <<"Image 5">>
        % }}
    ];
testmedia(_) ->
    [].

testedges(development) ->
    [
        % {project1, hassubject, keyword_closets},
    ];
testedges(_) ->
    [].

keywords() ->
    lists:map(
        fun({En, Nl}) ->
            Name = binary_to_atom(<<"keyword_", (z_string:to_name(En))/binary>>),
            {Name, keyword, #{
                <<"language">> => [ en, nl ],
                <<"is_published">> => true,
                <<"title">> => #trans{ tr=[
                        {en, En},
                        {nl, Nl}
                    ]}
                }
            }
        end,
        keyword_list()).

keyword_list() ->
    [
        {<<"FLINTA">>, <<"FLINTA">>},
        {<<"Workshop">>, <<"Workshop">>},
        {<<"Community">>, <<"Community">>},
        {<<"Dark room">>, <<"Dark room">>},
        {<<"Party">>, <<"Feest">>},
        {<<"Demonstration">>, <<"Demonstratie">>},
        {<<"Sober">>, <<"Nuchter">>},
        {<<"Open mic">>, <<"Open mic">>},
        {<<"Exhibition">>, <<"Tentoonstelling">>},
        {<<"Screening">>, <<"Vertoning">>},
        {<<"Fundraiser">>, <<"Benefiet">>},
        {<<"Talk">>, <<"Lezing">>},
        {<<"Political">>, <<"Politiek">>},
        {<<"Donation-based">>, <<"Op donatiebasis">>},
        {<<"BIPOC">>, <<"BIPOC">>},
        {<<"Performance">>, <<"Performance">>},
        {<<"No phone">>, <<"Geen telefoon">>},
        {<<"Kink">>, <<"Kink">>},
        {<<"Drag">>, <<"Drag">>},
        {<<"Child friendly">>, <<"Kindvriendelijk">>},
        {<<"Free">>, <<"Gratis">>},
        {<<"Networking">>, <<"Netwerken">>},
        {<<"Open air">>, <<"Openlucht">>},
        {<<"Festival">>, <<"Festival">>},
        {<<"Trans">>, <<"Trans">>},
        {<<"Family">>, <<"Familie">>},
        {<<"Voku">>, <<"Voku">>},
        {<<"Queer">>, <<"Queer">>},
        {<<"Sports">>, <<"Sport">>}
    ].

install_acl_rules(Context) -> 
    Rules = [
        {rsc, [
            {acl_user_group_id, acl_user_group_members},
            {actions, [view]},
            {is_owner, true}
            
        ]},
        {rsc, [
            {acl_user_group_id, acl_user_group_members},
            {content_group_id, default_content_group},
            {actions, [view, update, delete, link]},
            {is_owner, true}
            
        ]},

        %% Members can add events

        {rsc, [
            {acl_user_group_id, acl_user_group_members},
            {content_group_id, default_content_group},
            {actions, [insert]},
            {category_id, event}
        ]},


        %% Modules
        {module, [
            {acl_user_group_id, acl_user_group_members},
            {actions, [use]},
            {module, mod_admin_frontend}
        ]}
    ],
    m_acl_rule:replace_managed(Rules, queercal, Context).