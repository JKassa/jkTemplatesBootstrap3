{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}
<form action="{{ action }}" method="post" class="form-horizontal" id="jkAffiliateForm">
	{% if payment_fields %}
	<!--Payment fields-->
	<fieldset>
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
				<p class="help-block">
					<img src="{{ payment.logo }}" alt="{{ payment.name }}" />
				</p>
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
	{% if contacts_fields %}
	<!--Contacts fields-->
	<fieldset class="m-t-15">
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
	{% if rules %}
	<!--Shop rules-->
	<div class="checkbox">
		<label>
			<input type="checkbox" id="jk_rules" name="jk_rules" value="1">
			<a href="#" data-click="show-modal" data-id="jk-modal_rules">
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_CHECK_RULES' }}
			</a>
		</label>
	</div>
	{% endif %}
	<input type="submit" data-click="affiliate-form" class="btn btn-info m-t-15" value="{{ '_' | jtext: 'JSAVE' }}">
</form>
{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% if rules %}
<!--Madal body for Rules-->
{% capture footer_modal %}
<button type="button" class="btn btn-default" data-dismiss="modal">
	{{ '_' | jtext: 'COM_JKASSA_CLOSE' }}
</button>
{% endcapture %}
{{ 'renderModal' | bootstrap3: 'jk-modal_rules', '', 'COM_JKASSA_SHOP_RULES', rules, footer_modal }}
{% endif %}