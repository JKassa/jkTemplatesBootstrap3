{% assign rows		= manufacturers | arrayChunk: 4 %}
{% assign active	= 0 %}
{% assign dataslide	= 0 %}

<div class="carousel slide mjkcarousel" id="mjkmCarousel_{{ mod_id }}">
  <ol class="carousel-indicators">
    {% for row in rows %}
    <li data-target="#mjklCarousel_{{ mod_id }}" data-slide-to="{{ dataslide }}" class="{% if dataslide == 0 %}active{% endif %}"></li>
    {% assign dataslide = dataslide | plus: 1 %}
    {% endfor %}
  </ol>
  <div class="carousel-inner">
    {% for row in rows %}
    {% assign active = active | plus: 1 %}
    <div class="item {% if active == 1 %}active{% endif %}">
      <ul class="row list-unstyled">
        {% for manufacturer in row %}
        <li class="col-xs-3">
          <div class="thumbnail">
            <div style="height: {{ block_height }}px">
              {% if manufacturer.thumbnail %}
              <div class="manufacturer-thumbnail" style="text-align: center">
                <a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
                  <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 75px; max-width: 75px" />
                </a>
              </div>
              {% endif %}
              <div class="caption">
                <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
                  <a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
                    {{ manufacturer.name }}
                  </a>
				  {% if products %}
				  <small class="text-muted">({{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
				  {% endif %}
                </div>
                {% if manufacturer.introtext %}
                <div class="m-t-5" style="font-size: 11px; line-height: 14px">
                  {{ manufacturer.introtext | truncateDesc: 35 }}
                </div>
                {% endif %}
              </div>
            </div>
            <div class="caption">
              {% if readmore %}
              <div class="m-t-5">
                <a class="btn btn-primary btn-xs" href="{{ manufacturer.url }}">
                  {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }} <span class="glyphicon glyphicon-arrow-right"></span>
                </a>
              </div>
              {% endif %}
            </div>
          </div>
        </li>
        {% endfor %}
      </ul>
    </div>
    {% endfor %}
  </div>
  <a data-slide="prev" href="#mjkmCarousel_{{ mod_id }}" class="left carousel-control">&lsaquo;</a>
  <a data-slide="next" href="#mjkmCarousel_{{ mod_id }}" class="right carousel-control">&rsaquo;</a>
</div>