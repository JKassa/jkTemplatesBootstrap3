{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}

<!--Header-->
<div class="page-header">
  {% if heading %}
  <h1>{{ heading }}</h1>
  {% else %}
  <h2>{{ title }}</h2>
  {% endif %}
</div>

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<!--Print-->
{% if print_screen == 0 %}
<div class="btn-group" style="position: absolute; right: 0">
  <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
    <span class="glyphicon glyphicon-cog"></span>
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
    <li>{{ print_icon }}</li>
  </ul>
</div>
{% else %}
<div class="btn btn-default no-print" style="position: fixed; right: 10px; top: 10px">
  {{ print_screen }}
</div>
{% endif %}

<div class="text-center">
  {% if print_screen == 0 %}
  <img src="{{ image }}" alt="action" />
  {% endif %}
  
  <h1>{{ order_status }}</h1>
  <p>{{ description }}</p>
  
  {% if print_screen == 0 and action == 'pending' %}
  <a href="{{ update_url }}" class="button btn btn-lg btn-warning">
    {{ '_' | jtext: 'COM_JKASSA_UPDATE_STATUS' }}
  </a>
  {% endif %}
  
  <hr />
  
  <h3>
    {{ 'sprintf' | jtext: 'COM_JKASSA_RESULT_NUMBER', pm_number }}
  </h3>
</div>

{% if note %}
<div class="alert alert-warning">
  {{ note }}
</div>
{% endif %}

{% if print_screen == 0 %}
  <!--Order-->
  {{ 'startAccordion' | bootstrap3: 'resultAccordian', 'data_products' }}
    <!--Information about order-->
    {{ 'addSlide' | bootstrap3: 'resultAccordian', 'COM_JKASSA_YOUR_PURCHASES', 'data_products', 'info' }}
      {% include 'views/result/products' %}
    {{ 'endSlide' | bootstrap3 }}
    <!--Order data-->
    {{ 'addSlide' | bootstrap3: 'resultAccordian', 'COM_JKASSA_ORDER_DATA', 'data_payment', 'info' }}
      {% include 'views/result/payment' %}
    {{ 'endSlide' | bootstrap3 }}
    <!--Data buyer-->
    {{ 'addSlide' | bootstrap3: 'resultAccordian', 'COM_JKASSA_DATA_BUYER', 'data_buyer', 'info' }}
      {% include 'views/result/buyer' %}
    {{ 'endSlide' | bootstrap3 }}
    {% if delivery %}
    <!--Data delivery-->
    {{ 'addSlide' | bootstrap3: 'resultAccordian', 'COM_JKASSA_DATA_DELIVERY', 'data_delivery', 'info' }}
      {% include 'views/result/delivery' %}
    {{ 'endSlide' | bootstrap3 }}
    {% endif %}
  {{ 'endAccordion' | bootstrap3 }}
  
  <!--Continue shopping-->
  <p class="text-center">
    <a class="btn btn-default btn-lg" href="{{ home_page }}">
      {{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
    </a>
  </p>
{% else %}
  <!--Print-->
  <h4>{{ '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' }}</h4>
  {% include 'views/result/products' %}
  <h4>{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}</h4>
  {% include 'views/result/payment' %}
  <h4>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}</h4>
  {% include 'views/result/buyer' %}
  {% if delivery %}
  <h4>{{ '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' }}</h4>
  {% include 'views/result/delivery' %}
  {% endif %}
{% endif %}

{% if posttext %}
<!--Posttext-->
<div class="m-t-15">
  {{ posttext }}
</div>
{% endif %}