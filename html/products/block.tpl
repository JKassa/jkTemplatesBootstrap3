<div class="row block-products">
  <ul class="thumbnails list-unstyled">
    {% for product in products %}
    <li class="col-xs-12 col-sm-6 col-md-{{ col_md }}" itemscope itemtype="http://schema.org/Product">
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
                {% assign options = 'decimals' | arrayCombine: 0 %}
                {% if product.discount_image %}
                <img {{ product.discount_image | img_exists: '30x30' }} alt="" title="{{ product.discount_desc }} - {{ product.discount | costDisplay: options }}{{ product.d_symbol }}">
                {% else %}
                <span class="product-label" title="{{ product.discount_desc }} - {{ product.discount | costDisplay: options }}{{ product.d_symbol }}">
                  -{{ product.discount | costDisplay: options }}{% if product.d_symbol == '%' %}{{ product.d_symbol }}{% endif %}
                </span>
                {% endif %}
              </li>
              {% endif %}
            </ul>
            {% endif %}
            
            {% if product.manufacturer %}
            <!--Manufacturer name and miniature-->
            <div style="position: absolute; right:0; top:0;" itemtype="http://schema.org/Brand" itemscope itemprop="brand">
              <span style="display: none;" itemprop="name">{{ product.manufacturer.name }}</span>
              <img {{ product.manufacturer.thumbnail | img_exists: '30x30' }} class="manufacturer hasTooltip" itemprop="logo" alt="{{ product.manufacturer.alias }}" title="{{ product.manufacturer.name }}">
            </div>
            {% endif %}
            
            {% if product.tags %}
            <!-- Tags -->
            <div style="position: absolute; right: 0; bottom: 4px">
              {% for tag in product.tags %}
              <a href="{{ tag.url }}" class="{{ tag.link_class }}" style="float: right; border-radius: 9px 0 0 9px; margin-top: 2px">
                {{ tag.title }}
              </a><br>
              {% endfor %}
            </div>
            {% endif %}
            
            <!--Product Image-->
            <div class="text-center">
              <a href="{{ product.url }}" target="_top">
                <img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" style="max-width: 100%; max-height: {{ img_height }}px;" />
              </a>
            </div>
            
            <!--Quick view-->
            {% capture selector_quick_view %}jk-quick_view-{{ product.id }}{% endcapture %}
            <div class="quick-view hidden-xs">
              <a href="#" data-click="show-modal" data-id="{{ selector_quick_view }}" data-src="{{ product.quick_url }}" class="btn btn-default jk-quick_view" title="{{ 'sprintf' | jtext: 'COM_JKASSA_QUICK_VIEW_TITLE', product.name }}">
                <span class="glyphicon glyphicon-zoom-in"></span>
                {{ '_' | jtext: 'COM_JKASSA_QUICK_VIEW' }}
              </a>
            </div>
            
            {% if product.present %}
            <!--Share (Product as a present)-->
            <div class="share hasTooltip" title="{{ 'tooltipText' | jhtml: product.present.name, product.present.desc }}">
              <div class="sharetitle">
                {{ '_' | jtext: 'COM_JKASSA_GIFT' }}
              </div>
              <div class="sharedesc">
                <a href="{{ product.present.url }}" target="_top">
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
                <span itemprop="name">{{ product.name }}</span>
              </a>
              {% if product.files %}
              <!--Files-->
              <span title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}" class="hasTooltip">
                <span class="glyphicon glyphicon-download small"></span>
              </span>
              {% endif %}
            </h4>
            
            <!--Price product-->
            <div class="m-t-10" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
              {% if product.old_cost %}
              <!--old cost-->
              <del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
              {% endif %}
              <!--cost-->
              <span class="cost">
                <meta itemprop="priceCurrency" content="{{ currency.code }}" />
				{% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
                <span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
              </span>
			  {% if product.vat %}
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
            
            {% comment %}
                Variants product.
                See: html\forms\variants.tpl
            {% endcomment %}
            {% if product.variants %}
            <div>
              {{ product.variants }}
            </div>
            {% endif %}
            
            {% if product.cart_disabled != 'false' and show_quantity %}
            <!--Quantity-->
            <div class="input-group qty-product m-t-10 m-b-0 col-xs-4 col-sm-6">
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
            <div class="btn-group m-t-10" style="width: 100%;">
              <!--More-->
              <a href="{{ product.url }}" class="btn btn-sm btn-default" title="{{ 'sprintf' | jtext: 'COM_JKASSA_READ_MORE', product.name }}" itemprop="url" target="_top">
                <span class="glyphicon glyphicon-circle-arrow-right"></span>
              </a>
              <!--Add to cart-->
              {% if product.cart_disabled %}
              <span class="btn btn-sm btn-primary disabled" title="{{ product.cart_title }}">
                <span class="glyphicon glyphicon-shopping-cart"></span>
              </span>
              {% else %}
              <a href="#" data-click="to-cart" data-id="{{ product.id }}" class="btn btn-sm btn-primary" title="{{ product.cart_title }}">
                <span class="glyphicon glyphicon-shopping-cart"></span>
              </a>
              {% endif %}
              <!--Add to Wish List-->
              {% if product.wishlist_disabled %}
              <span class="btn btn-sm btn-danger disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', product.name }}">
                <span class="glyphicon glyphicon-heart"></span>
              </span>
              {% else %}
              <a href="#" data-click="to-wishlist" data-id="{{ product.id }}" class="btn btn-sm btn-danger" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
                <span class="glyphicon glyphicon-heart"></span>
              </a>
              {% endif %}
              <!--Add to compare-->
              {% if product.compare_disabled %}
              <span class="btn btn-sm btn-default disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
                <span class="glyphicon glyphicon-random"></span>
              </span>
              {% else %}
              <a href="#" data-click="to-compare" data-id="{{ product.id }}" class="btn btn-sm btn-default" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
                <span class="glyphicon glyphicon-random"></span>
              </a>
              {% endif %}
              
              {% comment %}
                  Connecting comments plugin.
                  See: Plugin Manager: Plugins -> jkcomments.
              {% endcomment %}
              {% capture title_comments %}<span class="glyphicon glyphicon-comment"></span> [COUNT]{% endcapture %}
              {% assign count_comments = product.id | jkcountercomments: title_comments, product.url, 'btn btn-sm btn-inverse' %}
              
              {% if count_comments %}
              {{ count_comments }}
              {% endif %}
            </div>
			
			<!--Product Description (introtext)-->
			<span itemprop="description" style="display: none">
			  {{ product.introtext | truncateDesc: 140 }}
			</span>
          </div>
        </div>
      </div>
      
      {% comment %}
        Madal body for Quick view.
      {% endcomment %}
      {{ 'renderModal' | bootstrap3: selector_quick_view, 'modal-lg', product.name, '', '', true }}
    </li>
    {% endfor %}
    
    {% if moreProducts %}
	<!--More products-->
    <li class="col-xs-12 col-sm-6 col-md-{{ col_md }}">
      <div class="over-wraper">
        <div class="thumbnail over-wraper-long crossblock">
          <a href="#" data-click="more-products" data-more="{{ moreProducts }}" data-limit="{{ selectedLimit }}">
            <div class="cross">
              <span>&#10227;</span>
            </div>
            <div class="caption text-center">
              <h4>{{ 'plural' | jtext: 'COM_JKASSA_MORE_PRODUCTS', moreProducts }}</h4>
            </div>
          </a>
        </div>
      </div>
    </li>
    {% endif %}
  </ul>
</div>