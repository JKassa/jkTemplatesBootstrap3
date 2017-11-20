{% comment %}
	Parameters of the category.
{% endcomment %}
{% assign span = tpl_params.cats_span | default_value: 6 %}
{% assign height = tpl_params.cats_height | default_value: 320 %}
{% assign img_height = tpl_params.cats_img_height | default_value: 213 %}
{% assign cats_desc_length = tpl_params.cats_desc_length | default_value: 0 %}

<!--List categories-->
<div class="row list-categories">
  <ul class="list-unstyled">
    {% for category in categories %}
    <li class="col-md-{{ span }} col-xs-12">
      <div class="thumbnail p-10" style="height:{{ height }}px; position: relative;">
        <!--Title category and URL category-->
        <h3 class="m-t-0">
          <a href="{{ category.url }}">
            {{ category.title }}
          </a>
        </h3>
        <!--Image category-->
        <div>
          <img {{ category.image | img_exists: '321x213' }} style="max-width: 100%; max-height: {{ img_height }}px;" alt="{{ category.image_alt }}" />
        </div>
		{% if category.desc and cats_desc_length %}
        <!--Description category-->
        <div class="m-t-10 small">
          {{ category.desc | truncateDesc: cats_desc_length }}
        </div>
		{% endif %}
        <div style="position:absolute; bottom:15px; left: 10px; right: 10px;">
          {% if category.children %}
          <!--Subcategories-->
          <div class="dropdown">
            <a href="#" role="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle" id="drop{{ category.id }}">
              {{ '_' | jtext: 'JGLOBAL_SUBCATEGORIES' }}
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="drop{{ category.id }}">
              {{ category.children }}
            </ul>
          </div>
          {% else %}
          <!--Products Quantity & Link to the category-->
          <a href="{{ category.url }}" class="btn btn-default" title="{{ '_' | jtext: 'COM_JKASSA_QTY' }}: {{ category.num }}">
            <span class="badge">{{ category.num }}</span>
            {{ '_' | jtext: 'COM_JKASSA_READ_MORE_CAT' }}
          </a>
          {% endif %}
        </div>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>