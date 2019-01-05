<!--Name form-->
<h3>
  {{ name }}
</h3>

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<form action="{{ form_action }}" method="post" class="form-horizontal" id="jkOrderForm">
  {% if contacts_fields %}
  <!--Contacts fields-->
  <fieldset>
    <legend>{{ contacts_title }}</legend>
    {% for field in contacts_fields %}
      {% case field.type %}
        {% when 'firstname' %}
          {% include 'html/forms/field_text' %}
        {% when 'middlename' %}
          {% include 'html/forms/field_text' %}
        {% when 'lastname' %}
          {% include 'html/forms/field_text' %}
        {% when 'email' %}
          {% include 'html/forms/field_email' %}
        {% when 'phone' %}
          {% include 'html/forms/field_tel' %}
        {% when 'location' %}
          {% include 'html/forms/field_location' %}
        {% when 'address1' %}
          {% include 'html/forms/field_text' %}
        {% when 'address2' %}
          {% include 'html/forms/field_text' %}
        {% when 'postal_code' %}
          {% include 'html/forms/field_text' %}
        {% when 'website' %}
          {% include 'html/forms/field_url' %}
        {% when 'aboutme' %}
          {% include 'html/forms/field_textarea' %}
        {% when 'dob' %}
          {% include 'html/forms/field_calendar' %}
        {% when 'text' %}
          {% include 'html/forms/field_text' %}
        {% when 'textarea' %}
          {% include 'html/forms/field_textarea' %}
        {% when 'select' %}
          {% include 'html/forms/field_select' %}
        {% when 'radio' %}
          {% include 'html/forms/field_radio' %}
        {% when 'checkbox' %}
          {% include 'html/forms/field_checkbox' %}
        {% when 'mail' %}
          {% include 'html/forms/field_email' %}
        {% when 'tel' %}
          {% include 'html/forms/field_tel' %}
        {% when 'url' %}
          {% include 'html/forms/field_url' %}
	    {% when 'calendar' %}
          {% include 'html/forms/field_calendar' %}
      {% endcase %}
    {% endfor %}
  </fieldset>
  {% endif %}
  
  {% if delivery_fields %}
  <!--Delivery fields-->
  <fieldset id="jk-order-delivery" class="m-b-20">
    <legend>{{ delivery_title }}</legend>
    {% for delivery in delivery_fields %}
    <div class="radio"{% if delivery.showon %} data-showon='{{ delivery.showon }}'{% endif %}>
      <label class="thumbnail">
        <div class="caption">
          <input
            type="radio"
            name="jk_delivery"
            id="{{ delivery.name }}"
            value="{{ delivery.name }}"
            {% if delivery.default %} checked{% endif %}
           >
          <strong>{{ delivery.label }}</strong>
        </div>
		{% if delivery.logo %}
        <p class="help-block"><img src="{{ delivery.logo }}" alt="{{ delivery.name }}" /></p>
        {% endif %}
        {% if delivery.cost != 0.00 %}
        <!--Cost of delivery-->
        <span class="help-block">
          {{ '_' | jtext: 'COM_JKASSA_COST_DELIVERY' }}:
		  <strong>{{ delivery.cost | costDisplay }}{{ currency.symbol }}</strong>
        </span>
        {% endif %}
        {% if delivery.free != 0.00 %}
        <!--Free delivery-->
        <span class="text-info">
          {{ '_' | jtext: 'COM_JKASSA_ORDER_FREE_DELIVERY' }}
		  <strong>{{ delivery.free | costDisplay }}{{ currency.symbol }}</strong>
        </span>
        {% endif %}
        {% if delivery.tooltip %}
        <!--Description delivery-->
        <span class="help-block">
          {{ delivery.tooltip }}
        </span>
        {% endif %}
      
	    {% if delivery_add_fields %}
          <!--Additional fields for delivery-->
          {% for field in delivery_add_fields %}
		    {% if field.delivery == delivery.name %}
              {% case field.type %}
                {% when 'text' %}
                  {% include 'html/forms/field_text' %}
                {% when 'textarea' %}
                  {% include 'html/forms/field_textarea' %}
                {% when 'select' %}
                  {% include 'html/forms/field_select' %}
                {% when 'radio' %}
                  {% include 'html/forms/field_radio' %}
                {% when 'checkbox' %}
                  {% include 'html/forms/field_checkbox' %}
                {% when 'calendar' %}
                  {% include 'html/forms/field_calendar' %}
		  		{% when 'note' %}
                  {% include 'html/forms/field_note' %}
              {% endcase %}
		    {% endif %}
          {% endfor %}
        {% endif %}
	  </label>
    </div>
    {% endfor %}
  </fieldset>
  {% endif %}
  
  {% if payment_fields %}
  <!--Payment fields-->
  <fieldset class="m-b-20">
    <legend>{{ payment_title }}</legend>
    {% for payment in payment_fields %}
    <div class="radio"{% if payment.showon %} data-showon='{{ payment.showon }}'{% endif %}>
      <label class="thumbnail">
        <div class="caption">
          <input
            type="radio"
            name="jk_payment"
            id="{{ payment.name }}"
            value="{{ payment.name }}"
            {% if payment.default %} checked{% endif %}
          >
          <strong>{{ payment.label }}</strong>
        </div>
        {% if payment.logo %}
        <p class="help-block"><img src="{{ payment.logo }}" alt="{{ payment.name }}" /></p>
        {% endif %}
        {% if payment.tooltip %}
        <p class="help-block">{{ payment.tooltip }}</p>
        {% endif %}
	  
	    {% if payment_add_fields %}
          <!--Additional fields for payment-->
          {% for field in payment_add_fields %}
		    {% if field.payment == payment.name %}
              {% case field.type %}
                {% when 'text' %}
                  {% include 'html/forms/field_text' %}
                {% when 'textarea' %}
                  {% include 'html/forms/field_textarea' %}
                {% when 'select' %}
                  {% include 'html/forms/field_select' %}
                {% when 'radio' %}
                  {% include 'html/forms/field_radio' %}
                {% when 'checkbox' %}
                  {% include 'html/forms/field_checkbox' %}
                {% when 'calendar' %}
                  {% include 'html/forms/field_calendar' %}
              {% endcase %}
		    {% endif %}
          {% endfor %}
        {% endif %}
	  </label>
    </div>
    {% endfor %}
  </fieldset>
  {% endif %}
  
  {% if privacy %}
  <!--Privacy Policy-->
  <fieldset>
	<legend>{{ privacy.legend }}</legend>
	<div class="alert alert-info">{{ privacy.note }}</div>
    <div class="form-group">
	  <label class="col-sm-4 control-label" for="jk_privacy">
		{% if privacy.article %}
		<a href="#" data-click="show-modal" data-id="jk-modal_privacy" data-src="{{ privacy.article }}">
		  {{ privacy.label }}
		</a>
		{% else %}
		{{ privacy.label }}
		{% endif %}
		<span class="text-danger">*</span>
	  </label>
	  <div class="col-sm-8">
	    <fieldset id="jk_privacy" class="required radio hasTooltip" required="required" aria-required="true" title="{{ privacy.desc }}">
		  <label>
		    <input id="jk_privacy0" name="jk_privacy" value="1" required="" aria-required="true" type="radio">
		    {{ privacy.agree }}
		  </label>
		  <label>
		    <input id="jk_privacy1" name="jk_privacy" value="0" checked="checked" required="" aria-required="true" type="radio">
		    {{ '_' | jtext: 'JNO' }}
		  </label>
		</fieldset>
	  </div>
	</div>
  </fieldset>
  {% endif %}
  
  {% if rules %}
  <!--Shop rules-->
  <div class="checkbox">
    <label>
      <input type="checkbox" id="jk_rules" name="jk_rules" value="1">
      <a href="#" data-click="show-modal" data-id="jk-modal_rules">
        {{ '_' | jtext: 'COM_JKASSA_ENABLEPROCESS' }}
      </a>
    </label>
  </div>
  {% endif %}
  
  {% if captcha %}
  <!--CAPTCHA-->
  <div class="m-t-15">
    {{captcha}}
  </div>
  {% endif %}
  
  <input type="submit" data-click="order-form" class="btn btn-info m-t-15" value="{{ '_' | jtext: 'COM_JKASSA_SEND_ORDER' }}">
</form>

{% if posttext %}
<!--Posttext-->
<div class="m-t-15">
  {{ posttext }}
</div>
{% endif %}

{% if privacy.article %}
  <!--Madal body for Privacy-->
  {% capture footer_modal %}
  <button type="button" class="btn btn-default" data-dismiss="modal">
    {{ '_' | jtext: 'COM_JKASSA_CLOSE' }}
  </button>
  {% endcapture %}
  {{ 'renderModal' | bootstrap3: 'jk-modal_privacy', 'modal-lg', privacy.legend, '', footer_modal, true }}
{% endif %}

{% if rules %}
  <!--Madal body for Rules-->
  {% capture footer_modal %}
  <button type="button" class="btn btn-default" data-dismiss="modal">
    {{ '_' | jtext: 'COM_JKASSA_CLOSE' }}
  </button>
  {% endcapture %}
  {{ 'renderModal' | bootstrap3: 'jk-modal_rules', 'modal-lg', 'COM_JKASSA_SHOP_RULES', rules, footer_modal }}
{% endif %}