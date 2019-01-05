{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if pre_text %}
<p>{{ pre_text }}</p>
{% endif %}

{% case layout %}
	{% when 'list' %}
<ul class="list-unstyled {{ class_sfx }}">
  {% include 'modules/currencies/list' %}
</ul> 
    {% when 'dropdown' %}
<form name="currency" method="post" action="{{ action }}" class="{{ class_sfx }}">
  <select name="cur_id" class="inputbox" onchange="this.form.submit()">
    {% include 'modules/currencies/dropdown' %}
  </select>
  <input type="hidden" name="option" value="com_jkassa" />
  <input type="hidden" name="task" value="user.switchingCurrency" />
  <input type="hidden" name="cur_return" value="{{ return }}" />
</form>
    {% when 'bootstrap' %}
<div class="btn-group {{ class_sfx }}">
  {% include 'modules/currencies/bootstrap' %}
</div> 
{% endcase %}

{% if post_text %}
<p>{{ post_text }}</p>
{% endif %}