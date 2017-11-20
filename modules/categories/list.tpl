{% for category in categories %}
<li class="level_{{ category.level }}{% if category.active %} active{% endif %}">
  <a href="{{ category.url }}">
    {{ category.title }}
    {% if category.qty_products %}
    <small><em>({{ category.qty_products }})</em></small>
    {% endif %}
  </a>
  {% if category.image %}
  <a href="{{ category.url }}">
    <img src="{{ category.image }}" alt="{{ category.alias }}" style="display: block; max-height: 50px; max-width: 50px;" />
  </a>
  {% endif %}
  {% if category.description %}
  <p style="font-size: 10px; line-height: 10px;">
    {{ category.description | truncateDesc: 100 }}
  </p>
  {% endif %}
  {% if category.children %}
    <ul>
      {% assign assigns = 'categories' | arrayCombine: category.children %}
      {{ assigns | layoutRender: 'modules/categories', 'list' }}
    </ul>
  {% endif %}
</li>
{% endfor %}