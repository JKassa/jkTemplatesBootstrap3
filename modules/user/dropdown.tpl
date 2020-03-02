{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-user-module dropdown {{ class_sfx }}">
	<a href="#" style="display: block; position: relative; width: 30px; height: 30px; margin-right: -5px;" data-toggle="dropdown" id="jk-user-module-dropdown" aria-haspopup="true" aria-expanded="true">
		<span style="display: block; margin-top: 5px">
			<img src="{{ icon_image }}" alt="user" />
		</span>
	</a>
	<ul class="dropdown-menu" aria-labelledby="jk-user-module-dropdown">
		{% if add_links %}
		<!--Additional links-->
		{% for link in add_links %}
		<li>
			<a href="{{ link.url }}" tabindex="-1">
				{{ link.text }}
			</a>
		</li>
		{% endfor %}
		{% endif %}
		{% if login_url or logout_url %}
		<li role="separator" class="divider"></li>
		{% endif %}
		{% if login_url %}
		<!--Login url-->
		<li>
			<a href="{{ login_url }}" tabindex="-1">
				{{ '_' | jtext: 'JACTION_LOGIN_SITE' }}
			</a>
		</li>
		{% endif %}
		{% if logout_url %}
		<!--Logout url-->
		<li>
			<a href="{{ logout_url }}" tabindex="-1">
				{{ '_' | jtext: 'JLOGOUT' }}
			</a>
		</li>
		{% endif %}
	</ul>
</div>