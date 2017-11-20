<ul class="list-unstyled">
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_DELIVERY_METHOD'}}:</strong> {{ delivery.label }}
  </li>
  {% if delivery.tooltip %}
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_DELIVERY_DESC'}}:</strong> {{ delivery.tooltip }}
  </li>
  {% endif %}
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_DELIVERY_COST'}}:</strong>
	{% if delivery.cost == 0 %}
	{{ '_' | jtext: 'COM_JKASSA_FREE'}}
	{% else %}
	{{ delivery.cost | costDisplay }}{{ currency.symbol }}
	{% endif %}
  </li>
  {% if delivery.free %}
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_DELIVERY_FREE'}}:</strong> {{ delivery.free | costDisplay }}{{ currency.symbol }}
  </li>
  {% endif %}
  {% if delivery_custom %}
    {% for custom in delivery_custom %}
    <li>
      {{ 'sprintf' | jtext: 'COM_JKASSA_STRONG_FIELDS', custom.name, custom.value }}
    </li>
    {% endfor %}
  {% endif %}
</ul>