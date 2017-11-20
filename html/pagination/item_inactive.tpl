<li class="{% if action == 'base' %}active{% else %}disabled{% endif %}">
  <a href="javascript:;">
    {% case action %}
    {% when 'start' %}
    <span class="glyphicon glyphicon-backward"></span>
    {% when 'previous' %}
    <span class="glyphicon glyphicon-chevron-left"></span>
    {% when 'next' %}
    <span class="glyphicon glyphicon-chevron-right"></span>
    {% when 'end' %}
    <span class="glyphicon glyphicon-forward"></span>
    {% else %}
    {{ text }}
    {% endcase %}
  </a>
</li>