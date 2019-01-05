{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-compare-module" class="{{ class_sfx }}">
	{% if image %}
	<!--Compare image-->
	<div class="text-center">
	  <a href="{{ url_compare }}">
		<img alt="compare" src="{{ image }}" title="{{ image_title }}">
	  </a>
	</div>
	{% endif %}

	{% if categories %}
	<!--Categories-->
	<div class="m-t-10">
	  {% for category in categories %}
	  <div class="thumbnail m-b-10">
		<div class="caption">
		  <a href="#" class="close" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_REMOVE' }}">&times;</a>
		  <h4>
			{{ category.title }}
			<small>({{ 'plural' | jtext: 'MOD_JKASSA_COMPARE_PRODUCTS_QUANTITY', category.products_total }})</small>
		  </h4>
		  <ol>
			{% for product in category.products %}
			<li>
			  <a href="{{ product.url }}" target="_top">{{ product.name }}</a>
			  {% if product.variants %}
				<!--Variants product-->
				<small>
				  {% for variant in product.variants %}
					{{ variant.name }}:
					{% case variant.type %}
					  {% when 'radio' %}
						<span class="variant-radio-value">
						  {{ variant.value }}
						</span>
					  {% when 'color' %}
						<span class="minicolors-swatch">
						  <span style="background-color: {{ variant.value }};" title="{{ variant.title }}"></span>
						</span>
					  {% when 'texture' %}
						<span class="minicolors-swatch">
						  <img src="{{ variant.img }}" alt="{{ variant.alt }}" title="{{ variant.title }}">
						</span>
					  {% when 'select' %}
						<span>
						  {{ variant.value }}
						</span>
					{% endcase %}
				  {% endfor %}
				</small>
			  {% endif %}
			</li>
			{% endfor %}
		  </ol>
		  <hr class="m-t-5 m-b-5">
		  {% if category.products_total == 1 %}
		  <div class="alert alert-info">
			{{ '_' | jtext: 'MOD_JKASSA_COMPARE_NOT_ENOUGH' }}
		  </div>
		  {% else %}
		  <a href="{{ category.url }}" class="btn btn-sm btn-default">
			<span class="glyphicon glyphicon-random"></span>
			{{ '_' | jtext: 'MOD_JKASSA_COMPARE_COMPARE' }}
		  </a>
		  {% endif %}
		</div>
	  </div>
	  {% endfor %}
	</div>
	{% else %}
	  {% if text_empty %}
	  <!--Text empty compare-->
	  <div class="alert alert-info m-t-10">
		{{ text_empty }}
	  </div>
	  {% endif %}
	{% endif %}
</div>