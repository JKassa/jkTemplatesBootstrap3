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
      <div class="col-xs-6 col-sm-7 text-center">
        <p class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}</p>
      </div>
      <div class="col-sm-3 text-center hidden-xs">
        <p class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}</p>
      </div>
      <div class="col-xs-6 col-sm-2 text-center">
        <p class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_COST' }}</p>
      </div>
    </div>
  </div>
  
  {% for product in products %}
  <div class="row jk-table-body p-t-5">
    
    <div class="col-xs-6 col-sm-2">
      <div class="product-image">
        {% if product.d_simple %}
        <ul class="stickers">
          <li>
			<span class="product-label">
			  {% assign options = 'decimals' | arrayCombine: 0 %}
			  -{{ product.d_simple.value | costDisplay: options }}{% if product.d_simple.symbol == '%' %}{{ product.d_simple.symbol }}{% endif %}
			</span>
          </li>
        </ul>
        {% endif %}
        
        <!--Product Image-->
        <div class="text-center">
          <a href="{{ product.url }}" target="_blank">
            <img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" class="img-responsive" />
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
    
    <div class="col-xs-6 col-sm-2 col-sm-push-5 text-center m-t-10">
      <!--Quantity-->
	  <div class="input-group qty-product m-t-10 m-b-0 col-xs-4 col-sm-10" style="margin: auto !important">
		<span class="input-group-btn">
		  <a href="javascript:;" class="btn btn-default btn-sm" data-click="qty-minus-cart" data-id="{{ product.index }}" class="btn btn-default" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
		</span>
        <input type="text" value="{{ product.quantity }}" data-id="{{ product.index }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" class="form-control input-sm text-center mw-45" name="qty-product-cart-{{ product.index }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
		<span class="input-group-btn">
		  <a href="javascript:;" class="btn btn-default btn-sm" data-click="qty-plus-cart" data-id="{{ product.index }}" class="btn btn-default" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
		</span>
	  </div>
    </div>
    
    <div class="col-xs-6 col-sm-3 col-sm-push-5 text-center">
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
		<div class="col-xs-12 col-sm-5 col-sm-pull-5">
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
			<!--Cost-->
			<div class="m-t-10">
				{% if product.old_cost %}
				<!--old cost-->
				<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
				{% endif %}
				<!--cost-->
				{{ product.cost | costDisplay }}{{ currency.symbol }}
				{% if product.d_coupon %}
				<!--Promotional code-->
				<br>
				<span class="text-danger small">
				  <strong>{{ product.d_coupon.name }}</strong>:
				  -{{ product.d_coupon.difference | costDisplay }}{{ currency.symbol }}
				  {% if product.d_coupon.symbol == '%' %}
				  <em>({{ product.d_coupon.value }}%)</em>
				  {% endif %}
				  {% if product.d_coupon.desc %}
				  <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ product.d_coupon.desc }}"></span>
				  {% endif %}
				</span>
				{% endif %}
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
	  <div class="input-group">
		<input type="text" id="coupons_code" class="form-control input-sm" placeholder="{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_ENTER' }}" value="{{ coupon.value }}">
		<span class="input-group-btn">
		  <a href="#" data-click="code-apply" class="btn btn-default btn-sm">
			{{ '_' | jtext: 'COM_JKASSA_APPLY' }}
		  </a>
		  <a href="#" data-click="code-clear" class="btn btn-default btn-sm" title="{{ '_' | jtext: 'JCLEAR' }}">
		    <span class="glyphicon glyphicon-remove-sign"></span>
		  </a>
		</span>
	  </div>
      {% if coupon.note %}
      <div class="alert alert-danger m-t-5">
        {{ coupon.note }}
      </div>
      {% endif %}
    </div>
    {% endif %}
    <div class="col-xs-12 col-sm-6 m-l-0">
      {% if limit_order == 0 %}
      <!--Order url-->
      <button class="btn btn-success" type="button" onClick="window.open('{{ order_url }}', '_top')">
        <span class="glyphicon glyphicon-ok"></span>
        {{ '_' | jtext: 'COM_JKASSA_CHECKOUT' }}
      </button>
      {% endif %}
    </div>
    <div class="col-xs-12 col-sm-6 m-l-0">
      <div class="row text-right">
        {% if discounts %}
        <!-- Total price -->
        <div class="col-xs-7 m-l-0"><strong>{{ '_' | jtext: 'COM_JKASSA_SUM' }}:</strong></div>
        <div class="col-xs-5 m-l-0 cost"><span>{{ total | costDisplay }}</span>{{ currency.symbol }}</div>
        {% endif %}
		{% if discounts.sav %}
        <!--Discount sav-->
        <div class="col-xs-7 m-l-0"><strong>{{ discounts.sav.name }}:</strong></div>
        <div class="col-xs-5 m-l-0">
          -{{ discounts.sav.difference | costDisplay }}{{ currency.symbol }}
		  {% if discounts.sav.percent %}
		  <em>({{ discounts.sav.discount }}%)</em>
		  {% endif %}
          {% if discounts.sav.desc %}
          <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ discounts.sav.desc }}"></span>
          {% endif %}
        </div>
        {% endif %}
        {% if discounts.sum %}
        <!--Discount sum-->
        <div class="col-xs-7 m-l-0"><strong>{{ discounts.sum.name }}:</strong></div>
        <div class="col-xs-5 m-l-0">
          -{{ discounts.sum.difference | costDisplay }}{{ currency.symbol }}
		  {% if discounts.sum.percent %}
		  <em>({{ discounts.sum.discount }}%)</em>
		  {% endif %}
          {% if discounts.sum.desc %}
          <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ discounts.sum.desc }}"></span>
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