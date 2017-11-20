<ul class="list-unstyled">
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_PAYMENT_METHOD' }}:</strong>
    {{ syst_name }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_SHOP_ID' }}:</strong>
    {{ syst_id }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_NUMBER' }}:</strong>
    {{ pm_number }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_ID' }}:</strong>
    {{ order_id }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_TOTALL' }}:</strong>
    {{ pm_in_total | costDisplay }}{{ currency.symbol }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_CREATED' }}:</strong>
    {{ 'date' | jhtml: created, 'd F Y H:i' }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_DESC' }}:</strong>
    {{ pm_desc }}
  </li>
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_STATE' }}:</strong>
    {{ order_status }}
    {% if description %}
    <br>
    <small><em>* {{ description }}</em></small>
    {% endif %}
  </li>
  {% if syst_extra %}
    {% for extra in syst_extra %}
    <li>
      {{ 'sprintf' | jtext: 'COM_JKASSA_STRONG_FIELDS', extra.name, extra.value }}
    </li>
    {% endfor %}
  {% endif %}
</ul>