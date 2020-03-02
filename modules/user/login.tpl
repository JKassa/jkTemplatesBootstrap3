<form action="{{ form_action }}" method="post">
	<!--User name-->
	<div class="form-group">
		<div class="input-group">
			<span class="input-group-addon">
				<span class="glyphicon glyphicon-user hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_USERNAME' }}"></span>
				<label for="modjku-username" class="sr-only">{{ '_' | jtext: 'JGLOBAL_USERNAME' }}</label>
			</span>
			<input id="modjku-username" type="text" name="username" class="form-control" tabindex="0" size="18" placeholder="{{ '_' | jtext: 'JGLOBAL_USERNAME' }}" />
		</div>
	</div>
	<!--Password-->
	<div class="form-group">
		<div class="input-group">
			<span class="input-group-addon">
				<span class="glyphicon glyphicon-lock hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}"></span>
				<label for="modjku-passwd" class="sr-only">{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}</label>
			</span>
			<input id="modjku-passwd" type="password" name="password" class="form-control" tabindex="0" size="18" placeholder="{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}" />
		</div>
	</div>
	{% if twoFactorMethods %}
	<!--Secret key-->
	<div class="form-group">
		<div class="input-group">
			<span class="input-group-addon">
				<span class="glyphicon glyphicon-star hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}"></span>
				<label for="modjku-secretkey" class="sr-only">{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}</label>
			</span>
			<input id="modjku-secretkey" autocomplete="off" type="text" name="secretkey" class="form-control" tabindex="0" size="18" placeholder="{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}" />
			<span class="input-group-addon">
				<span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_SECRETKEY_HELP' }}"></span>
			</span>
		</div>
	</div>
	{% endif %}
	{% if remember %}
	<!--Remember-->
	<div class="checkbox">
		<label>
			<input id="modjku-remember" type="checkbox" name="remember" class="inputbox" value="yes" />
			{{ '_' | jtext: 'JGLOBAL_REMEMBER_ME' }}
		</label>
	</div>
	{% endif %}
	<!--Submit-->
	<button type="submit" tabindex="0" name="Submit" class="btn btn-primary login-button">
		{{ '_' | jtext: 'JLOGIN' }}
	</button>
	<input type="hidden" name="option" value="com_users" />
	<input type="hidden" name="task" value="user.login" />
	<input type="hidden" name="return" value="{{ return }}" />
	{{ token }}
</form>