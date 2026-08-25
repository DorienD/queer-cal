<div class="widget c-widget">
    <div class="widget-content">
        <input type="hidden" name="address_country" value="nl">

        <h2 class="h3">{_ Location _} <sup>*</sup></h2>

        <p class="helper-text">
            {_ Find the location in our database or add it below _}
        </p>
        
        {% live template="_admin_edit_content_page_connections_list.tpl"
            topic={object id=id predicate="haslocation"}
            id=id
            predicate="haslocation"|as_atom
            button_label=_'Find location'
            button_class='c-btn c-btn-primary'
            dialog_title_add=dialog_title_add
            callback=callback
            action=action
            nocatselect
            cat=m.rsc.location.id
            content_group=content_group
            unlink_action=unlink_action
            undo_message_id="unlink-undo-message"
            list_id=list_id
            tabs_enabled=["find"]
            dialog_title_add=_"Connect a location"
        %}

        <br>

        <div id="visit_address" class="c-widget__form">
            <p class="helper-text"><strong>{_ Add a new location _}</strong></p>

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
                    <input class="form-control" id="address_city" type="text" disabled name="address_city" value="{{ id.address_city|default:"Amsterdam" }}">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="widget c-widget">
    <div class="widget-content">
        <h2 class="h3">{_ Organisation _}</h2>

        <p class="helper-text">
            {_ Find the organisation in our database or add it below _}
        </p>
        
        {% live template="_admin_edit_content_page_connections_list.tpl"
            topic={object id=id predicate="hasorganisation"}
            id=id
            predicate="hasorganisation"|as_atom
            button_label=_'Find organisation'
            button_class='c-btn c-btn-primary'
            dialog_title_add=dialog_title_add
            callback=callback
            action=action
            nocatselect
            cat=m.rsc.organisation.id
            content_group=content_group
            unlink_action=unlink_action
            undo_message_id="unlink-undo-message"
            list_id=list_id
            tabs_enabled=["find"]
            dialog_title_add=_"Connect a organisation"
        %}

        <br>

        <div class="c-widget__form">

            <p class="helper-text"><strong>{_ Add a new organisation _}</strong></p>

            <div class="form-group">
                <label class="control-label" for="org_title">{_ Organisation name _}</label>
                <input class="form-control" id="org_title" type="text" name="org_title" value="{{ id.org_title }}">
            </div>
        </div>
    </div>
</div>


<div class="widget">
    <div class="widget-content">
        <h2 class="h3">
            {_ Links _}
        </h2>
        <p class="helper-text">
            {_ A link will be added around the title of the event. _}
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

                {# <div class="form-group">
                    <label class="control-label" for="ticket_link">{_ Ticket link old _}</label>
                    <input class="form-control" id="ticket_link" type="text" name="ticket_link" inputmode="url" value="{{ id.ticket_link }}">
                </div> #}
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

<div class="widget">
    <div class="widget-content">
        <h2 class="h3">{_ Keywords _} <sup>*</sup></h2>

        <p class="helper-text">
            {_ Add at least one keyword to your event. _}
        </p>
        
        {% live template="_admin_edit_content_page_connections_list.tpl"
            topic={object id=id predicate="subject"}
            id=id
            predicate="subject"|as_atom
            button_label='Add keywords'
            button_class='c-btn c-btn-primary'
            dialog_title_add=dialog_title_add
            callback=callback
            action=action
            nocatselect
            cat=m.rsc.organisation.id
            content_group=content_group
            unlink_action=unlink_action
            undo_message_id="unlink-undo-message"
            list_id=list_id
            tabs_enabled=["find"]
            dialog_title_add=_"Add keywords"
        %}

        <div class="form-group">
            <input type="hidden" id="check-subject" value="subject" form="rscform">
            {% validate id="check-subject"
                        type={hasedge id=id minimum=1}
                        only_on_submit
            %}
            <p class="if-has-error" style="display: none">{_ You must have at least one keyword. _}</p>
        </div>

        <p class="helper-text">
            <small>{_ Missing a keyword? Please send them to _} <a href="mailto:event@queer-kalender.nl">event@queer-kalender.nl</a>.</small>
        </p>
    </div>
</div>