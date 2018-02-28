{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}

{% if viewtmpl != 'component' %}
<!--Header-->
<div class="page-header">
  {% if heading %}
  <h1>{{ heading }} <small>({{ quantity }})</small></h1>
  {% else %}
  <h2>{{ title }} <small>({{ quantity }})</small></h2>
  {% endif %}
</div>
{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}
{% endif %}

<!--Products-->
{% if products %}
{% assign col_md = tpl_params.p_in_row | default_value: 4 %}
{% assign prod_height = tpl_params.prod_height | default_value: 282 %}
{% capture prod_height_css %}.thumbnails > li .over-wraper, .thumbnails > li .over-wraper-long { height: {{ prod_height }}px } .thumbnails > li:hover .over-wraper-long { min-height: {{ prod_height }}px }{% endcapture %}
{{ prod_height_css | addStyleDeclaration }}
{% capture img_style %}max-width: 100%; max-height: {{ tpl_params.img_height | default_value: 150 }}px;{% endcapture %}
{% assign show_stock = tpl_params.prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.prod_quantity | default_value: 1 %}
<div class="row block-products">
  <ul class="thumbnails list-unstyled">
    {% for product in products %}
    <li class="col-xs-12 col-sm-6 col-md-{{ col_md }}">
      <div class="over-wraper">
        <div class="thumbnail over-wraper-long">
          <div class="product-image">
            {% if product.stickers %}
            <!-- Stickers -->
            <ul class="stickers">
              {% if product.new %}
              <li>
                <span class="product-label product-label_new">NEW</span>
              </li>
              {% endif %}
              {% if product.hit %}
              <li>
                <span class="product-label product-label_hit">HIT</span>
              </li>
              {% endif %}
              {% if product.discount %}
              <li>
                {% if product.discount_image %}
                <img {{ product.discount_image | img_exists: '30x30' }} alt="{{ product.discount }}" title="{{ product.discount_desc }} - {{ product.discount }}">
                {% else %}
                <span class="product-label" title="{{ product.discount_desc }} - {{ product.discount }}">-{{ product.discount }}</span>
                {% endif %}
              </li>
              {% endif %}
            </ul>
            {% endif %}
            
            {% if product.manufacturer %}
            <!--Manufacturer name and miniature-->
            <div style="position: absolute; right:0; top:0;">
              <img {{ product.manufacturer.thumbnail | img_exists: '30x30' }} class="manufacturer hasTooltip" alt="{{ product.manufacturer.alias }}" title="{{ product.manufacturer.name }}">
            </div>
            {% endif %}
            
            <!--Product Image-->
            <div class="text-center">
			  {% assign jkmedialist = product.image | jkmedialist: product.images, '', img_style, product.url %}
              {% if jkmedialist %}
                {{ jkmedialist }}
              {% else %}
			  <a href="{{ product.url }}" target="_top">
                <img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" style="{{ img_style }}" />
			  </a>
			  {% endif %}
            </div>
            
            {% if product.present %}
            <!--Share (Product as a present)-->
            <div class="share hasTooltip" title="{{ 'tooltipText' | jhtml: product.present.name, product.present.desc }}">
              <div class="sharetitle">
                {{ '_' | jtext: 'COM_JKASSA_GIFT' }}
              </div>
              <div class="sharedesc">
                <a href="{{ product.present.url }}">
                  <img {{ product.present.image | img_exists: '50x50' }} alt="{{ product.present.name }}">
                </a>
              </div>
            </div>
            {% endif %}
          </div>
          
          <div class="caption">
            <!--Name and URL of the product-->
            <h4>
              <a href="{{ product.url }}" target="_top">
                {{ product.name }}
              </a>
              {% if product.files %}
              <!--Files-->
              <span title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}" class="hasTooltip">
                <span class="glyphicon glyphicon-download small"></span>
              </span>
              {% endif %}
            </h4>
            
            <!--Price product-->
            <div class="m-t-10">
              {% if product.old_cost %}
              <!--old cost-->
              <del class="text-muted">{{ product.old_cost }}</del>
              {% endif %}
              <!--cost-->
              <span class="cost">
                <span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
              </span>
			  {% if product.vat %}
		      <!--vat-->
	  	      <span class="text-muted small">
		        ({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
	 	      </span>
      	      {% endif %}
            </div>
            
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
            
            {% if product.variants %}
            <!--Variants product-->
            <div class="m-t-10" id="variant-{{ product.index }}">
              {% for variant in product.variants %}
                {{ variant.name }}:
                {% case variant.type %}
                  {% when 'radio' %}
                    <span class="variant-radio-value">
                      {{ variant.value }}
                    </span>
                  {% when 'color' %}
                    <span class="minicolors-swatch">
                      <span style="background-color: {{ variant.value }}" title="{{ variant.title }}"></span>
                    </span>
                  {% when 'select' %}
                    <span>
                      {{ variant.value }}
                    </span>
                {% endcase %}
                <input type="hidden" data-attr-title="{{ variant.title }}" name="variant-{{ product.id }}-{{ variant.id }}" value="{{ variant.value }}">
                <br>
              {% endfor %}
            </div>
            {% endif %}
            
			{% if product.cart_disabled != 'false' and show_quantity %}
            <!--Quantity-->
            <div class="input-group qty-product m-t-10 m-b-0 col-xs-5">
              <span class="input-group-btn">
                <a href="javascript:;" class="btn btn-default btn-sm" type="button" data-click="qty-minus" data-id="{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
              </span>
              <input type="text" value="{{ product.limit }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" class="form-control input-sm text-center mw-45" name="qty-product-{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
              <span class="input-group-btn">
                <a href="javascript:;" class="btn btn-default btn-sm" type="button" data-click="qty-plus" data-id="{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
              </span>
            </div>
            {% endif %}
			
            <!--Buttons-->
            <div class="btn-group m-t-10" style="width: 100%">
              <!--More-->
              <a href="{{ product.url }}" class="btn btn-default btn-sm" title="{{ 'sprintf' | jtext: 'COM_JKASSA_READ_MORE', product.name }}" target="_top">
                <span class="glyphicon glyphicon-arrow-right"></span>
              </a>
              <!--Add to cart-->
              {% if product.cart_disabled %}
                {% if product.stock == 0 %}
                  {% assign cart_btn_title = '_' | jtext: 'COM_JKASSA_STOCK_0' %}
                {% else %}
                  {% assign cart_btn_title = 'sprintf' | jtext: 'COM_JKASSA_ALREADY_CART', product.name %}
                {% endif %}
              <span class="btn btn-sm btn-primary disabled" title="{{ cart_btn_title }}">
                <span class="glyphicon glyphicon-shopping-cart"></span>
              </span>
              {% else %}
              <a href="#" data-click="to-cart-user" data-index="{{ product.index }}" data-id="{{ product.id }}" class="btn btn-primary btn-sm" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', product.name }}">
                <span class="glyphicon glyphicon-shopping-cart"></span>
              </a>
              {% endif %}
              <!--Add to compare-->
              {% if product.compare_disabled %}
              <span class="btn btn-default btn-sm disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
                <span class="glyphicon glyphicon-random"></span>
              </span>
              {% else %}
              <a href="#" data-click="to-compare-user" data-index="{{ product.index }}" data-id="{{ product.id }}" class="btn btn-default btn-sm" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
                <span class="glyphicon glyphicon-random"></span>
              </a>
              {% endif %}
              <!--Remove from wishlist-->
              <a href="#" data-click="remove-wishlist" data-index="{{ product.index }}" class="btn btn-sm btn-danger" title="{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_WISHLIST_REMOVE' }}">
                <span class="glyphicon glyphicon-remove"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>
<div class="text-center m-b-20">
	<!--Remove from wishlist (all)-->
	<a href="#" class="btn btn-danger" data-click="remove-wishlist-all">
		<span class="glyphicon glyphicon-trash"></span>
		{{ '_' | jtext: 'COM_JKASSA_CLEAR_ALL' }}
	</a>
</div>
{% else %}
<div class="alert alert-warning">
  {{ '_' | jtext: 'COM_JKASSA_ACCOUNT_WISHLIST_EMPTY' }}
</div>
{% endif %}

{% if viewtmpl != 'component' and posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}