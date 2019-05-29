<div>
  {% for variant in variants %}
  <div class="m-t-10">
    {{ variant.name }}:
    
    {% case variant.type %} 
    
    {% when 'select' %}
    <!--Drop-down list-->
    <select data-select="variant-select" name="variant-{{ product }}-{{ variant.id }}" class="form-control" style="width: auto">
      {% for attribute in variant.attributes %}
      <option value="{{ attribute.value }}" data-attr-title="{{ attribute.title }}"{% if attribute.default %} selected{% endif %}>
        {{ attribute.value }}
      </option>
      {% endfor %}
    </select>
    
    {% when 'radio' %}
    <!--Group switches-->
    {% for attribute in variant.attributes %}
    <label class="variant-radio-value">
      <input type="radio" data-checked="variant-radio" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
      {{ attribute.value }}
    </label>
    {% endfor %}
    
    {% when 'color' %}
    <!--Сolor switches-->
    {% for attribute in variant.attributes %}
    <label class="minicolors-swatch{% if attribute.default %} main{% endif %}" title="{{ attribute.title }}">
      <input type="radio" data-checked="variant-color" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
      <span style="background-color: {{ attribute.value }};"></span>
    </label>
    {% endfor %}
	
	{% when 'texture' %}
    <!--Texture switches-->
    {% for attribute in variant.attributes %}
    <label class="minicolors-swatch{% if attribute.default %} main{% endif %}" title="{{ attribute.title }}">
      <input type="radio" data-checked="variant-texture" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
      <img src="{{ attribute.img }}" alt="{{ attribute.alt }}">
    </label>
    {% endfor %}
    
    {% endcase %}
    
    {% if variant.tooltip %}
    <!--Tooltip-->
    <span title="{{ variant.tooltip }}" class="hasTooltip">
      <span class="glyphicon glyphicon-question-sign"></span>
    </span>
    {% endif %}
  </div>
  {% endfor %}
  
  {% if user_variants %}
  <!--Reset variants-->
  <a href="#" data-click="variant-reset" data-id="{{ product }}" class="small" title="{{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS_TITLE' }}">
    <span class="glyphicon glyphicon-refresh"></span>
    {{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS' }}
  </a>
  {% endif %}
</div>