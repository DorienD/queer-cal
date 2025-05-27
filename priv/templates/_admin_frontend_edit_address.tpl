<div class="widget">
    <div class="widget-content">
        {# <p class="help-block" {% if not id.tz or id.tz == m.req.timezone %}style="display:none"{% endif %}>
            <i class="fa fa-exclamation-triangle"></i>
            {_ Showing dates in _}: <b class="rsc-timezone">{{ id.tz|escape }}</b>
        </p> #}

        <div class="date-range">
            <h2 class="h3">
                {_ Date & time _}
            </h2>
            <p class="helper-text">
                {_ The end date must be in the future relative to the start date.  _}
            </p>
            <fieldset>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label class="control-label">{_ Start date _} *</label>
                        <div>
                            {% include "_edit_date.tpl" date=id.date_start name="date_start" is_end=0 date_is_all_day=id.date_is_all_day is_editable=id.is_editable timezone=id.tz %}
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="control-label">{_ End date _} *</label>
                        <div>
                            {% include "_edit_date.tpl" date=id.date_end name="date_end" is_end=1 date_is_all_day=id.date_is_all_day  is_editable=id.is_editable timezone=id.tz %}
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <hr>

        <input type="hidden" name="address_country" value="nl">

        <h2 class="h3">
            {_ Location _}
        </h2>
        <div id="visit_address">
            <div class="form-group">
                <label class="control-label" for="address_title">{_ Title of the venue/location _}</label>
                <input class="form-control" id="address_title" type="text" name="address_title" placeholder="{_ eg. De Trut or Club Church _}" value="{{ id.address_title }}">
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label class="control-label" for="address_street_1">{_ Street _}</label>
                    <input class="form-control" id="address_street_1" type="text" name="address_street_1" value="{{ id.address_street_1 }}">
                </div>
                <div class="form-group col-md-6">
                    <label class="control-label" for="address_city">{_ City _}</label>
                    <input class="form-control" id="address_city" type="text" name="address_city" value="{{ id.address_city|default:"Amsterdam" }}">
                </div>
            </div>
        </div>

        <hr>


        <h2 class="h3">
            {_ Links _}
        </h2>
        <p class="helper-text">
            {_ A link will be added around the title of the event. The website link will have priority over Facebook or Instagram. _}
        </p>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label" for="website">{_ Website _}</label>
                    <input class="form-control" id="website" type="text" name="website" inputmode="url" value="{{ id.website }}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label" for="facebook">{_ Facebook link _}</label>
                    <input class="form-control" id="facebook" type="text" name="facebook" inputmode="url" value="{{ id.facebook }}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label" for="instagram">{_ Instagram link _}</label>
                    <input class="form-control" id="instagram" type="text" name="instagram" inputmode="url" value="{{ id.instagram }}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label" for="ticket_link">{_ Ticket link _} ({_ This will add a ticket button. _})</label>
                    <input class="form-control" id="ticket_link" type="text" name="ticket_link" inputmode="url" value="{{ id.ticket_link }}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label" for="signup_link">{_ Sign up link _} ({_ This will add a sign up button. _})</label>
                    <input class="form-control" id="signup_link" type="text" name="signup_link" inputmode="url" value="{{ id.signup_link }}">
                </div>
            </div>
        </div>
    </div>
</div>