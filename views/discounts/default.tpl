{% comment %}
	Connect CSS and JavaScript to the header of the document
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap3 }}

<!--Header-->
<div class="page-header">
  {% if heading %}
  <h1>{{ heading }}</h1>
  {% else %}
  <h2>{{ title }}</h2>
  {% endif %}
</div>

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<!--List items-->
{% if items %}
<ul class="list-unstyled discount">
  {% for item in items %}
  <li>
    <!--Image item-->
    <img {{ item.image | img_exists: '700x252' }} alt="{{ item.alias }}" />
    
    <div class="discount-block">
      <div class="row m-0">
        <div class="col-xs-7 discount-left">
          {% if item.timer %}
          <div class="discount-timer" id="discount-timer-{{ item.id }}">
            <div class="timer-text">{{ item.timer.text_start }}</div>
            <div class="timer-block" id="timer-day-{{ item.id }}"></div>
            <div class="timer-block" id="timer-hour-{{ item.id }}"></div>
            <div class="timer-block" id="timer-minute-{{ item.id }}"></div>
            <div class="timer-block" id="timer-second-{{ item.id }}"></div>
          </div>
          <script type="text/javascript">
			jQuery('#discount-timer-{{ item.id }}').countdown('{{ item.timer.time }}')
			.on('update.countdown', function(event)
			{
				if (event.offset.days > 0)
				{
					// days
					var sDay = +event.strftime('%D');
					var tDay = timeFormats(sDay, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY' }}");
					
					jQuery('#timer-day-{{ item.id }}').html(event.strftime('%D<br>' + tDay));
					jQuery('#timer-second-{{ item.id }}').hide();
				}
				else
				{
					// second
					var sSecond = +event.strftime('%S');
					var tSecond = timeFormats(sSecond, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND' }}");
					
					jQuery('#timer-day-{{ item.id }}').hide();
					jQuery('#timer-second-{{ item.id }}').html(event.strftime('%S<br>' + tSecond));
				}
				
				// hour
				var sHour = +event.strftime('%H');
				var tHour = timeFormats(sHour, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR' }}");
				
				jQuery('#timer-hour-{{ item.id }}').html(event.strftime('%H<br>' + tHour));
				
				// minute
				var sMinute = +event.strftime('%M');
				var tMinute = timeFormats(sMinute, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE' }}");
				
				jQuery('#timer-minute-{{ item.id }}').html(event.strftime('%M<br>' + tMinute));
			})
			.on('finish.countdown', function(event)
			{
				jQuery(this).html('<span class="timer-text timer-text text-{% if item.timer.event == "start" %}success{% else %}danger{% endif %}">{{ item.timer.text_end }}</span>')
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
          {% if item.discount %}
          <div class="discount-value">
            {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }}
            <br>
            <span>{{ item.discount | costDisplay }}{{ item.d_symbol }}</span>
          </div>
          {% endif %}
          
          <div class="discount-desc">
            <h3>{{ item.name }}</h3>
            {{ item.introtext }}
          </div>
          
          <div class="discount-more">
            <a href="{{ item.url }}">
              {{ '_' | jtext: 'JDETAILS' }}
            </a>
          </div>
        </div>
      </div>
    </div>
      
  </li>
  {% endfor %}
</ul>
{% else %}
<div class="alert alert-warning">
  {{ no_items }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ Itemid | jkcomments: title }}