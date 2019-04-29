{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-wishlist-module" class="{{ class_sfx }}">
	{% if products %}
	<div class="row mjkblock">
	  <ul class="list-unstyled">
		{% for product in products %}
		<li class="col-xs-3">
		  <div class="thumbnail">
			<div style="height: 150px">
			  {% if product.image %}
			  <div class="product-image" style="text-align: center">
				<a href="{{ product.url }}" title="{{ product.name }}">
				  <img src="{{ product.image }}" alt="{{ product.alias }}" style="max-height: 75px; max-width: 75px" />
				</a>
			  </div>
			  {% endif %}
			  <div class="caption">
				<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
				  <a href="{{ product.url }}" title="{{ product.name }}">
					{{ product.name }}
				  </a>
				</div>
				{% if product.introtext %}
				<div class="m-t-5" style="font-size: 11px; line-height: 14px">
					{{ product.introtext | truncateDesc: 35 }}
				</div>
				{% endif %}
				{% if product.old_cost %}
				<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
				{% endif %}
			  </div>
			</div>
			<div class="caption">
			  {% if product.cost %}
			  <div class="m-t-5">
				<span class="cost">
				  <span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
				</span>
			  </div>
			  {% endif %}
			  <!--Buttons-->
			  <div class="text-center m-t-5">
				<!--remove product-->
				<a href="javascript:;" class="btn btn-xs btn-danger" data-click="remove-wishlist" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}" data-toggle="tooltip">
				  <span class="glyphicon glyphicon-remove"></span> {{ '_' | jtext: 'JACTION_DELETE' }}
				</a>
			  </div>
			</div>
		  </div>
		</li>
		{% endfor %}
	  </ul>
	</div>
	{% else %}
	  {% if text_empty %}
	  <!--Text empty wishlist-->
	  <div class="alert alert-info m-t-10">
		{{ text_empty }}
	  </div>
	  {% endif %}
	{% endif %}
</div>