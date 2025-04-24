{% extends "admin_edit_widget_std.tpl" %}

{# Show the edit fields to edit the name of a member event #}

{% block widget_title %}
{_ Address _}
<div class="widget-header-tools"></div>
{% endblock %}

{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}content-address{% endblock %}

{% block widget_content %}
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group label-floating">
                    <input class="form-control" id="phone" type="text" name="phone" inputmode="tel" value="{{ id.phone }}" placeholder="{_ Telephone _}">
                <label class="control-label" for="phone">{_ Telephone _}</label>
            </div>
        </div>
        <div class="col-lg-6 col-md-6">
            <div class="form-group label-floating">
                <input class="form-control" id="website" type="text" name="website" inputmode="url" value="{{ id.website }}" placeholder="{_ Website _} {_ (public) _}">
                <label class="control-label" for="website">{_ Website _}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group label-floating">
                <input class="form-control" id="youtube" type="text" name="youtube" inputmode="url" value="{{ id.youtube }}" placeholder="{_ Youtube _}">
                <label class="control-label" for="youtube">{_ Youtube _} </label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group label-floating">
                <input class="form-control" id="facebook" type="text" name="facebook" inputmode="url" value="{{ id.facebook }}" placeholder="{_ Facebook _}">
                <label class="control-label" for="facebook">{_ Facebook _}</label>
            </div>
        </div>
        <div class="col-lg-6 col-md-6">
            <div class="form-group label-floating">
                <input class="form-control" id="instagram" type="text" name="instagram" inputmode="url" value="{{ id.instagram }}" placeholder="{_ Instagram _}">
                <label class="control-label" for="instagram">{_ Instagram _}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group label-floating">
                <input class="form-control" id="tickets" type="text" name="tickets" inputmode="url" value="{{ id.tickets }}" placeholder="{_ Tickets _}">
                <label class="control-label" for="tickets">{_ Tickets _}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            {% include "_admin_edit_content_address_email.tpl" %}
        </div>
    </div>
    <br>
    <div class="form-group">
        <div class="widget-section-header">{_ Address _}</div>
    </div>

    <input type="hidden" name="address_country" value="nl">

    {# <div class="form-group label-floating">
        {% if m.modules.active.mod_l10n %}
            <select class="form-control" id="address_country" name="address_country">
                <option value=""></option>
                {% optional include "_l10n_country_options.tpl" country=id.address_country %}
            </select>
        {% else %}
            <input class="form-control" id="address_country" type="text" name="address_country" value="{{ id.address_country }}" placeholder="{_ Country _}">
        {% endif %}
        <label class="control-label" for="address_country">{_ Country _}</label>
    </div> #}

    <div id="visit_address">
        <div class="form-group label-floating">
            <input class="form-control" id="address_title" type="text" name="address_title" value="{{ id.address_title }}" placeholder="{_ Title of venue _}">
            <label class="control-label" for="address_title">{_ Title of the venue/location _}</label>
        </div>

        <div class="form-group label-floating">
            <input class="form-control" id="address_street_1" type="text" name="address_street_1" value="{{ id.address_street_1 }}" placeholder="{_ Street Line 1 _}">
            <label class="control-label" for="address_street_1">{_ Street Line 1 _}</label>
        </div>

        <div class="row">
            <div class="form-group col-lg-6 col-md-6 label-floating">
                <input class="form-control" id="address_city" type="text" name="address_city" value="{{ id.address_city }}" placeholder="{_ City _}">
                <label class="control-label" for="address_city">{_ City _}</label>
            </div>

            <div class="form-group col-lg-6 col-md-6 label-floating">
                <input class="form-control" id="address_postcode" type="text" name="address_postcode" value="{{ id.address_postcode }}" placeholder="{_ Postcode _}">
                <label class="control-label" for="address_postcode">{_ Postcode _}</label>
            </div>
        </div>
    </div>
{% endblock %}
