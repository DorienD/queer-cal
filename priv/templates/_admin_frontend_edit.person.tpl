{% extends "_admin_frontend_edit.tpl" %}

{% block rscform %}
<div class="edit-container">
    <div class="edit-container__content">
        {% if id.exists %}
            {% with id.is_editable as is_editable %}
            {% with id.is_a|default:(m.category[cat].is_a) as cats %}
            {% wire id="rscform"
                    type="submit"
                    postback={rscform view_location=view_location cat=cat id=id}
                    delegate=`controller_admin_edit`
            %}

            <form id="rscform" method="post" action="postback" class="form do_formdirty">
                <input type="hidden" name="id" value="{{ id }}" />
                
                <div id="poststuff">
                    {% block edit_blocks %}
                        <div class="widget">
                            <div class="widget-content">
                                <h2>{_ Profile _}</h2>
                                <p>{_ You can edit your name here, this is only used on your profile page. _}</p>
                                <fieldset>
                                    <div class="row">
                                        <div class="form-group col-lg-4 col-md-4 label-floating">
                                            <input class="form-control" id="name_first" type="text" name="name_first" value="{{ id.name_first }}" placeholder="{_ First _}">
                                            <label class="control-label" for="name_first">{_ First _}</label>
                                        </div>

                                        <div class="form-group col-lg-2 col-md-2 label-floating">
                                            <input class="form-control" id="name_surname_prefix" type="text" name="name_surname_prefix" value="{{ id.name_surname_prefix }}" placeholder="{_ Sur. prefix _}">
                                            <label class="control-label" for="name_surname_prefix">{_ Sur. prefix _}</label>
                                        </div>
                                        
                                        <div class="form-group col-lg-4 col-md-4 label-floating">
                                            <input class="form-control" id="name_surname" type="text" name="name_surname" value="{{ id.name_surname }}" placeholder="{_ Surname _}">
                                            <label class="control-label" for="name_surname">{_ Surname _}</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="widget-content">
                                <fieldset class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                            <h2>{_ Two factor authentication _}</h2>

                                            <p>{_ Add 2FA for extra security on your profile. _}</p>

                                            {% if m.acl.is_allowed.use.mod_admin_identity or id == m.acl.user %}
                                                <div class="form-group">
                                                    <div id="auth2fa">
                                                        {% live template="_auth2fa_user_actions.tpl" id=id topic=[ "bridge", "origin", "model", "identity", "event", id, "#" ] %}
                                                    </div>
                                                </div>
                                            {% endif %}
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="widget-content">
                                <p class="text-muted">{_ For deletion of your profile, please contact: _} <a href="mailto:events@queer-kalender.nl">events@queer-kalender.nl</a></p>
                            </div>
                        </div>

                    {% endblock %}
                </div>
                {% block meta_panels %}{% endblock %}

                {# Hidden safe buttons and publish state - controlled via the nabvar #}
                <div style="display: none">
                    <span id="button-prompt">
                        {% block nav_prompt %}
                            {{ id.category_id.title }}
                        {% endblock %}
                    </span>

                    {% block buttons %}
                        {% button type="submit" id="save_stay" class="btn btn-primary" text=_"Save" title=_"Save this page." disabled=not id.is_editable %}

                        {% if id.is_editable %}
                            {% button type="submit" id="save_view" class="btn btn-default" text=_"Save &amp; view" title=_"Save and view the page." %}
                        {% elseif id %}
                            {% button id="save_view" class="btn btn-primary" text=_"View" title=_"View this page." action={redirect id=id} %}
                        {% endif %}
                    {% endblock %}
                </div>
            </form>
            {% endwith %}
            {% endwith %}
        {% else %}
            <h1 class="text-muted">{_ No page _}</h1>
            <p class="text-muted">
                {_ The page might have been deleted. _}
            </p>
        {% endif %}
    </div>
</div>
{% endblock %}