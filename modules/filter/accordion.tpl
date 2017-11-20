{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'tooltip' | bootstrap3 }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form">
  <div class="panel-group" id="filtersAccordian" role="tablist" aria-multiselectable="true">
  
    {% if filter_cost %}
    <!--Filter cost-->
    <div class="panel panel-default">
      <div class="panel-heading" role="tab">
        <h4 class="panel-title">
          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#filtersAccordian" href="#filterCost" aria-expanded="false">
            {{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}
          </a>
        </h4>
      </div>
      <div id="filterCost" class="panel-collapse collapse in">
        <div class="panel-body">
          <!--Slider-->
          {% if slider %}
          <div class="jk-slider-filter">
            <div id="jk_slider_filter"></div>
          </div>
          {% endif %}
          <!--Costs-->
          <div class="row">
            <div class="col-xs-6">
              <div class="input-group">
                <span class="input-group-addon">{{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}</span>
                <input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" class="form-control" value="{{ min_cost }}" />
              </div>
            </div>
            <div class="col-xs-6">
              <div class="input-group">
                <input type="text" id="max_cost" name="max_cost" placeholder="{{ max_default }}" class="form-control" value="{{ max_cost }}" />
                <span class="input-group-addon">{{ '_' | jtext: 'MOD_JKASSA_FILTER_TO' }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    {% endif %}
    
    {% if manufacturers %}
    <!--Filter manufacturers-->
    <div class="panel panel-default">
      <div class="panel-heading" role="tab">
        <h4 class="panel-title">
          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#filtersAccordian" href="#filterManufacturers" aria-expanded="false">
            {{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}
          </a>
        </h4>
      </div>
      <div id="filterManufacturers" class="panel-collapse collapse">
        <div class="panel-body">
          {% for manufacturer in manufacturers %}
          <div class="checkbox">
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
          </div>
          {% endfor %}
        </div>
      </div>
    </div>
    {% endif %}
    
    {% if attributes %}
      <!--Filter attributes-->
      {% for attribute in attributes %}
        {% capture filter_attr %}filterAttribute_{{ attribute.id }}{% endcapture %}
        <div class="panel panel-default">
          <div class="panel-heading" role="tab">
            <h4 class="panel-title">
              <a class="collapsed" role="button" data-toggle="collapse" data-parent="#filtersAccordian" href="#{{ filter_attr }}" aria-expanded="false">
                {{ attribute.name }}
                {% if attribute.tooltip %}
                <span class="hasTooltip" title="{{ attribute.tooltip }}">
                  <span class="glyphicon glyphicon-info-sign"></span>
                </span>
                {% endif %}
              </a>
            </h4>
          </div>
          <div id="{{ filter_attr }}" class="panel-collapse collapse">
            <div class="panel-body">
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
          </div>
        </div>
      {% endfor %}
    {% endif %}
  </div>
  
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
</form>