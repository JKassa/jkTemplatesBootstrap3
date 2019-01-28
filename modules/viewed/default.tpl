{{ 'stylesheet' | jhtml: 'css/style.css' }}
{% assign btns = 0 | plus: readmore, to_cart, to_wishlist, to_compare %}
<div class="jkassa jk-viewed-module {{ class_sfx }}">
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
		{{ messages }}
	  </div>
	{% endif %}
</div>