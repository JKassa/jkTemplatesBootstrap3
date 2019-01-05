{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% case layout %}
	{% when 'accordion' %}
<div class="{{ class_sfx }}">
  {% assign start = 0 %}
  {% capture selector %}mjkcategories-accordion-{{ start }}{% endcapture %}
  <div class="panel-group" id="{{ selector }}" role="tablist" aria-multiselectable="true">
	{% include 'modules/categories/accordion' %}
  </div>
</div> 
    {% when 'dropdown' %}
<div class="dropdown clearfix {{ class_sfx }}">
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; margin-bottom: 20px; position: static;">
    {% include 'modules/categories/dropdown' %}
  </ul>
  <div style="clear: both;"></div>
</div>
    {% else %}
<ul class="list-unstyled {{ class_sfx }}">
  {% include 'modules/categories/list' %}
</ul>
{% endcase %}