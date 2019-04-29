{% comment %}
	Connect CSS and JavaScript to the header of the document
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

{% if heading %}
<!--Heading-->
<h1 class="page-header m-t-0">
  {{ heading }}
</h1>
{% endif %}

<!--Image-->
<div class="row">
  <div class="col-xs-12">
    <img {{ logo | img_exists: '400x120' }} alt="{{ alias }}" style="width: 100%">
  </div>
</div>

<div class="row page-header m-t-30">
  <div class="col-xs-7">
    <!--Name-->
    <h2 class="m-t-0">
      {{ name }}
      <small class="text-muted">{{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', products_quantity }}</small>
    </h2>
  </div>
  <div class="col-xs-5 text-right">
    {% comment %}
        Connecting voting plugin.
        See: Plugin Manager: Plugins -> jkvotes.
    {% endcomment %}
    {% assign votes = id | jkvotes: rating, rating_count %}
    {% if votes %}
    <!--Rating-->
    <div class="text-muted">
      {{ votes }}
    </div>
    {% endif %}
  </div>
</div>

<!--Layout products-->
{{ products }}

{% if fulltext %}
<!--Fulltext-->
<div class="m-t-10">
  {{ fulltext }}
</div>
{% endif %}

{% if contacts %}
<!--Contacts-->
<div class="m-t-20">
  <h4>
    {{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_CONTACTS' }}
  </h4>
  <ul class="list-group">
    {% if contacts.url %}
    <!--homepage-->
    <li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_HOMEPAGE' }}">
      <span class="glyphicon glyphicon-home"></span>
      <a href="{{ contacts.url }}" target="_blank">{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_HOMEPAGE' }}</a>
    </li>
    {% endif %}
    {% if contacts.email %}
    <!--email-->
    <li class="list-group-item" title="{{ '_' | jtext: 'JGLOBAL_EMAIL' }}">
      <span class="glyphicon glyphicon-envelope"></span>
      <a href="mailto:{{ contacts.email }}">{{ contacts.email }}</a>
    </li>
    {% endif %}
    {% if contacts.support %}
    <!--support-->
    <li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_SUPPORT' }}">
      <span class="glyphicon glyphicon-envelope"></span>
      <a href="{{ contacts.support }}" target="_blank">{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_SUPPORT' }}</a>
    </li>
    {% endif %}
    {% if contacts.phone %}
    <!--phone-->
    <li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_PHONE' }}">
      <span class="glyphicon glyphicon-earphone"></span>
      {{ contacts.phone }}
    </li>
    {% endif %}
    {% if contacts.fax %}
    <!--fax-->
    <li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_FAX' }}">
      <span class="glyphicon glyphicon-print"></span>
      {{ contacts.fax }}
    </li>
    {% endif %}
  </ul>
</div>
{% endif %}

{% comment %}
    Connecting social plugin.
    See: Plugin Manager: Plugins -> jksocial.
{% endcomment %}
{% assign social = id | jksocial: name, logo, metadesc, return_url %}
{% if social %}
  {{ social }}
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ id | jkcomments: name }}

{% if print_screen == 0 %}
<!--Print / Email / Edit-->
<div class="btn-group pull-right m-t-10 m-r-5">
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
<div class="btn btn-default no-print" style="position: fixed; right: 10px; top: 10px">
  {{ print_screen }}
</div>
{% endif %}

<!--Details-->
<ul class="breadcrumb">
  <li>
    <span class="glyphicon glyphicon-user"></span>
    {{ 'sprintf' | jtext: 'COM_JKASSA_WRITTEN_BY', '' }}
    {% if contact_link %}
    <a href="{{ contact_link }}">{{ author }}</a>
    {% else %}
    {{ author }}
    {% endif %}
  </li>
  <li>
    <span class="glyphicon glyphicon-calendar"></span>
    <time>
      {% assign date_publish = 'date' | jhtml: publish, 'DATE_FORMAT_LC2' %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_PUBLISHED_DATE_ON', date_publish }}
    </time>
  </li>
  <li>
    <span class="glyphicon glyphicon-calendar"></span>
    <time>
      {% assign date_created = 'date' | jhtml: created, 'DATE_FORMAT_LC2' %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_CREATED_DATE_ON', date_created }}
    </time>
  </li>
  <li>
    <span class="glyphicon glyphicon-calendar"></span>
    <time>
      {% assign date_modified = 'date' | jhtml: modified, 'DATE_FORMAT_LC2' %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_LAST_UPDATED', date_modified }}
    </time>
  </li>
</ul>

{% if pagination %}
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
      {{ '_' | jtext: 'JNEXT' }} <span class="glyphicon glyphicon-circle-arrow-right"></span>
    </a>
  </li>
  {% endif %}
</ul>
{% endif %}