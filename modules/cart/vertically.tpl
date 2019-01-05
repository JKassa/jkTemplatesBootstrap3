{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-cart-module" class="{{ class_sfx }}">
	{% if image %}
	<!--Cart image-->
	<div class="text-center">
	  <a href="{{ url_cart }}">
		<img alt="cart" src="{{ image }}" title="{{ image_title }}">
	  </a>
	</div>
	{% endif %}

	{% if products %}
	<div class="row">
	  <div class="col-xs-12 m-t-10">
		<div class="thumbnail p-0">
		  <!--Products-->
		  {% for product in products %}
		  <div class="container-fluid jk-table-body p-0">
			<!--Product Image-->
			<div class="col-xs-4">
			  <div class="product-image">
				{% if product.discount %}
				<ul class="stickers">
				  <li>
					<span class="product-label">-{{ product.discount }}</span>
				  </li>
				</ul>
				{% endif %}
				<a href="{{ product.url }}" target="_blank">
				  <img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" title="{{ product.name }}" />
				</a>
			  </div>
			</div>
			<!--Product Information-->
			<div class="col-xs-8">
			  <!--Name-->
			  <strong>
				<a href="{{ product.url }}" target="_blank">
				  {{ product.name }}
				</a>
				{% if product.present %}
				<!--present-->
				+
				<a href="{{ product.present.url }}" target="_blank">
				  {{ product.present.name }}
				</a>
				{% endif %}
				{% if product.files %}
				<!--files-->
				<span title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}" class="hasTooltip">
				  <span class="glyphicon glyphicon-download"></span>
				</span>
				{% endif %}
				<!--remove product-->
				<a href="javascript:;" data-click="remove-product" data-index="{{ product.index }}" data-id="{{ product.id }}" title="{{ '_' | jtext: 'MOD_JKASSA_CART_REMOVE' }}" data-toggle="tooltip"><span class="glyphicon glyphicon-remove text-danger" style="font-size:10px"></span></a>
			  </strong>

			  {% if product.sku %}
			  <!--SKU (code)-->
			  <div class="text-muted small text-right m-t-5">
				{{ '_' | jtext: 'MOD_JKASSA_CART_SKU' }}: {{ product.sku }}
			  </div>
			  {% endif %}

			  {% if product.variants %}
			  <!--Variants-->
			  <div class="small m-t-10">
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
			  </div>
			  {% endif %}

			  {% if product.old_cost %}
			  <!--Old cost-->
			  <div class="m-t-10">
				<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
			  </div>
			  {% endif %}
			</div>
			<!--Product price-->
			<div class="col-xs-12">
			  <div class="col-xs-5 text-left p-0">
				<!--cost-->
				{{ product.cost | costDisplay }}{{ currency.symbol }}
			  </div>
			  <div class="col-xs-2 text-center">
				&times;{{ product.quantity }}
			  </div>
			  <div class="col-xs-5 text-right p-0">
				<!--Price-->
				{{ product.price | costDisplay }}{{ currency.symbol }}
			  </div>
			</div>
		  </div>
		  {% endfor %}
		  <!--Table footer-->
		  <div class="container-fluid jk-table-footer p-0">
			<!-- Total price -->
			<div class="col-xs-12 text-right">
			  {% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
			  {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
			</div>
			<!--URL order & cart-->
			<div class="col-xs-12 text-center">
			  <a class="btn btn-sm btn-primary" href="{{ url_order }}">
				<i class="glyphicon glyphicon-arrow-right"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_ORDER' }}
			  </a>
			  <a class="btn btn-sm btn-default" href="{{ url_cart }}">
				<i class="glyphicon glyphicon-shopping-cart"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_CART' }}
			  </a>
			</div>
		  </div>
		</div>
	  </div>
	</div>
	{% else %}
	  {% if text_empty %}
	  <!--Text empty cart-->
	  <div class="alert alert-info m-t-10">
		{{ text_empty }}
	  </div>
	  {% endif %}
	{% endif %}
</div>