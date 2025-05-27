{% extends "admin_edit_widget_std.tpl" %}

{# Show the edit fields to edit the name of a member event #}

{% block widget_title %}
    {% if q.z_delegate != "mod_admin_frontend" %}
        {_ Address _}
    {% endif %}
<div class="widget-header-tools"></div>
{% endblock %}

{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}content-address{% endblock %}

{% block widget_content %}
    {# {% debug %} #}

    {% if q.z_delegate == "mod_admin_frontend" %}
        <p class="help-block" {% if not id.tz or id.tz == m.req.timezone %}style="display:none"{% endif %}>
            <i class="fa fa-exclamation-triangle"></i>
            {_ Showing dates in _}: <b class="rsc-timezone">{{ id.tz|escape }}</b>
        </p>

        <div class="date-range">
            <fieldset>
                <div class="checkbox">
                    <label>
                        <input name="date_is_all_day" id="{{ #all_day }}" type="checkbox" {% if id.date_is_all_day %}checked{% endif %}> {_ All day event _}
                    </label>
                </div>

                {% javascript %}
                    $("#{{ #all_day }}").on('change', function() {
                        var $times = $(this).closest('.date-range').find("input[type='time']");
                        if ($(this).is(":checked"))
                            $times.fadeOut("fast").val('');
                        else
                            $times.fadeIn("fast");
                    });
                {% endjavascript %}
                <div class="row">
                    <div class="col-sm-6">
                        <label class="control-label">{_ From _}</label>
                        <div>
                            {% include "_edit_date.tpl" date=id.date_start name="date_start" is_end=0 date_is_all_day=id.date_is_all_day is_editable=id.is_editable timezone=id.tz %}
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label class="control-label">{_ Till _}</label>
                        <div>
                            {% include "_edit_date.tpl" date=id.date_end name="date_end" is_end=1 date_is_all_day=id.date_is_all_day  is_editable=id.is_editable timezone=id.tz %}
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <hr>
    {% endif %}

    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <label class="control-label" for="website">{_ Website _}</label>
                <input class="form-control" id="website" type="text" name="website" inputmode="url" value="{{ id.website }}">
            </div>
            <div class="form-group">
                <label class="control-label" for="signup_link">{_ Sign up link _} ({_ This will add a sign up button. _})</label>
                <input class="form-control" id="signup_link" type="text" name="signup_link" inputmode="url" value="{{ id.signup_link }}">
            </div>
        </div>
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <label class="control-label" for="ticket_link">{_ Ticket link _}</label>
                <input class="form-control" id="ticket_link" type="text" name="ticket_link" inputmode="url" value="{{ id.ticket_link }}">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <label class="control-label" for="facebook">{_ Facebook _}</label>
                <input class="form-control" id="facebook" type="text" name="facebook" inputmode="url" value="{{ id.facebook }}">
            </div>
        </div>
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <label class="control-label" for="instagram">{_ Instagram _}</label>
                <input class="form-control" id="instagram" type="text" name="instagram" inputmode="url" value="{{ id.instagram }}">
            </div>
        </div>
    </div>

    <hr>

    <input type="hidden" name="address_country" value="nl">

    <div id="visit_address">
        <div class="form-group">
            <label class="control-label" for="address_title">{_ Title of the venue/location _}</label>
            <input class="form-control" id="address_title" type="text" name="address_title" value="{{ id.address_title }}">
        </div>

        <div class="form-group">
            <label class="control-label" for="address_street_1">{_ Street Line 1 _}</label>
            <input class="form-control" id="address_street_1" type="text" name="address_street_1" value="{{ id.address_street_1 }}">
        </div>

        <div class="row">
            <div class="form-group col-lg-6 col-md-6">
                <label class="control-label" for="address_city">{_ City _}</label>
                <input class="form-control" id="address_city" type="text" name="address_city" value="{{ id.address_city }}">
            </div>

            <div class="form-group col-lg-6 col-md-6">
                <label class="control-label" for="address_postcode">{_ Postcode _}</label>
                <input class="form-control" id="address_postcode" type="text" name="address_postcode" value="{{ id.address_postcode }}">
            </div>
        </div>
    </div>
{% endblock %}
