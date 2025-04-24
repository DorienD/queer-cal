-module(queercal_fixtures).

-export([
    datamodel/1
]).

-include_lib("zotonic_core/include/zotonic.hrl").

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
            }, [{event,location}]}
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
        ] ++ testdata(Env),
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
        % {project1, depiction, media_project_1},
        % {project1, depiction, media_project_2},
        % {project1, depiction, media_project_3},
        % {project1, depiction, media_project_4},
        % {project1, depiction, media_project_5}
        
    ];
testedges(_) ->
    [].

