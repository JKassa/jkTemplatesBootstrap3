{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

<div class="row">
  <div class="col-xs-3 product-image">
    <img {{ image | img_exists: '104x150' }} alt="{{ alias }}" />
    {% if present %}
    <!--Share (Product as a present)-->
    <div class="share hasTooltip" title="{{ 'tooltipText' | jhtml: present.name, present.desc }}">
      <div class="sharetitle">
        {{ '_' | jtext: 'COM_JKASSA_GIFT' }}
      </div>
      <div class="sharedesc">
        <a href="{{ present.url }}">
          <img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
        </a>
      </div>
    </div>
    {% endif %}
  </div>
  <div class="col-xs-9">
    <h4>
      <a href="{{ url }}" target="_blank">
        {{ name }}
      </a>
      
      {% if files %}
      <!--Files-->
      <span title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ files | join: '<br>' }}" class="hasTooltip" data-placement="right">
        <span class="glyphicon glyphicon-download small"></span>
      </span>
      {% endif %}
    </h4>
    
    <!--SKU (code)-->
    <div class="text-muted small m-t-5">
      {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ sku }}
    </div>
    
    {% if variants %}
    <div class="m-t-10">
      {% for variant in variants %}
        {{ variant.name }}:
        {% case variant.type %}
          {% when 'radio' %}
            <span class="variant-radio-value">
              {{ variant.text }}
            </span>
          {% when 'color' %}
            <span class="minicolors-swatch">
              <span style="background-color: {{ variant.value }};" title="{{ variant.text }}"></span>
            </span>
          {% when 'select' %}
            <span>
              {{ variant.text }}
            </span>
        {% endcase %}
      {% endfor %}
    </div>
    {% endif %}
    
    <!--Cost-->
    <div class="m-t-10">
      <!--old cost-->
      {% if old_cost %}
      <del class="text-muted">{{ old_cost }}{{ currency.symbol }}</del>
      {% endif %}
      <!--cost-->
      <span class="lead">{{ cost }}</span>{{ currency.symbol }}
    </div>
  </div>
</div>

<hr>

<form action="{{ form_action }}" method="post" id="waitingList">
  <fieldset>
    {% for field in fields %}
      {% case field.type %}
        {% when 'firstname' %}
          {% include 'html/forms/field_text' %}
        {% when 'email' %}
          {% include 'html/forms/field_email' %}
      {% endcase %}
    {% endfor %}
  </fieldset>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <input type="submit" data-click="waitinglist-form" class="btn btn-info m-t-15" value="{{ '_' | jtext: 'JSUBMIT' }}">
    </div>
  </div>
</form>

<div class="alert alert-success" id="waitingListAlert" style="display:none">
  <h4>{{ '_' | jtext: 'COM_JKASSA_WAITINGLIST_N_1' }}</h4>
  {{ '_' | jtext: 'COM_JKASSA_WAITINGLIST_N_2' }}
</div>