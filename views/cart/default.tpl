{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

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

{% if cart_empty %}
<!--Cart empty-->
<div class="alert alert-info">
  <a data-dismiss="alert" class="close">&times;</a>
  <h4>{{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_TITLE' }}!</h4>
  {% if user_guest %}
  {{ 'sprintf' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE_GUEST', login_url }}
  {% else %}
  {{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE' }}
  {% endif %}
</div>
{% endif %}

{% if products %}
  {% if limit_order %}
  <!--Minimum order amount-->
  <div class="alert alert-warning">
    <a data-dismiss="alert" class="close">&times;</a>
    {% capture limit_cost %}{{ limit_order | costDisplay }}{{ currency.symbol }}{% endcapture %}
    <h4>{{ 'sprintf' | jtext: 'COM_JKASSA_LIMIT_ORDER', limit_cost  }}</h4>
    {{ '_' | jtext: 'COM_JKASSA_LIMIT_ORDER_NOTE' }}
  </div>
  {% endif %}
  
  <div class="row navbar navbar-inverse jk-table-head m-b-0">
    <div class="container-fluid">
      <div class="col-xs-7">
        <p class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}</p>
      </div>
      <div class="col-xs-2">
        <p class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}</p>
      </div>
      <div class="col-xs-3">
        <p class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_COST' }}</p>
      </div>
    </div>
  </div>
  
  {% for product in products %}
  <div class="row jk-table-body">
    
    <div class="col-xs-2">
      <div class="product-image">
        {% if product.discount %}
        <ul class="stickers">
          <li>
            <span class="product-label">-{{ product.discount | costDisplay }}{{ product.d_symbol }}</span>
          </li>
        </ul>
        {% endif %}
        
        <!--Product Image-->
        <div class="text-center">
          <a href="{{ product.url }}" target="_blank">
            <img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" title="{{ product.name }}" />
          </a>
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
    </div>
    
    <div class="col-xs-5">
      <!--Product Information-->
      <div>
        <h4>
          <a href="{{ product.url }}" target="_blank">
            {{ product.name }}
          </a>
          
          {% if product.files %}
          <!--Files-->
          <span title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}" class="hasTooltip">
            <span class="glyphicon glyphicon-download"></span>
          </span>
          {% endif %}
        </h4>
      </div>
      
      {% if product.sku %}
      <!--SKU (code)-->
      <div class="text-muted small text-right m-t-5">
        {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ product.sku }}
      </div>
      {% endif %}
        
      {% if product.variants %}
      <!--Variants product-->
      <div class="m-t-10">
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
            {% when 'select' %}
              <span>
                {{ variant.value }}
              </span>
          {% endcase %}
        {% endfor %}
      </div>
      {% endif %}
      
      <!--Cost-->
      <div class="m-t-10">
        {% if product.old_cost %}
        <!--old cost-->
        <del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
        {% endif %}
        <!--cost-->
        {{ product.cost | costDisplay }}{{ currency.symbol }}
      </div>
    </div>
    
    <div class="col-xs-2 text-center m-t-10">
      <!--Quantity-->
      <input type="text" value="{{ product.quantity }}" data-id="{{ product.index }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" class="form-control input-sm text-center" name="qty-product-cart-{{ product.index }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
      <div class="btn-group qty-product m-t-10">
        <a href="javascript:;" data-click="qty-minus-cart" data-id="{{ product.index }}" class="btn btn-default" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
        <a href="javascript:;" data-click="qty-plus-cart" data-id="{{ product.index }}" class="btn btn-default" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
      </div>
    </div>
    
    <div class="col-xs-3 text-center">
      <!--Price-->
      <div class="cost text-info">
        <span>{{ product.price | costDisplay }}</span>{{ currency.symbol }}
      </div>
	  {% if product.vat %}
	  <!--vat-->
	  <span class="text-muted small">
		({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
	  </span>
      {% endif %}
      
      <!--Remove from Cart-->
      <div class="m-t-10">
        <a href="#" data-click="remove-product" data-index="{{ product.index }}" class="btn btn-xs btn-danger" title="{{ '_' | jtext: 'COM_JKASSA_CART_DELETE_TITLE' }}"><span class="glyphicon glyphicon-remove"></span>
          {{ '_' | jtext: 'JACTION_DELETE' }}
        </a>
      </div>
    </div>
    
  </div>
  {% endfor %}
  
  <div class="row jk-table-footer">
    {% if sum_note %}
    <!--Discount sum note-->
    <div class="col-xs-12">
      <div class="alert alert-info">
        {% capture sum_note_amount %}{{ sum_note.amount | costDisplay }}{{ currency.symbol }}{% endcapture %}
        {% capture sum_note_discount %}{{ sum_note.discount | costDisplay }}{{ sum_note.symbol }}{% endcapture %}
        {{ 'sprintf' | jtext: 'COM_JKASSA_CART_DISCOUNTS_SUM_NOTE', sum_note_amount, sum_note_discount }}
      </div>
    </div>
    {% endif %}
	{% if coupon %}
    <!--Coupons code-->
    <div class="col-xs-12 m-l-0 form-inline">
	  <p class="text-muted">{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_TITLE' }}</p>
	  <input type="text" id="coupons_code" class="form-control input-sm" placeholder="{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_ENTER' }}" value="{{ coupon.value }}">
      <a href="#" data-click="code-apply" class="btn btn-default btn-sm">{{ '_' | jtext: 'COM_JKASSA_APPLY' }}</a>
      {% if coupon.note %}
      <div class="alert alert-danger m-t-5">
        {{ coupon.note }}
      </div>
      {% endif %}
    </div>
    {% endif %}
    <div class="col-xs-6 m-l-0">
      {% if limit_order == 0 %}
      <!--Order url-->
      <button class="btn btn-success" type="button" onClick="window.open('{{ order_url }}', '_top')">
        <span class="glyphicon glyphicon-ok"></span>
        {{ '_' | jtext: 'COM_JKASSA_CHECKOUT' }}
      </button>
      {% endif %}
    </div>
    <div class="col-xs-6 m-l-0">
      <div class="row text-right">
        {% if discounts %}
        <!-- Total price -->
        <div class="col-xs-7 m-l-0"><strong>{{ '_' | jtext: 'COM_JKASSA_SUM' }}:</strong></div>
        <div class="col-xs-5 m-l-0 cost"><span>{{ total | costDisplay }}</span>{{ currency.symbol }}</div>
        {% endif %}
        {% if discounts.sum %}
        <!--Discounts sum-->
        <div class="col-xs-7 m-l-0"><strong>{{ discounts.sum.name }}:</strong></div>
        <div class="col-xs-5 m-l-0">
          -{{ discounts.sum.difference | costDisplay }}{{ currency.symbol }}
          {% if discounts.sum.desc %}
          <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ discounts.sum.desc }}"></span>
          {% endif %}
        </div>
        {% endif %}
		{% if discounts.code %}
		<!--Discounts code-->
		<div class="col-xs-7 m-l-0"><strong>{{ discounts.code.name }}:</strong></div>
        <div class="col-xs-5 m-l-0">
          -{{ discounts.code.difference | costDisplay }}{{ currency.symbol }}
          {% if discounts.code.desc %}
          <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ discounts.code.desc }}"></span>
          {% endif %}
        </div>
		{% endif %}
		{% if sum_vat %}
	    <!--Sum of VAT-->
	    <div class="col-xs-7 m-l-0"><strong>{{ '_' | jtext: 'COM_JKASSA_VAT' }}:</strong></div>
	    <div class="col-xs-5 m-l-0">
	      {{ sum_vat | costDisplay }}{{ currency.symbol }}
	    </div>
	    {% endif %}
        <!--In total price-->
        <div class="col-xs-12 m-l-0 m-t-10 p-t-5" style="border-top:1px solid #dddddd">
          <span class="lead text-info">
            {{ in_total | costDisplay }}{{ currency.symbol }}
          </span>
        </div>
      </div>
    </div>
  </div>
  
  {% if cheaper %}
  <!--Share: Together cheaper-->
  <div class="m-t-30">
    <h3>{{ '_' | jtext: 'COM_JKASSA_CART_TOGETHER_CHEAPER' }}</h3>
    {% include 'html/products/cheaper' %}
  </div>
  {% endif %}
  
  {% if relateds %}
  <!--Related products-->
  <div class="m-t-30">
    <h3>{{ '_' | jtext: 'COM_JKASSA_CART_ADD_TO_ORDER' }}</h3>
    {% include 'html/products/relateds' %}
  </div>
  {% endif %}
{% endif %}

{% if viewtmpl != 'component' %}
{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}
<!--Button: 'Continue Shopping'-->
<div class="text-center m-t-10">
  <a class="btn btn-lg btn-info" href="{{ home_page }}">
    {{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
  </a>
</div>
{% endif %}