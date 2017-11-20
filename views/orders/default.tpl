{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}

{% if viewtmpl != 'component' %}
  {% if heading %}
  <!--Heading-->
  <h1>{{ heading }}</h1>
  {% endif %}
  
  {% if title %}
  <!--Title-->
  <h2 class="page-header m-t-0">
    {{ title }}
    <small>({{ quantity }})</small>
  </h2>
  {% endif %}
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

{% if orders %}
  {{ 'startAccordion' | bootstrap3: 'accountAccordian' }}
    {% for order in orders %}
      {% assign order_id = order.id %}
      {% assign syst_id = order.syst_id %}
      {% assign syst_name = order.syst_name %}
      {% assign syst_extra = order.syst_extra %}
      {% assign pm_number = order.pm_number %}
      {% assign pm_total = order.pm_total %}
	  {% assign sum_vat = order.sum_vat %}
      {% assign pm_in_total = order.pm_in_total %}
	  {% assign pm_desc = order.pm_desc %}
      {% assign user_name = order.user_name %}
      {% assign user_email = order.user_email %}
      {% assign user_data = order.user_data %}
      {% assign custom_fields = order.custom_fields %}
      {% assign products = order.products %}
      {% assign currency = order.currency %}
      {% assign delivery = order.delivery %}
      {% assign delivery_custom = order.delivery_custom %}
      {% assign created = order.created %}
      {% assign order_status = order.status.status %}
      {% assign description = order.status.desc %}
      {% assign action = order.status.action %}
      
      {% capture title_slide %}
        {% assign date = 'date' | jhtml: created, 'd.m.Y H:i' %}
        {{ 'sprintf' | jtext: 'COM_JKASSA_ACCOUNT_ORDER_NAME', pm_number, date }}
        {% if order.note %}
        <span class="glyphicon glyphicon-warning-sign text-warning" title="{{ order.note }}"></span>
        {% endif %}
        <span class="pull-right">
          <img src="{{ order.status.image }}" title="{{ order_status }}" style="max-height: 20px;" />
        </span>
      {% endcapture %}
      
      {{ 'addSlide' | bootstrap3: 'accountAccordian', title_slide, pm_number }}
        {% if order.note %}
        <div class="alert alert-warning">
          {{ order.note }}
        </div>
        {% endif %}
        <!--Information about order-->
        <h4>{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_ORDER_ABOUT' }}</h4>
        {% include 'html/order/products' %}
        <!--Order data-->
        <h4>{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}</h4>
        {% include 'html/order/payment' %}
        <!--Data buyer-->
        <h4>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}</h4>
        {% include 'html/order/buyer' %}
        {% if delivery %}
        <!--Data delivery-->
        <h4>{{ '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' }}</h4>
        {% include 'html/order/delivery' %}
        {% endif %}
      {{ 'endSlide' | bootstrap3 }}
      
    {% endfor %}
  {{ 'endAccordion' | bootstrap3 }}
{% else %}
  <div class="alert alert-info" role="alert">
    {{ '_' | jtext: 'COM_JKASSA_ACCOUNT_NO_ORDERS' }}
  </div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}