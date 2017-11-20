<div class="row">
  <div class="col-sm-12">
    <form action="{{ form_action }}" method="post" class="form-horizontal">
      <p class="help-block">
        {{ userName }}
      </p>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-6">
          <button type="submit" class="btn btn-primary"{% if target %} formtarget="_top"{% endif %}>
            <span class="glyphicon glyphicon-off"></span>
            {{ '_' | jtext: 'JLOGOUT' }}
          </button>
        </div>
      </div>
      <input type="hidden" name="return" value="{{ return }}" />
      {{ token }}
    </form>
  </div>
</div>