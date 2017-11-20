<div class="row">
  <div class="col-sm-12">
    <form action="{{ form_action }}" method="post" class="form-validate form-horizontal">
      <p class="help-block">
        <span class="text-danger">*</span> {{ '_' | jtext: 'COM_JKASSA_REQUIRED_FIELD' }}
      </p>
      <div class="form-group">
        <label for="jkUsername" class="col-sm-3 control-label required">
          {{ '_' | jtext: 'JGLOBAL_USERNAME' }} <span class="text-danger">*</span>
        </label>
        <div class="col-sm-9">
          <input name="username" id="jkUsername" class="form-control validate-username required" type="text" value="" maxlength="30" required="required" />
        </div>
      </div>
      <div class="form-group">
        <label for="jkPassword" class="col-sm-3 control-label required">
          {{ '_' | jtext: 'JGLOBAL_PASSWORD' }} <span class="text-danger">*</span>
        </label>
        <div class="col-sm-9">
          <input name="password" id="jkPassword" class="form-control validate-password required" type="password" value="" maxlength="30" required="required" />
        </div>
      </div>
      {% if twoFactorMethods %}
      <div class="form-group">
        <label for="jkSecretkey" class="col-sm-3 control-label">
          {{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}
        </label>
        <div class="col-sm-9">
          <input name="secretkey" id="jkSecretkey" type="text" class="form-control" autocomplete="off" title="{{langtext.secretkey}}" tabindex="0" />
        </div>
      </div>
      {% endif %}
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <div class="checkbox">
            <label>
              <input id="jkRemember" type="checkbox" name="remember" value="yes" class="inputbox" />
              {{ '_' | jtext: 'JGLOBAL_REMEMBER_ME' }}
            </label>
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <button type="submit" class="btn btn-primary" tabindex="0" name="Submit"{% if target %} formtarget="_top"{% endif %}>
            {{ '_' | jtext: 'JLOGIN' }}
          </button>
        </div>
      </div>
    
    <input type="hidden" name="option" value="com_users" />
    <input type="hidden" name="task" value="user.login" />
    <input type="hidden" name="return" value="{{ return }}" />
    {{ token }}
  </form>
  </div>

  <div class="col-sm-12">
    <ul class="list-group">
      {% if allowUserRegistration %}
      <li class="list-group-item">
        <a href="{{register_url}}" {% if target %} target="_top" {% endif %}>
          {{ '_' | jtext: 'JREGISTER' }}
        </a>
      </li>
      {% endif %}
      <li class="list-group-item">
        <a href="{{remind_url}}" {% if target %} target="_top" {% endif %}>
          {{ '_' | jtext: 'COM_JKASSA_ORDER_LOGIN_REMIND' }}
        </a>
      </li>
      <li class="list-group-item">
        <a href="{{reset_url}}" {% if target %} target="_top" {% endif %}>
          {{ '_' | jtext: 'COM_JKASSA_ORDER_LOGIN_RESET' }}
        </a>
      </li>
    </ul>
  </div>
</div>