<ul class="list-unstyled mjklist">
  {% for product in products %}
  <li itemscope itemtype="http://schema.org/Product">
    {% if product.image %}
    <div class="m-b-5">
      <a itemprop="url" href="{{ product.url }}">
        <img itemprop="image" src="{{ product.image }}" alt="{{ product.alias }}" style="max-height: 50px; max-width: 50px" />
      </a>
    </div>
    {% endif %}
    <a itemprop="url" href="{{ product.url }}">
      <span itemprop="name">{{ product.name }}</span>
    </a>
    {% if product.introtext %}
    <div class="m-t-5" style="font-size: 11px; line-height: 14px">
      <span itemprop="description">
        {{ product.introtext | truncateDesc: 100 }}
      </span>
    </div>
    {% endif %}
    {% if product.cost %}
    <div class="m-t-5" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
      {% if product.old_cost %}
      <del class="text-muted">{{ product.old_cost }}{{ currency.symbol }}</del>
      {% endif %}
      <span class="cost">
        <meta itemprop="priceCurrency" content="{{ currency.code }}">
        {% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
        <span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
      </span>
    </div>
    {% endif %}
	{% if show_stock %}
	<!--Stock-->
	<div class="text-muted m-t-5 text-right">
	  {% case product.stock %} 
	  {% when 0 %}
	  <!--Not available-->
	  {{ '_' | jtext: 'COM_JKASSA_STOCK_0' }}
	  {% when '-1' %}
	  <!--Available-->
	  {{ '_' | jtext: 'COM_JKASSA_STOCK_1' }}
	  {% when '-2' %}
	  <!--Under the order-->
	  {{ '_' | jtext: 'COM_JKASSA_STOCK_2' }}
	  {% else %}
	  <!--Number-->
	  {{ '_' | jtext: 'COM_JKASSA_STOCK' }}: {{ product.stock }}
	  {% endcase %}
	</div>
	{% endif %}
	{% if show_votes %}
	{% comment %}
		Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
	{% endcomment %}
	{% if reviews_included %}
	  <!--Rating reviews-->
	  <div class="text-right" title="{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', product.rating_count }}">
		{% for i in (1..5) %}
		  {% if product.rating >= i %}
		  <span class="glyphicon glyphicon-star" style="color: #F2CD00"></span>
		  {% else %}
		  <span class="glyphicon glyphicon-star-empty" style="color: #CCCCCC"></span>
		  {% endif %}
		{% endfor %}
	  </div>
	{% else %}
	  {% assign votes = product.id | jkcountervotes: product.rating, product.rating_count %}
	  {% if votes %}
	  <!--Voting-->
	  <div class="text-right">
		{{ votes }}
	  </div>
	  {% endif %}
	{% endif %}
	{% endif %}
    {% if btns %}
    <div class="btn-group m-t-5">
	  {% if readmore %}
	  <!--More-->
      <a itemprop="url" class="btn btn-default btn-xs" href="{{ product.url }}">
        <span class="glyphicon glyphicon-circle-arrow-right"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}{% endif %}
      </a>
	  {% endif %}
	  {% if to_cart %}
	  <!--Add to cart-->
	  {% if product.cart_disabled %}
	  <span class="btn btn-xs btn-primary disabled" title="{{ product.cart_title }}">
		<span class="glyphicon glyphicon-shopping-cart"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
	  </span>
	  {% else %}
	  <a href="#" data-click="to-cart" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-xs btn-primary" title="{{ product.cart_title }}">
		<span class="glyphicon glyphicon-shopping-cart"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
	  </a>
	  {% endif %}
	  {% endif %}
	  {% if to_wishlist %}
	  <!--Add to Wish List-->
	  {% if product.wishlist_disabled %}
	  <span class="btn btn-xs btn-danger disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', product.name }}">
		<span class="glyphicon glyphicon-heart"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}{% endif %}
	  </span>
	  {% else %}
	  <a href="#" data-click="to-wishlist" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-xs btn-danger" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
		<span class="glyphicon glyphicon-heart"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}{% endif %}
	  </a>
	  {% endif %}
	  {% endif %}
	  {% if to_compare %}
	  <!--Add to compare-->
	  {% if product.compare_disabled %}
	  <span class="btn btn-xs btn-default disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
		<span class="glyphicon glyphicon-random"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
	  </span>
	  {% else %}
	  <a href="#" data-click="to-compare" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-xs btn-default" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
		<span class="glyphicon glyphicon-random"></span>
		{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
	  </a>
	  {% endif %}
	  {% endif %}
    </div>
    {% endif %}
  </li>
  {% endfor %}
</ul>