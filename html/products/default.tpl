{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

{% if heading %}
<!--Heading-->
<div class="page-header">
  <h1>{{ heading }}</h1>
</div>
{% elsif title %}
<!--Title-->
<div class="page-header">
  <h2>{{ title }}</h2>
</div>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

{% if products or categories %}
  {% if products %}
  <!--List products-->
  <form action="{{ form_action }}" method="post" name="productsForm" id="productsForm">
    <div class="row page-header">
      <div class="col-xs-8">
        <!--Sort by-->
        <span class="glyphicon glyphicon-filter hidden-xs" title="{{ '_' | jtext: 'COM_JKASSA_SORT_TITLE' }}"></span>
        <select data-select="products-sorting" name="product-sorting">
          {% for sort in sorting %}
          <option value="{{ sort.value }}" {{ sort.selected }}>{{ sort.title }}</option>
          {% endfor %}
        </select>
		<span class="hidden-xs">
          <select data-select="products-limit" title="{{ '_' | jtext: 'JSHOW' }}">
            {% for limit in limits %}
            <option value="{{ limit.value }}" {{ limit.selected }}>{{ limit.title }}</option>
            {% endfor %}
          </select>
		</span>
      </div>
      <div class="col-xs-4 text-right">
        <!--Switch product layout-->
        <span class="btn-group">
          <a href="#" data-click="display-block" class="btn btn-sm btn-default {% if layout == 'block' %}active{% endif %}" title="{{ '_' | jtext: 'COM_JKASSA_DISPLAY_BLOCK' }}">
            <span class="glyphicon glyphicon-th-large"></span>
          </a>
          <a href="#" data-click="display-list" class="btn btn-sm btn-default {% if layout == 'list' %}active{% endif %}" title="{{ '_' | jtext: 'COM_JKASSA_DISPLAY_LIST' }}">
            <span class="glyphicon glyphicon-th-list"></span>
          </a>
        </span>
      </div>
    </div>
    
    <!--Layout products-->
    {{ products }}
    
    {% comment %}
        Code to add a link to submit an product.
    {% endcomment %}
    {% if create_icon %}
    <div class="btn btn-default m-b-20">
      {{ create_icon }}
    </div>
    {% endif %}
    
    {% comment %}
        Pages links (pagination).
        See: html/pagination
    {% endcomment %}
    {{ pagesLinks }}
  </form>
  {% endif %}
  
  {% comment %}
      Categories.
      See: views/category/categories.tpl
  {% endcomment %}
  {% if categories %}
    {{ categories }}
  {% endif %}
{% else %}
  <!--No Matching Results-->
  <div class="alert alert-warning">
    {{ '_' | jtext: 'COM_JKASSA_NO_MATCHING_RESULTS' }}
  </div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}