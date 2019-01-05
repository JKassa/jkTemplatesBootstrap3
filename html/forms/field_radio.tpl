<div class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label" for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div class="col-sm-9">
    <span{% if field.tooltip %} class="hasTooltip" title="{{ field.tooltip }}" data-placement="right"{% endif %}>
      {% for val in field.values %}
      <div class="radio">
        <label>
          <input
              type="radio"
              name="{{ field.name }}"
              value="{{ val.value }}"
              {% if field.default == val.value %} checked{% endif %}
              {% if field.readonly %} disabled{% endif %}
              {% if field.required %} required{% endif %}
          >
          {{ val.text }}
        </label>
      </div>
      {% endfor %}
    </span>
  </div>
</div>