%% @author Dorien Drees <dorien.drees@gmail.com> & Marc Worrell <marc@worrell.nl>
%% @copyright 2024
%% @doc Main datamodel and code for Queer Calendar

-module(queercal).
-author("Dorien").

% Module attributes - shown in the /admin/modules interface.
-mod_title("Queer Calendar").
-mod_description("Site code for Queer Calendar").

% The priority of the module. Higher is lower priority, default
% is 500. As a site module should overrule any defaults in
% Zotonic modules the priority is set to 10. Lower is reserved
% for special modules that might be added later.
-mod_prio(10).

% The datamodel version, as used by the z_module_manager to call
% the manage_schema function.
-mod_schema(1).

% Modules that should be started before this module
% In this case 'acl' as an edge to 'acl_user_group_managers' is
% added in the manage_schema/2 function.
% 'acl' is provided by the mod_acl_user_groups and other modules
% that implement access control.
% 'mod_menu' is installs the main_menu, which is updated in manage_data.
-mod_depends([
    acl,
    mod_content_groups,
    mod_translation,
    mod_menu
]).

% Exports - if exports change then the module is restarted after
% compilation.
-export([
    manage_schema/2,
    manage_data/2
    ]).

-include_lib("zotonic_core/include/zotonic.hrl").

%%====================================================================
%% support functions go here
%%====================================================================

%% Install or update the schema, runs in a database transaction.
manage_schema(_Version, Context) ->
    mod_translation:set_default_language(nl, Context),
    mod_translation:language_add(nl, true, Context),
    mod_translation:language_add(en, true, Context),
    queercal_fixtures:datamodel(Context).

%% This function runs after the schema is installed or updated. Runs
%% after the manage_schame transaction has been committed.
-spec manage_data( z_module_manager:manage_schema(), z:context() ) -> ok.
manage_data(_Version, Context) ->
    queercal_fixtures:install_acl_rules(Context),
    queercal_fixtures:maybe_update_fixtures(Context).

