{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

{% comment %}
	Parameters of the product.
{% endcomment %}
{% assign show_sku = tpl_params.sku | default_value: 1 %}
{% assign show_stock = tpl_params.stock | default_value: 1 %}
{% assign show_quantity = tpl_params.quantity | default_value: 1 %}
{% assign show_info = tpl_params.info | default_value: 1 %}
{% assign show_icons = tpl_params.icons | default_value: 1 %}
{% assign show_nav = tpl_params.nav | default_value: 1 %}

{% comment %}
	Variable depending on the availability of the product:
    '0'  - Not in stock;
    '-1' - In stock;
    '-2' - To order;
    'X'  - Balance of stock.
{% endcomment %}
{% case stock %}
	{% when 0 %}
		{% assign stock_icon = '<span class="glyphicon glyphicon-check text-danger"></span>' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_0' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = false %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = false %}
        {% assign btn_report = true %}
        {% assign btn_quickorder = false %}
	{% when '-1' %}
		{% assign stock_icon = '<span class="glyphicon glyphicon-check text-success"></span>' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_1' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = true %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = true %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
	{% when '-2' %}
		{% assign stock_icon = '<span class="glyphicon glyphicon-check"></span>' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_2' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = false %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = false %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
	{% else %}
		{% assign stock_icon = '<span class="glyphicon glyphicon-check text-success"></span>' %}
        {% assign stock_text = 'sprintf' | jtext: 'COM_JKASSA_STOCK_N', stock %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = true %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = true %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
{% endcase %}

{% comment %}
	In cart.
{% endcomment %}
{% if cart_disabled %}
	{% assign btn_cartDisabled = true %}
    {% assign btn_cart = false %}
{% endif %}

{% if heading and quickview == 0 %}
<!--Heading-->
<h1 class="page-header m-t-0">
  {{ heading }}
</h1>
{% endif %}

<!--Product-->
<div class="row" itemscope itemtype="http://schema.org/Product">
  <!--Images-->
  <div class="col-sm-7 product-image">
    {% assign jkmedia = images | jkmedia: 64, 380 %}
    {% if jkmedia %}
      {{ jkmedia }}
    {% else %}
    <img {{ image | img_exists: '260x380' }} alt="{{ alias }}" class="img-responsive">
    {% endif %}
    
    {% if stickers %}
    <!-- Stickers -->
    <ul class="stickers">
      {% if new %}
      <li>
        <span class="product-label product-label_new">NEW</span>
      </li>
      {% endif %}
      {% if hit %}
      <li>
        <span class="product-label product-label_hit">HIT</span>
      </li>
      {% endif %}
      {% if discount %}
      <li>
        {% assign options = 'decimals' | arrayCombine: 0 %}
        {% if discount_image %}
        <img {{ discount_image | img_exists: '30x30' }} alt="" title="{{ discount_desc }} - {{ discount | costDisplay: options }}{{ d_symbol }}">
        {% else %}
        <span class="product-label" title="{{ discount_desc }} - {{ discount | costDisplay: options }}{{ d_symbol }}">
          -{{ discount | costDisplay: options }}{% if d_symbol == '%' %}{{ d_symbol }}{% endif %}
        </span>
        {% endif %}
      </li>
      {% endif %}
    </ul>
    {% endif %}
    
    {% if tags %}
    <!-- Tags -->
    <div style="position: absolute; right: 0; top: 4px">
      {% for tag in tags %}
      <a href="{{ tag.url }}" class="{{ tag.link_class }}" style="float: right; border-radius: 9px 0 0 9px; margin-top: 2px">
        {{ tag.title }}
      </a><br>
      {% endfor %}
    </div>
    {% endif %}
  </div>
  
  <!--Cost block-->
  <div class="col-sm-5">
    
    {% if manufacturer %}
    <!--Manufacturer-->
    <div itemtype="http://schema.org/Brand" itemscope itemprop="brand">
      <a title="{{ manufacturer.name }}" href="{{ manufacturer.url }}" target="_top">
		<span style="display: none;" itemprop="name">{{ manufacturer.name }}</span>
        <img src="{{ manufacturer.logo }}" alt="{{ manufacturer.alias }}" class="img-thumbnail" style="max-height: 60px; max-width: 200px" itemprop="logo">
      </a>
    </div>
    {% endif %}
    
    {% comment %}
	    Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
    {% endcomment %}
	{% if reviews_included %}
	  <!--Rating reviews-->
	  <div id="jkReviewsRating" class="m-t-10 text-muted" style="display: inline-block;">
	    {% include 'html/reviews/rating' %}
	  </div>
	{% else %}
      {% assign votes = id | jkvotes: rating, rating_count %}
      {% if votes %}
      <!--Voting-->
      <div class="m-t-10 text-muted">
        {{ votes }}
      </div>
      {% endif %}
	{% endif %}
    
    <!--Name-->
    <h2>
      <a itemprop="url" href="{{ url }}" target="_top">
        <span itemprop="name">
          {{ name }}
        </span>
      </a>
      
      {% if files %}
      <!--Files-->
      <span class="hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ files | join: '<br>' }}">
        <span class="glyphicon glyphicon-download small"></span>
      </span>
      {% endif %}
    </h2>
    
    {% if present %}
    <!--Share (Product as a present)-->
    <div class="share">
      <div class="sharetitle">
        + {{ present.name }}
      </div>
      <div class="sharedesc">
        <a href="{{ present.url }}" target="_top">
          <img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
          <span>{{ present.desc }}</span>
        </a>
      </div>
    </div>
    {% endif %}
    
    <!--Cost-->
    <div itemscope itemprop="offers" itemtype="http://schema.org/Offer">
      <meta content="{{ currency.code }}" itemprop="priceCurrency">
      <link href="http://schema.org/InStock" itemprop="availability">
      {% if old_cost %}
      <del class="text-muted">{{ old_cost | costDisplay }}{{ currency.symbol }}</del>
      {% endif %}
	  {% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
      <span class="lead" itemprop="price" content="{{ cost | costDisplay: options }}">{{ cost | costDisplay }}</span><strong>{{ currency.symbol }}</strong>
	  {% if vat %}
	  <span class="text-muted small">
		({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', vat }})
	  </span>
      {% endif %}
    </div>
    
	{% if show_sku %}
    <!--SKU (code)-->
    <div class="text-muted small text-right">
      {{ '_' | jtext: 'COM_JKASSA_SKU' }}:
      <span itemprop="mpn">
        {{ sku }}
      </span>
    </div>
	{% endif %}
    
    {% comment %}
        Variants product.
        See: html\forms\variants.tpl
    {% endcomment %}
    {% if variants %}
    <div>
      {{ variants }}
    </div>
    {% endif %}
    
	{% if show_stock %}
    <!--Stock-->
    <div class="text-muted small m-t-10">
      {{ stock_icon }} {{ stock_text }}
    </div>
	{% endif %}
	
	{% if cart_disabled != 'false' and show_quantity %}
	<!--Quantity-->
	<div class="input-group qty-product m-t-10 m-b-0 col-xs-5">
	  <span class="input-group-btn">
		<a href="javascript:;" class="btn btn-default btn-sm" type="button" data-click="qty-minus" data-id="{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
	  </span>
	  <input type="text" value="{{ limit }}" data-limit="{{ limit }}" data-maxlimit="{{ maxlimit }}" class="form-control input-sm text-center mw-45" name="qty-product-{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
	  <span class="input-group-btn">
		<a href="javascript:;" class="btn btn-default btn-sm" type="button" data-click="qty-plus" data-id="{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
	  </span>
	</div>
	{% endif %}
    
    <!--Buttons-->
    <div>
	  <div class="btn-group m-t-10">
        {% if btn_buyDisabled %}
        <!--Buy disabled-->
        <span class="btn btn-primary disabled">
          <span class="glyphicon glyphicon-ok"></span>
          {{ '_' | jtext: 'COM_JKASSA_BUY' }}
        </span>
        {% endif %}
        
        {% if btn_buy %}
        <!--Buy-->
        <a href="#" data-click="to-order" data-id="{{ id }}" data-url="{{ form_url }}" class="btn btn-success">
          <span class="glyphicon glyphicon-ok"></span>
          {{ '_' | jtext: 'COM_JKASSA_BUY' }}
        </a>
        {% endif %}
        
        {% if btn_cartDisabled %}
        <!--Cart disabled-->
        <span class="btn btn-info disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_CART', name }}">
          <span class="glyphicon glyphicon-shopping-cart"></span>
          {{ '_' | jtext: 'COM_JKASSA_IN_CART' }}
        </span>
        {% endif %}
        
        {% if btn_cart %}
        <!--Cart-->
        <a href="#" data-click="to-cart" data-id="{{ id }}" class="btn btn-info" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', name }}">
          <span class="glyphicon glyphicon-shopping-cart"></span>
          {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
        </a>
       {% endif %}
      </div>
      
      {% if btn_report %}
      <!--Waiting List-->
	  <div class="btn-group m-t-10">
        <a href="#" data-click="show-modal" data-id="jk-modal_waitinglist" data-src="{{ waitinglist }}" class="btn btn-default">
          <span class="glyphicon glyphicon-envelope"></span>
          {{ '_' | jtext: 'COM_JKASSA_WAITINGLIST' }}
        </a>
	  </div>
      {% endif %}
      
	  <div class="btn-group m-t-10">
        <!--Add to Wishlist-->
        {% if wishlist_disabled %}
        <span class="btn btn-default btn-circle disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', name }}">
          <span class="glyphicon glyphicon-heart text-danger"></span>
        </span>
        {% else %}
        <a href="#" data-click="to-wishlist" data-id="{{ id }}" class="btn btn-default btn-circle" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', name }}">
          <span class="glyphicon glyphicon-heart text-danger"></span>
        </a>
        {% endif %}
        
        <!--Add to compare-->
        {% if compare_disabled %}
        <span class="btn btn-default btn-circle disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', name }}">
          <span class="glyphicon glyphicon-random"></span>
        </span>
        {% else %}
        <a href="#" data-click="to-compare" data-id="{{ id }}" class="btn btn-default btn-circle" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', name}}">
          <span class="glyphicon glyphicon-random"></span>
        </a>
        {% endif %}
	  </div>
    </div>
    
    {% if btn_quickorder and quickorder %}
    <!--Quick order-->
    <div class="m-t-10">
      <a href="#" data-click="show-modal" data-id="jk-modal_quickorder" data-src="{{ quickorder }}" class="btn btn-inverse">
        <span class="glyphicon glyphicon-star"></span>
        {{ '_' | jtext: 'COM_JKASSA_QUICK_ORDER' }}
      </a>
    </div>
    {% endif %}
    
    {% if f_attributes %}
    <!--Featured attributes-->
    <ul class="list-unstyled m-t-10">
      {% for attribute in f_attributes %}
      <li>
        <strong>{{ attribute.name }}</strong>
        {{ attribute.value }}
        {% if attribute.tooltip %}
        <span class="hasTooltip" title="{{ attribute.tooltip }}">
          <span class="glyphicon glyphicon-question-sign"></span>
        </span>
        {% endif %}
      </li>
      {% endfor %}
    </ul>
    {% endif %}
    
    {% comment %}
        Connecting social plugin.
        See: Plugin Manager: Plugins -> jksocial.
    {% endcomment %}
    {% assign social = id | jksocial: name, image, metadesc, return_url %}
    {% if social %}
    <div class="m-t-10">
      {{ social }}
    </div>
    {% endif %}
  </div>
  
  <!--Product Description (introtext)-->
  <span itemprop="description" style="display: none">
    {{ introtext | truncateDesc: 140 }}
  </span>
</div>

{% comment %}
    Connecting comments plugin (position: tabbed).
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{% assign com_tabbed = id | jkcomments: name, 'tabbed' %}

<!--Tabs-->
<div class="m-t-10">
  <ul class="nav nav-tabs nav-justified m-b-15" role="tablist">
    <li role="presentation" class="active">
      <a href="#description" aria-controls="description" role="tab" data-toggle="tab">
        {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
      </a>
    </li>
    {% if attributes %}
    <li role="presentation">
      <a href="#attributes" aria-controls="attributes" role="tab" data-toggle="tab">
        {{ '_' | jtext: 'COM_JKASSA_ATTRIBUTES' }}
      </a>
    </li>
    {% endif %}
    {% if tabs %}
    {% for tab in tabs %}
    <li role="presentation">
      <a href="#{{ tab.id }}" aria-controls="{{ tab.id }}" role="tab" data-toggle="tab">
        {{ tab.name }}
      </a>
    </li>
    {% endfor %}
    {% endif %}
	{% if reviews_included %}
	<li role="presentation">
      <a href="#reviews" aria-controls="comments" role="tab" data-toggle="tab">
		{{ '_' | jtext: 'COM_JKASSA_REVIEWS' }} ({{ rating_count }})
	  </a>
    </li>
	{% endif %}
    {% if com_tabbed %}
    <li role="presentation">
      <a href="#comments" aria-controls="comments" role="tab" data-toggle="tab">
        {{ '_' | jtext: 'COM_JKASSA_COMMENTS' }}
      </a>
    </li>
    {% endif %}
  </ul>
  <div class="tab-content">
    <!--Description-->
    <div role="tabpanel" class="tab-pane active" id="description">
      {{ fulltext }}
    </div>
    
    {% if attributes %}
    <!--Attributes-->
    <div role="tabpanel" class="tab-pane" id="attributes">
      <dl class="dl-horizontal">
        {% for attribute in attributes %}
        <dt>{{ attribute.name }}</dt>
        <dd>
          {{ attribute.value }}
          {% if attribute.tooltip %}
          <span class="hasTooltip" title="{{ attribute.tooltip }}">
            <span class="glyphicon glyphicon-question-sign"></span>
          </span>
          {% endif %}
        </dd>
        {% endfor %}
      </dl>
    </div>
    {% endif %}
    
    {% if tabs %}
    {% for tab in tabs %}
    <div role="tabpanel" class="tab-pane" id="{{ tab.id }}">
      {{ tab.content }}
    </div>
    {% endfor %}
    {% endif %}
	
	{% if reviews_included %}
	<!--Reviews-->
	<div role="tabpanel" class="tab-pane" id="reviews">
	  {% include 'html/reviews/reviews' %}
	</div>
	{% endif %}
    
    {% if com_tabbed %}
    <!--Comments-->
    <div role="tabpanel" class="tab-pane" id="comments">
      {{ com_tabbed }}
    </div>
    {% endif %}
  </div>
</div>

{% if cheaper %}
<!--Share: Together cheaper-->
<div class="m-t-30">
  <h3>{{ '_' | jtext: 'COM_JKASSA_CART_TOGETHER_CHEAPER' }}</h3>
  {% include 'html/products/cheaper' %}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin (position: bottom).
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{% assign com_bottom = id | jkcomments: name, 'bottom' %}
{% if com_bottom %}
  {{ com_bottom }}
{% endif %}

{% if quickview == 0 %}
<div class="row">
	{% if show_icons %}
	{% if print_screen == 0 %}
	<!--Print / Email / Edit-->
	<div class="btn-group pull-right m-t-20 m-r-5">
		<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
			<span class="glyphicon glyphicon-cog"></span>
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li>{{ print_icon }}</li>
			<li>{{ email_icon }}</li>
			{% if edit_icon %}
			<li role="separator" class="divider"></li>
			<li>{{ edit_icon }}</li>
			{% endif %}
		</ul>
	</div>
	{% else %}
	<!--Print-->
	<div class="btn btn-default no-print" style="position: fixed; right: 10px; top: 10px">
		{{ print_screen }}
	</div>
	{% endif %}
	{% endif %}
	
	{% if show_info %}
	<!--Details-->
	<ul class="breadcrumb m-t-15">
		<li>
			<span class="glyphicon glyphicon-user"></span>
			{{ 'sprintf' | jtext: 'COM_JKASSA_WRITTEN_BY', '' }}
			{% if contact_link %}
			<a href="{{ contact_link }}">{{ author }}</a>
			{% else %}
			{{ author }}
			{% endif %}
		</li>
		{% if parent_title %}
		<li>
			<span class="glyphicon glyphicon-folder-close"></span>
			{% capture parent %}<a href="{{ parent_url }}">{{ parent_title }}</a>{% endcapture %}
			{{ 'sprintf' | jtext: 'COM_JKASSA_PARENT', parent }}
		</li>
		{% endif %}
		<li>
			<span class="glyphicon glyphicon-folder-open"></span>
			{% capture category %}<a href="{{ category_url }}">{{ category_title }}</a>{% endcapture %}
			{{ 'sprintf' | jtext: 'COM_JKASSA_CATEGORY', category }}
		</li>
		<li>
			<span class="glyphicon glyphicon-calendar"></span>
			<time datetime="{{ 'date' | jhtml: publish, 'c' }}">
				{% assign date_publish = 'date' | jhtml: publish, 'DATE_FORMAT_LC2' %}
				{{ 'sprintf' | jtext: 'COM_JKASSA_PUBLISHED_DATE_ON', date_publish }}
			</time>
		</li>
		<li>
			<span class="glyphicon glyphicon-calendar"></span>
			<time datetime="{{ 'date' | jhtml: created, 'c' }}">
				{% assign date_created = 'date' | jhtml: created, 'DATE_FORMAT_LC2' %}
				{{ 'sprintf' | jtext: 'COM_JKASSA_CREATED_DATE_ON', date_created }}
			</time>
		</li>
		<li>
			<span class="glyphicon glyphicon-calendar"></span>
			<time datetime="{{ 'date' | jhtml: modified, 'c' }}">
				{% assign date_modified = 'date' | jhtml: modified, 'DATE_FORMAT_LC2' %}
				{{ 'sprintf' | jtext: 'COM_JKASSA_LAST_UPDATED', date_modified }}
			</time>
		</li>
		<li>
			<span class="glyphicon glyphicon-eye-open"></span>
			{{ 'sprintf' | jtext: 'COM_JKASSA_PRODUCT_HITS', hits }}
		</li>
	</ul>
	{% endif %}
</div>

{% if pagination and show_nav %}
<!--Pagination-->
<ul class="pager pagenav">
	{% if pagination.prev %}
	<li class="previous">
		<a href="{{ pagination.prev }}" rel="prev">
			<span class="glyphicon glyphicon-circle-arrow-left"></span> {{ '_' | jtext: 'JPREV' }}
		</a>
	</li>
	{% endif %}
	{% if pagination.next %}
	<li class="next">
		<a href="{{ pagination.next }}" rel="next">
			{{ '_' | jtext: 'JNEXT' }} <span class="glyphicon glyphicon-arrow-right"></span>
		</a>
	</li>
	{% endif %}
</ul>
{% endif %}
{% endif %}

{% comment %}
  Madal body for Waiting List.
{% endcomment %}
{{ 'renderModal' | bootstrap3: 'jk-modal_waitinglist', '', 'COM_JKASSA_WAITINGLIST', '', '', true }}

{% comment %}
  Madal body for Quick order.
{% endcomment %}
{{ 'renderModal' | bootstrap3: 'jk-modal_quickorder', '', 'COM_JKASSA_QUICK_ORDER', '', '', true }}