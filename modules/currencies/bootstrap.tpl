{% for currency in currencies %}
  {% if currency.id == active_id %}
  <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
    {{ currency.title }} <small>({{ currency.symbol }})</small>
    <span class="caret"></span>
  </button>
  {% endif %}
{% endfor %}

<ul class="dropdown-menu">
  {% for currency in currencies %}
    {% if currency.id != active_id %}
    <li>
      <a href="{{ currency.url }}" rel="nofollow">
        <img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
        {{ currency.title }} <small>({{ currency.symbol }})</small>
      </a>
    </li>
    {% endif %}
  {% endfor %}
</ul>