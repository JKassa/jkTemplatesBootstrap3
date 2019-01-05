<div class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label" for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div class="col-sm-9 hasTooltip"{% if field.tooltip %} title="{{ field.tooltip }}" data-placement="right"{% endif %}>
    {% if field.required %}
      {% assign options = 'required' | arrayCombine: '' %}
      {{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter, options }}
    {% else %}
      {{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter }}
    {% endif %}
  </div>
</div>
<script type="text/javascript">
	jQuery('.field-calendar > div').addClass('input-group');
	jQuery('#{{ field.name }}').addClass('form-control');
	jQuery('#{{ field.name }}_btn').wrap('<span class="input-group-btn"></span>');
	jQuery('.icon-calendar').addClass('glyphicon glyphicon-calendar');
</script>