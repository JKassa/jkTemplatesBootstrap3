<div class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label" for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div class="col-sm-9">
    <input
    	type="text"
        id="{{ field.name }}"
        name="{{ field.name }}"
        value="{{ field.default }}"
        {% if field.placeholder %} placeholder="{{ field.placeholder }}"{% endif %}
        {% if field.required %} required{% endif %}
        {% if field.readonly %} readonly{% endif %}
        {% if field.tooltip %} class="form-control hasTooltip" title="{{ field.tooltip }}" data-placement="right"{% else %} class="form-control"{% endif %}
        {% if field.masked %} data-masked="{{ field.masked }}"{% endif %}
    >
  </div>
</div>