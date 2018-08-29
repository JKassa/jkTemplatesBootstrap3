{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if image %}
  {% assign span = 'col-xs-5' %}
{% else %}
  {% assign span = 'col-xs-6' %}
{% endif %}

<div id="jk-cart-module" class="thumbnail">
  <ul class="list-unstyled row">
    {% if image %}
    <!--Cart image-->
    <li class="col-xs-2 text-center">
      <a href="{{ url_cart }}">
        <img alt="cart" src="{{ image }}" title="{{ image_title }}">
      </a>
    </li>
    {% endif %}
    <li class="{{ span }}">
      {% if products %}
      <!--List products-->
      <ol>
        {% for product in products %}
        <li>
          <a href="{{ product.url }}">
            {{ product.name }}
          </a>
          
          {% if product.variants %}
          <br>
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
          
          <br>
          {% if product.old_cost | costDisplay %}
          <!--old cost-->
          <del class="text-muted">{{ product.old_cost }}{{ currency.symbol }}</del>
          {% endif %}
          <!--cost-->
          <strong>{{ product.cost | costDisplay }}{{ currency.symbol }}</strong>
          <small>({{ product.quantity }})</small>
          <!--remove product-->
          <a href="javascript:;" data-click="remove-product" data-index="{{ product.index }}" data-id="{{ product.id }}" title="{{ '_' | jtext: 'MOD_JKASSA_CART_REMOVE' }}" data-toggle="tooltip"><span class="glyphicon glyphicon-remove text-danger" style="font-size:10px"></span></a>
        </li>
        {% endfor %}
      </ol>
      {% else %}
        {% if text_empty %}
        <!--Text empty cart-->
        <div class="alert alert-info m-t-10">
          {{ text_empty }}
        </div>
        {% endif %}
      {% endif %}
    </li>
    <li class="{{ span }}">
      <!--Quantity-->
      <p class="text-center">
        {% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
        {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
      </p>
      
      {% if products %}
      <!--Cart total-->
      <p class="text-center">
        {% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
        {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
      </p>
      <p class="text-center">
        <!--URL cart-->
        <a class="btn btn-sm btn-default" href="{{ url_cart }}">
          <i class="glyphicon glyphicon-shopping-cart"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
        </a>
        <!--URL order-->
        <a class="btn btn-sm btn-primary" href="{{ url_order }}">
          <i class="glyphicon glyphicon-arrow-right"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_CART_ORDER' }}
        </a>
      </p>
      {% endif %}
    </li>
  </ul>
</div>