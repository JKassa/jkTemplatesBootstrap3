{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if image %}
  {% assign span = 'col-xs-9' %}
{% else %}
  {% assign span = 'col-xs-12' %}
{% endif %}

<div id="jk-cart-module" class="row m-b-20 {{ class_sfx }}">
  {% if image %}
  <div class="col-xs-3 text-center">
    <a href="{{ url_cart }}">
      <img alt="cart" src="{{ image }}" title="{{ image_title }}">
    </a>
  </div>
  {% endif %}
  
  <div class="{{ span }}" style="white-space: nowrap;">
    {% if products %}
    <div class="help-block text-center">
      {{ 'plural' | jtext: 'MOD_JKASSA_CART_QUANTITY', quantity }}
      - {{ total | costDisplay }}{{ currency.symbol }}
    </div>
    <div class="help-block text-center">
      <a href="{{ url_cart }}" class="btn btn-xs">
        <i class="glyphicon glyphicon-shopping-cart"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
      </a>
    </div>
    {% else %}
    <div class="help-block text-center">
      {{ 'plural' | jtext: 'MOD_JKASSA_CART_QUANTITY', quantity }}
    </div>
    {% endif %}
  </div>
</div>