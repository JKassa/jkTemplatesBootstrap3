{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'tooltip' | bootstrap3 }}
<div class="jkassa jk-user-module {{ class_sfx }}">
	{% if login_form %}
	<!--Login form-->
	{{ login_form }}
	{% endif %}

	{% if avatar %}
	<!--Avatar-->
	<style type="text/css">
		.modjku-avatar {
			position: relative;
			width: {{ size_avatar }}px;
			height: {{ size_avatar }}px;
			margin: 0 auto 10px;
		}
		.modjku-avatar-edit {
			position: absolute;
			display: none;
			top: 50%;
			left: 50%;
			-webkit-transform: translate(-50%,-50%);
			transform: translate(-50%,-50%);
			width: -moz-max-content;
			max-width: 100%;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
		}
		.modjku-avatar a:hover .modjku-avatar-edit {
			display: table;
		}
	</style>
	<div class="modjku-avatar">
		<a href="{{ edit_avatar }}" target="_blank" title="{{ '_' | jtext: 'JGLOBAL_EDIT' }}">
			<img src="{{ avatar }}" alt="{{ user_name }}" class="img-circle" />
			<span class="modjku-avatar-edit">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
			</span>
		</a>
	</div>
	{% endif %}

	<div class="text-center">
		<!--User name-->
		<p class="lead" style="margin-bottom: 10px">{{ user_name }}</p>
		{% if date_registration %}
		<!--Date registration-->
		<p class="muted">{{ date_registration }}</p>
		{% endif %}
	</div>

	{% if edit_url or logout_url %}
	<div class="text-center" style="margin-bottom: 10px">
		<div class="btn-group" role="group">
			{% if edit_url %}
			<!--Edit profile-->
			<a class="btn btn-default" href="{{ edit_url }}" target="_top" title="{{ '_' | jtext: 'MOD_JKASSA_USER_EDIT_PROFILE' }}">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				{{ '_' | jtext: 'JOPTIONS' }}
			</a>
			{% endif %}
			{% if logout_url %}
			<!--Log out-->
			<a class="btn btn-default" href="{{ logout_url }}" title="{{ '_' | jtext: 'JLOGOUT' }}">
				<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
				{% if edit_url == null %}{{ '_' | jtext: 'JLOGOUT' }}{% endif %}
			</a>
			{% endif %}
		</div>
	</div>
	{% endif %}

	{% if add_links %}
	<!--Additional links-->
	<div class="list-group">
		{% for link in add_links %}
		<a href="{{ link.url }}" class="list-group-item">
			{{ link.text }}
		</a>
		{% endfor %}
	</div>
	{% endif %}
</div>