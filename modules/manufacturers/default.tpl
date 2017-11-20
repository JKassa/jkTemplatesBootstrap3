{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-manufacturers-module">
	{% if manufacturers %}
	  {% case layout %}
		{% when 'blocks' %}
		  {% include 'modules/manufacturers/blocks' %}
		{% when 'carousel' %}
		  {% include 'modules/manufacturers/carousel' %}
		{% else %}
		  {% include 'modules/manufacturers/list' %}
	  {% endcase %}
	{% else %}
	  <div class="alert alert-warning">
		{{ '_' | jtext: 'JNONE' }}
	  </div>
	{% endif %}
</div>