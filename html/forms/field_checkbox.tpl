<div class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label" for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div class="col-sm-9">
    <div class="checkbox">
      <label>
        <input
            type="checkbox"
            id="{{ field.name }}"
            name="{{ field.name }}"
            value="{{ field.values }}"
            {% if field.required %} required{% endif %}
            {% if field.readonly %} disabled{% endif %}
            {% if field.default == field.values %} checked{% endif %}
        >
        {{ value }}
        {% if field.tooltip %}
        <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ field.tooltip }}" data-placement="right"></span>
        {% endif %}
      </label>
    </div>
  </div>
</div>