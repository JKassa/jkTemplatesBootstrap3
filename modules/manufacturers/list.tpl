<ul class="list-unstyled mjklist">
  {% for manufacturer in manufacturers %}
  <li class="m-b-10">
    {% if manufacturer.thumbnail %}
    <div class="m-b-5">
      <a href="{{ manufacturer.url }}">
        <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 50px; max-width: 50px" />
      </a>
    </div>
    {% endif %}
    <a href="{{ manufacturer.url }}">
      {{ manufacturer.name }}
    </a>
	{% if products %}
	<small class="text-muted">({{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
	{% endif %}
    {% if manufacturer.introtext %}
    <div class="m-t-5" style="font-size: 11px; line-height: 14px">
      {{ manufacturer.introtext | truncateDesc: 100 }}
    </div>
    {% endif %}
    {% if readmore %}
    <div class="m-t-5">
      <a class="btn btn-primary btn-xs" href="{{ manufacturer.url }}">
        {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }} <span class="glyphicon glyphicon-arrow-right"></span>
      </a>
    </div>
    {% endif %}
  </li>
  {% endfor %}
</ul>