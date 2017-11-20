<div class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label" for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div class="col-sm-9">
    <textarea
    	id="{{ field.name }}"
        name="{{ field.name }}"
        placeholder="{{ field.placeholder }}"
        {% if field.required %} required{% endif %}
        {% if field.readonly %} readonly{% endif %}
        {% if field.tooltip %} class="form-control hasTooltip" title="{{ field.tooltip }}" data-placement="right"{% else %} class="form-control"{% endif %}
    >{{ field.default }}</textarea>
  </div>
</div>