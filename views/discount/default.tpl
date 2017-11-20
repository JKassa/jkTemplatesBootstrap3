{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}

{% if heading %}
<!--Heading-->
<h1 class="page-header m-t-0">
  {{ heading }}
</h1>
{% endif %}

<div class="discount">
  <div>
    <!--Image item-->
    <img {{ image | img_exists: '700x252' }} alt="{{ alias }}" />
    
    <div class="discount-block">
      <div class="row m-0">
        <div class="col-xs-7 discount-left">
          {% if timer %}
          <div class="discount-timer" id="discount-timer-{{ id }}">
            <div class="timer-text">{{ timer.text_start }}</div>
            <div class="timer-block" id="timer-day-{{ id }}"></div>
            <div class="timer-block" id="timer-hour-{{ id }}"></div>
            <div class="timer-block" id="timer-minute-{{ id }}"></div>
            <div class="timer-block" id="timer-second-{{ id }}"></div>
          </div>
          <script type="text/javascript">
			jQuery('#discount-timer-{{ id }}').countdown('{{ timer.time }}')
			.on('update.countdown', function(event)
			{
				if (event.offset.days > 0)
				{
					// days
					var sDay = +event.strftime('%D');
					var tDay = timeFormats(sDay, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY' }}");
					
					jQuery('#timer-day-{{ id }}').html(event.strftime('%D<br>' + tDay));
					jQuery('#timer-second-{{ id }}').hide();
				}
				else
				{
					// second
					var sSecond = +event.strftime('%S');
					var tSecond = timeFormats(sSecond, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND' }}");
					
					jQuery('#timer-day-{{ id }}').hide();
					jQuery('#timer-second-{{ id }}').html(event.strftime('%S<br>' + tSecond));
				}
				
				// hour
				var sHour = +event.strftime('%H');
				var tHour = timeFormats(sHour, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR' }}");
				
				jQuery('#timer-hour-{{ id }}').html(event.strftime('%H<br>' + tHour));
				
				// minute
				var sMinute = +event.strftime('%M');
				var tMinute = timeFormats(sMinute, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE' }}");
				
				jQuery('#timer-minute-{{ id }}').html(event.strftime('%M<br>' + tMinute));
			})
			.on('finish.countdown', function(event)
			{
				jQuery(this).html('<span class="timer-text timer-text text-{% if timer.event == "start" %}success{% else %}danger{% endif %}">{{ timer.text_end }}</span>')
					.parent().addClass('disabled');
			});
			
			// Time formats
			function timeFormats(n, f, s, t)
			{
				"use strict";
				
				// f - 1, 21, 31, ...
				// s - 2-4, 22-24, 32-34 ...
				// t - 5-20, 25-30, ...
				
				n = n % 100;
				var n10 = n % 10;
				
				if ((n10 === 1) && ((n === 1) || (n > 20) )) {
					return f;
				} else if ((n10 > 1) && (n10 < 5) && ((n > 20) || (n < 10))) {
					return s;
				} else {
					return t;
				}
			}
          </script>
          {% endif %}
        </div>
        <div class="col-xs-5 discount-right">
          {% if discount %}
          <div class="discount-value">
            {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }}
            <br>
            <span>{{ discount | costDisplay }}{{ d_symbol }}</span>
          </div>
          {% endif %}
          
          <div class="discount-desc">
            <h3>
              {{ name }}<br>
              <small>{{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', products_quantity }}</small>
            </h3>
            {{ introtext }}
          </div>
          
        </div>
      </div>
    </div>
  </div>
</div>

{% if fulltext %}
<div>
  {{ fulltext }}
</div>
{% endif %}

<hr>

<!--Layout products-->
{{ products }}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ id | jkcomments: name }}