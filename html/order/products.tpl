<table class="table table-striped table-hover">
  <thead>
    <tr>
      <!--ID/Code-->
      <th width="1%" class="text-center nowrap hidden-phone">
        {{ '_' | jtext: 'COM_JKASSA_ID_SKU' }}
      </th>
      <!--Name-->
      <th>
        {{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}
      </th>
      <!--Price (per 1 unit)-->
      <th class="text-center hidden-phone">
        {{ '_' | jtext: 'COM_JKASSA_PRICE_1' }}
      </th>
      <!--Count-->
      <th width="1%">
        {{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}
      </th>
      <!--Price-->
      <th>
        {{ '_' | jtext: 'COM_JKASSA_COST' }}
      </th>
    </tr>
  </thead>
  <tbody>
    {% for product in products %}
    <tr>
      <!--ID/Code-->
      <td class="text-center hidden-phone">
        {{ product.id }}
        {% if product.id != product.sku %}
        <br />
        {{ product.sku }}
        {% endif %}
      </td>
      <!--Name-->
      <td>
        {% if product.image %}
        <div style="float: left; margin-right: 5px;">
          <img {{ product.image | img_exists: '80x80' }} alt="{{ product.alias }}" style="max-height: 80px; max-width: 80px;" />
        </div>
        {% endif %}
        <a href="{{ product.url }}" target="_blank" title="{{ '_' | jtext: 'COM_JKASSA_SHOW_SHOP' }}">
          {{ product.name }}
        </a>
        {% if product.present %}
        + <a href="{{ product.present.url }}">{{ product.present.name }}</a>
        {% endif %}
        {% if product.variants %}
        <p>
          <small>
            {% for variant in product.variants %}
              {{ variant.name }}:
              {% case variant.type %}
                {% when 'radio' %}
                <span class="variant-radio-value">
                  {{ variant.value }}
                </span>
                {% when 'color' %}
                <span class="minicolors-swatch">
                  <span style="background-color: {{ variant.value }};" title="{{ variant.title }}"></span>
                </span>
                {% when 'select' %}
                <span>
                  {{ variant.value }}
                </span>
              {% endcase %}
            {% endfor %}
          </small>
        </p>
        {% endif %}
        {% if product.attachment %}
        <fieldset>
          <legend style="font-size: 16px; line-height: 26px; margin-bottom: 10px;">
            {{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}
          </legend>
          <ul class="list-unstyled">
            {% for file in product.attachment %}
            <li>
              <span class="glyphicon glyphicon-download small"></span>
              <a href="javascript:;" onClick="{{ file.url }}" title="{{ '_' | jtext: 'COM_JKASSA_FILE_DOWNLOAD' }}">
                {{ file.name }}
              </a>
            </li>
            {% endfor %}
          </ul>
        </fieldset>
        {% endif %}
      </td>
      <!--Price (per 1 unit)-->
      <td class="text-center hidden-phone">
        {{ product.cost | costDisplay }}{{ currency.symbol }}
      </td>
      <!--Count-->
      <td class="text-center">
        {{ product.quantity }}
      </td>
      <!--Price-->
      <td class="text-center">
        {{ product.price | costDisplay }}{{ currency.symbol }}
		{% if product.vat %}
		<br>
	    <!--vat-->
	    <span class="text-muted small">
		  ({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
	    </span>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
    
    <!--Cost of products-->
    <tr>
      <td colspan="3" class="text-right" style="text-align: right">
        {{ '_' | jtext: 'COM_JKASSA_COST_PRODUCTS' }}:
      </td>
      <td colspan="2">
        {{ pm_total | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
    
    {% if discounts %}
    <!--Discounts data-->
    {% for discount in discounts %}
    <tr>
      <td colspan="3" class="text-right" style="text-align: right">
      {{ discount.name }}:
      </td>
      <td colspan="2">
        {{ discount.difference | costDisplay }}{{ currency.symbol }}
		{% if discount.percent %}
		<em>({{ discount.discount }}%)</em>
		{% endif %}
      </td>
    </tr>
    {% endfor %}
    {% endif %}
    
    {% if delivery %}
    <!--Cost of delivery-->
    <tr>
      <td colspan="3" class="text-right" style="text-align: right">
        {{ '_' | jtext: 'COM_JKASSA_DELIVERY_CHARGES' }}:
      </td>
      <td colspan="2">
        {{ delivery.cost | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
    {% endif %}
	
	{% if sum_vat %}
	<!--Sum of VAT-->
	<tr>
	  <td colspan="3" class="text-right" style="text-align: right">
        {{ '_' | jtext: 'COM_JKASSA_VAT' }}:
      </td>
      <td colspan="2">
        {{ sum_vat | costDisplay }}{{ currency.symbol }}
      </td>
	</tr>
	{% endif %}
	
	{% if taxes %}
	<!--Taxes-->
	{% for tax in taxes %}
	<tr>
	  <td colspan="3" class="text-right" style="text-align: right">
        {{ tax.name }}:
      </td>
      <td colspan="2">
        {{ tax.tax }}%
		{% if tax.description %}
        <span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ tax.description }}"></span>
        {% endif %}
      </td>
	</tr>
	{% endfor %}
	{% endif %}
    
    <!--Total-->
    <tr style="font-weight: bold;">
      <td colspan="3" class="text-right" style="text-align: right">
        {{ '_' | jtext: 'COM_JKASSA_TOTAL' }}:
      </td>
      <td colspan="2">
        {{ pm_in_total | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
  </tbody>
</table>