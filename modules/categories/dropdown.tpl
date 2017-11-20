{% for category in categories %}
  {% if category.children %}
    {% assign dropdown = ' dropdown-submenu' %}
    {% assign tabindex = ' tabindex="-1"' %}
    {% if submenu %}
      {% assign pullleft = ' pull-left' %}
    {% endif %}
  {% endif %}
  <li class="level_{{ category.level }}{{ dropdown }}{{ pullleft }}{% if category.active %} active{% endif %}">
    <a href="{{ category.url }}"{{ tabindex }}>
      {{ category.title }}
      {% if category.qty_products %}
      <small><em>({{ category.qty_products }})</em></small>
      {% endif %}
    </a>
    {% if category.children %}
    <ul class="dropdown-menu">
      {% assign assigns = 'categories,submenu' | arrayCombine: category.children, submenu %}
      {{ assigns | layoutRender: 'modules/categories', 'dropdown' }}
    </ul>
    {% endif %}
  </li>
{% endfor %}