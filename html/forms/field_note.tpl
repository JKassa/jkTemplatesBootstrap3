{% case field.default %}
	{% when 'message' %}
		{% assign class = ' alert-success' %}
	{% when 'notice' %}
		{% assign class = ' alert-info' %}
    {% when 'warning' %}
		{% assign class = ' alert-warning' %}
	{% when 'error' %}
		{% assign class = ' alert-danger' %}
	{% else %}
		{% assign class = ' alert-warning' %}
{% endcase %}
<div class="form-group m-b-0"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <div class="alert{{ class }}" role="alert" style="margin-right: 15px;">
    {% if field.label %}<h4>{{ field.label }}</h4>{% endif %}
    {{ field.tooltip }}
  </div>
</div>