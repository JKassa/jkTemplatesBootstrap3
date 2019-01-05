{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-compare-module" class="{{ class_sfx }}">
	{% capture popover_html %}
	<div class="row">
		{% if image %}
		<!--Image-->
		<div class="col-xs-3">
			<a href="{{ url_compare }}">
				<img alt="compare" src="{{ image }}" title="{{ image_title }}">
			</a>
		</div>
		{% endif %}
		<div class="{% if image %}col-xs-9{% else %}col-xs-12{% endif %}">
			{% if categories %}
			<!--Categories-->
			<ul class="list-unstyled">
				{% for category in categories %}
				<li style="white-space: nowrap">
					{% if category.products_total == 1 %}
					<span title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_NOT_ENOUGH' }}">
						{{ category.title }}
						<small>({{ category.products_total }})</small>
					</span>
					{% else %}
					<a href="{{ category.url }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_COMPARE' }}">
						{{ category.title }}
						<small>({{ category.products_total }})</small>
					</a>
					{% endif %}
					<!--remove compare category-->
					<a href="javascript:;" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_REMOVE' }}">
						<span class="glyphicon glyphicon-remove text-danger" style="font-size:10px"></span>
					</a>
				</li>
				{% endfor %}
			</ul>
			{% else %}
			<p class="text-muted">
				<em>
					{% if text_empty %}
					{{ text_empty }}
					{% else %}
					{{ '_' | jtext: 'MOD_JKASSA_COMPARE_YOUR_COMPARE_EMPTY' }}
					{% endif %}
				</em>
			</p>
			{% endif %}
		</div>
		{% if categories %}
		<!--URL: Go to comparison-->
		<div class="col-xs-12 text-center">
			<hr class="m-t-5 m-b-5">
			<a href="{{ url_compare }}" class="btn btn-sm btn-default">
				<i class="glyphicon glyphicon-chevron-right"></i>
				{{ '_' | jtext: 'JLIB_HTML_VIEW_ALL' }}
			</a>
		</div>
		{% endif %}
	</div>
	{% endcapture %}
	<div class="jk-compare-popover">
		<a href="javascript:;" data-toggle="popover" style="display: block; position: relative; width: 30px; height: 30px">
			<span style="display: block; margin-top: 5px">
				<img alt="compare" src="{{ image }}">
			</span>
			<span style="top: -5px; right: -10px; position: absolute">
				<span class="badge"{% if categories %} style="background-color: #337ab7"{% endif %}>{{ quantity_products }}</span>
			</span>
		</a>
	</div>
	<div class="jk-compare-popover-content" style="display: none;">
		{{ popover_html }}
	</div>
	<script type="text/javascript">
		jQuery(document).ready(function () {
			"use strict";
			jQuery('.jk-compare-popover a').popover({
				html: true,
				placement: 'bottom',
				container: 'body',
				title: "{{ '_' | jtext: 'MOD_JKASSA_COMPARE_YOUR_COMPARE' }}",
				content: function () {
					return jQuery('.jk-compare-popover-content').html();
				}
			}).click(function (e) {
				e.preventDefault();
				jQuery(this).focus();
			});
			jQuery(document).mouseup(function (e) {
				var container = jQuery('.jk-compare-popover');

				if (container.has(e.target).length === 0) {
					jQuery('.jk-compare-popover a').popover('hide');
				}
			});
		});
	</script>
</div>