{% for currency in currencies %}
<li class="{% if currency.active %}active{% endif %}">
  <a href="{{ currency.url }}" rel="nofollow">
    <img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
    {{ currency.title }} <small>({{ currency.symbol }})</small>
  </a>
</li>
{% endfor %}