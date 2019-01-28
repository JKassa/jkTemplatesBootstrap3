{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if reviews %}
<ul class="media-list">
	{% for review in reviews %}
	<li class="media">
		{% if show_avatar %}
		<div class="media-left">
			<img src="{{ review.user_img }}" alt="{{ review.user_name }}" class="media-object img-circle" style="width: 44px; height: 44px;">
		</div>
		{% endif %}
		<div class="media-body">
			<h4 class="media-heading">
				{{ review.user_name }} - <a href="{{ review.product_url }}">{{ review.product_name }}</a>
				{% if show_date %}
				<small class="pull-right">
					<span class="glyphicon glyphicon-time"></span> {{ review.date }}
				</small>
				{% endif %}
			</h4>
			<p>{{ review.review }}</p>
		</div>
	</li>
	{% endfor %}
</ul>
{% else %}
<!--No reviews yet-->
<div class="alert alert-warning">
	{{ '_' | jtext: 'MOD_JKASSA_REVIEWS_NO' }}
</div>
{% endif %}