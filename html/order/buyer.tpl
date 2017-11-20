<ul class="list-unstyled">
  {% if user_name %}
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}:</strong>
    {{ user_name }}
  </li>
  {% endif %}
  {% if user_email %}
  <li>
    <strong>{{ '_' | jtext: 'JGLOBAL_EMAIL' }}:</strong>
    {{ user_email }}
  </li>
  {% endif %}
  {% if user_data %}
    {% for user in user_data %}
    <li>
      {{ 'sprintf' | jtext: 'COM_JKASSA_STRONG_FIELDS', user.name, user.value }}
    </li>
    {% endfor %}
  {% endif %}
  {% if custom_fields %}
    {% for field in custom_fields %}
    <li>
      {{ 'sprintf' | jtext: 'COM_JKASSA_STRONG_FIELDS', field.name, field.value }}
    </li>
    {% endfor %}
  {% endif %}
</ul>