{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'tooltip' | bootstrap3 }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form">
  <ul class="nav nav-tabs m-b-15" role="tablist">
    {% if filter_cost %}
    <li role="presentation" class="{% if active == 'cost' %}active{% endif %}">
      <a href="#filterCost" aria-controls="filterCost" role="tab" data-toggle="tab">
        {{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}
      </a>
    </li>
    {% endif %}
    {% if manufacturers %}
    <li role="presentation" class="{% if active == 'manufacturers' %}active{% endif %}">
      <a href="#filterManufacturers" aria-controls="filterManufacturers" role="tab" data-toggle="tab">
        {{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}
      </a>
    </li>
    {% endif %}
    {% if attributes %}
    <li role="presentation" class="{% if active == 'attributes' %}active{% endif %}">
      <a href="#filterAttributes" aria-controls="filterAttributes" role="tab" data-toggle="tab">
        {{ '_' | jtext: 'MOD_JKASSA_FILTER_MORE_FILTERS' }}
      </a>
    </li>
    {% endif %}
  </ul>
  <div class="tab-content">
    {% if filter_cost %}
    <!--Filter cost-->
    <div role="tabpanel" class="tab-pane{% if active == 'cost' %} active{% endif %}" id="filterCost">
      <!--Costs-->
      <div class="row">
        <div class="col-xs-2">
          <div class="input-group">
            <span class="input-group-addon">{{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}</span>
            <input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" class="form-control" value="{{ min_cost }}" />
          </div>
        </div>
        <!--Slider-->
        {% if slider %}
        <div class="col-xs-4 jk-slider-filter">
          <div id="jk_slider_filter"></div>
          <script type="text/javascript">
            // slide fix conflict with mootools
            if (typeof jQuery != 'undefined' && typeof MooTools != 'undefined' ) {
                Element.implement({
                    slide: function(how, mode){
                        return this;
                    }
                });
            }
          </script>
          {% endif %}
        </div>
        <div class="col-xs-2">
          <div class="input-group">
            <input type="text" id="max_cost" name="max_cost" placeholder="{{ max_default }}" class="form-control" value="{{ max_cost }}" />
            <span class="input-group-addon">{{ '_' | jtext: 'MOD_JKASSA_FILTER_TO' }}</span>
          </div>
        </div>
      </div>
    </div>
    {% endif %}
    
    {% if manufacturers %}
    <!--Filter manufacturers-->
    <div role="tabpanel" class="tab-pane{% if active == 'manufacturers' %} active{% endif %}" id="filterManufacturers">
      <ul class="list-inline text-center">
        {% for manufacturer in manufacturers %}
        <li class="checkbox">
          <label>
            <input
              id="manufacturer_{{ manufacturer.id }}"
              type="checkbox"
              name="manufacturer[]"
              value="{{ manufacturer.id }}"
              {% if manufacturer.checked %}checked{% endif %}
            />
            {% if manufacturer.thumbnail %}
            <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 50px; max-width: 50px;" />
            {% endif %}
            {{ manufacturer.name }}
            {% if manufacturer.products %}
            <small class="text-muted">
              ({{ manufacturer.products }})
            </small>
            {% endif %}
          </label>
        </li>
        {% endfor %}
      </ul>
    </div>
    {% endif %}
    
    {% if attributes %}
    <!--Filter attributes-->
    <div role="tabpanel" class="tab-pane{% if active == 'attributes' %} active{% endif %}" id="filterAttributes">
      <div class="row horizontal-filters">
        {% for attribute in attributes %}
        <div class="col-xs-4">
          <strong>
            {{ attribute.name }}
            {% if attribute.tooltip %}
            <span class="hasTooltip" title="{{ attribute.tooltip }}">
              <span class="glyphicon glyphicon-info-sign"></span>
            </span>
            {% endif %}
          </strong>
          {% for value in attribute.values %}
          <div class="checkbox">
            <label>
              <input
                id="attribute_{{ attribute.id }}_{{ value.key }}"
                type="checkbox"
                name="attribute[{{ attribute.id }}][]"
                value="{{ value.val }}"
                {% if value.checked %}checked{% endif %}
                {% if value.disabled %}disabled{% endif %}
              />
              {% if value.disabled %}<small class="text-muted">{% endif %}
              {{ value.val }} {{ attribute.prefix }}
              {% if value.disabled %}</small>{% endif %}
              {% if value.count %}
              <small class="text-muted">
                ({{ value.count }})
              </small>
              {% endif %}
            </label>
          </div>
          {% endfor %}
        </div>
        {% endfor %}
      </div>
    </div>
    {% endif %}
    
    {% if show_ok or show_reset %}
    <!--Buttons-->
    <div class="btn-group m-t-10">
      {% if show_ok %}
      <button type="button" class="btn btn-sm btn-primary" data-click="submit-filter">
        <span class="glyphicon glyphicon-ok"></span>
        {{ '_' | jtext: 'MOD_JKASSA_FILTER_OK' }}
      </button>
      {% endif %}
      {% if show_reset %}
      <button type="button" class="btn btn-default btn-sm" data-click="reset-filter">
        <span class="glyphicon glyphicon-refresh"></span>
        {{ '_' | jtext: 'MOD_JKASSA_FILTER_RESET' }}
      </button>
      {% endif %}
    </div>
    {% endif %}
  </div>
</form>