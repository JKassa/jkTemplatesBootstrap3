{{ 'stylesheet' | jhtml: 'css/style.css' }}
{% assign btns = 0 | plus: readmore, to_cart, to_wishlist, to_compare %}
<div class="jkassa jk-latest-module">
	{% if products %}
	  {% case layout %}
		{% when 'blocks' %}
		  {% include 'modules/latest/blocks' %}
		{% when 'carousel' %}
		  {% include 'modules/latest/carousel' %}
		{% else %}
		  {% include 'modules/latest/list' %}
	  {% endcase %}
	{% else %}
	  <div class="alert alert-warning">
		{{ '_' | jtext: 'JNONE' }}
	  </div>
	{% endif %}
</div>