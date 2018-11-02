<div class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label" for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div class="col-sm-9 hasTooltip"{% if field.tooltip %} title="{{ field.tooltip }}" data-placement="right"{% endif %}>
    {% if field.required %}
      {% assign options = 'required' | arrayCombine: 'required' %}
      {{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter, options }}
    {% else %}
      {{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter }}
    {% endif %}
  </div>
</div>