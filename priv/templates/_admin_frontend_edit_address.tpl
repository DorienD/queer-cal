<div class="widget">
    <div class="widget-content">
        <div class="date-range">
            <h2 class="h3">
                {_ Date & time _}
            </h2>

            <p class="helper-text">
                {_ The end date must be in the future relative to the start date.  _}
            </p>

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

                <div class="row recurring">
                    <div class="form-group col-sm-12">
                        <div class="c-custom-toggle">
                            <input type="checkbox" id="recurring" value="1"><label for="recurring"><span></span> {_ Recurring event? _}</label>
                        </div>
                    </div>
                    
                </div>
                <div class="row recurring-date-edit">
                    <div class="form-group col-sm-12">
                        <h3>{_ Recurrence _}</h3>
                        <label for="recurring_weekly">
                            Weekly
                            <input type="radio" id="recurring_weekly" name="recurring_step" value="weekly">
                        </label>
                        <label for="recurring_monthly">
                            Monthly
                            <input type="radio" id="recurring_monthly" name="recurring_step" value="monthly">
                        </label>
                    </div>
                    <div class="form-group col-sm-12">
                        <h3>{_ Pattern _}</h3>
                        <p>
                            {_ Every _} <input type="number" name="recurring_step_int"> week or month on
                        </p>
                        <p>
                            <label for="recurring_day_monday"><input type="radio" id="recurring_day_monday" name="recurring_day"> {_ Monday _}</label>
                            <label for="recurring_day_tuesday"><input type="radio" id="recurring_day_tuesday" name="recurring_day"> {_ Tuesday _}</label>
                            <label for="recurring_day_wednesday"><input type="radio" id="recurring_day_wednesday" name="recurring_day"> {_ Wednesday _}</label>
                            <label for="recurring_day_thursday"><input type="radio" id="recurring_day_thursday" name="recurring_day"> {_ Thursday _}</label>
                            <label for="recurring_day_friday"><input type="radio" id="recurring_day_friday" name="recurring_day"> {_ Friday _}</label>
                            <label for="recurring_day_saturday"><input type="radio" id="recurring_day_saturday" name="recurring_day"> {_ Saturday _}</label>
                            <label for="recurring_day_sunday"><input type="radio" id="recurring_day_sunday" name="recurring_day"> {_ Sunday _}</label>
                        </p>
                        <p>
                            <h3>{_ Ending _}</h3>
                            <label>
                                <input type="radio" name="recurring_end" value="no_end"> No end
                            </label>
                            <label>
                                <input type="radio" name="recurring_end" value="end_date"> End by
                                <input type="date">
                            </label>
                            <label>
                                <input type="radio" name="recurring_end" value="end_ocurrences"> {_ End after _}
                                <input type="number" name="end_ocurrences_int"> occurences
                            </label>
                        </p>
                    </div>

                </div>
            </fieldset>

            <p class="help-block" {% if not id.tz or id.tz == m.req.timezone %}style="display:none"{% endif %}>
                <i class="fa fa-exclamation-triangle"></i>
                {_ Showing dates in _}: <b class="rsc-timezone">{{ id.tz|escape }}</b>
            </p>
        </div>

        <hr>

        <input type="hidden" name="address_country" value="nl">

        <h2 class="h3">
            {_ Location _}
        </h2>
        <div id="visit_address">
            <div class="form-group">
                <label class="control-label" for="org_title">{_ Organisation name _} ({_ Not required _})</label>
                <input class="form-control" id="org_title" type="text" name="org_title" value="{{ id.org_title }}">
            </div>

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
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label" for="ticket_url">{_ Ticket link _}</label>
                    <input class="form-control" id="ticket_url" type="text" name="ticket_url" inputmode="url" value="{{ id.ticket_url|default:id.ticket_link }}">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label" for="signup_url">{_ Sign up link _} ({_ This will add a sign up button. _})</label>
                    <input class="form-control" id="signup_url" type="text" name="signup_url" inputmode="url" value="{{ id.signup_url|default:id.signup_link }}">
                </div>
            </div>
        </div>
    </div>
</div>