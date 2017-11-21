{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

<!--Header-->
<div class="page-header">
  {% if heading %}
  <h1>{{ heading }}</h1>
  {% else %}
  <h2>{{ title }}</h2>
  {% endif %}
</div>

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

{% else %}

{% capture access_note %}
  {% if access_form %}
  <!--You do not have access-->
  <div class="alert alert-warning">
    <a data-dismiss="alert" class="close">&times;</a>
    <h4>{{ '_' | jtext: 'JGLOBAL_AUTH_ACCESS_GRANTED'  }}</h4>
    {{ '_' | jtext: 'COM_JKASSA_ORDER_FORM_ACCESS' }}
  </div>
  {% endif %}
{% endcapture %}

{% capture limit_note %}
  {% if limit_order %}
  <!--Minimum order amount-->
  <div class="alert alert-warning">
    <a data-dismiss="alert" class="close">&times;</a>
    {% capture limit_cost %}{{ limit_order | costDisplay }}{{ currency.symbol }}{% endcapture %}
    <h4>{{ 'sprintf' | jtext: 'COM_JKASSA_LIMIT_ORDER', limit_cost  }}</h4>
    {{ '_' | jtext: 'COM_JKASSA_LIMIT_ORDER_NOTE' }}
  </div>
  {% endif %}
{% endcapture %}

<div class="row">
  <div class="col-sm-7">
    {% if user_guest %}
    <ul class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active">
        <a href="#new_user" role="tab" data-toggle="tab">{{ '_' | jtext: 'COM_JKASSA_ORDER_NEW_USER' }}</a>
      </li>
      <li role="presentation">
        <a href="#client" role="tab" data-toggle="tab">{{ '_' | jtext: 'COM_JKASSA_ORDER_REGULAR_CLIENT' }}</a>
      </li>
    </ul>
    <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="new_user">
        {{ access_note }}{{ limit_note }}
        <!--Order form-->
        {{ form }}
      </div>
      <div role="tabpanel" class="tab-pane" id="client">
        <!--Login form-->
        {{ login_form }}
      </div>
    </div>
    {% else %}
    {{ access_note }}{{ limit_note }}
    <!--Order form-->
    {{ form }}
    {% endif %}
  </div>
  <div class="col-sm-5">
    <!--Order-->
    {{ order }}
  </div>
</div>

{% endif %}

<!--Button: 'Continue Shopping'-->
<div class="text-center m-t-10">
  <a class="btn btn-default btn-lg" href="{{ home_page }}">
    {{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
  </a>
</div>