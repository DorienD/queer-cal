{% for blk in id.blocks %}
    {% include ["blocks/_block_view_",blk.type,".tpl"]|join blk=blk id=id %}
{% endfor %}