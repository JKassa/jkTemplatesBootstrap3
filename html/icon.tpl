{% case icon %}
	{% when 'print' %}
		<span class="glyphicon glyphicon-print"></span>
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
	{% when 'print_screen' %}
		<span class="glyphicon glyphicon-print"></span>
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
    {% when 'email' %}
		<span class="glyphicon glyphicon-send"></span>
        {{ '_' | jtext: 'JGLOBAL_EMAIL' }}
	{% when 'lock' %}
		<span class="glyphicon glyphicon-lock"></span>
        {{ '_' | jtext: 'JLIB_HTML_CHECKED_OUT' }}
    {% when 'close' %}
		<span class="glyphicon glyphicon-eye-close"></span>
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'edit' %}
		<span class="glyphicon glyphicon-pencil"></span>
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'create' %}
		<span class="glyphicon glyphicon-plus"></span>
        {{ '_' | jtext: 'JNEW' }}
	{% when 'help' %}
		<span class="glyphicon glyphicon-info-sign hasTooltip" title="{{ tooltip }}"></span>
	{% when 'star' %}
		<span class="glyphicon glyphicon-star" style="color: #F2CD00"></span>
	{% when 'star-empty' %}
		<span class="glyphicon glyphicon-star-empty" style="color: #CCCCCC"></span>
	{% when 'big-star' %}
		<span class="glyphicon glyphicon-star" style="color: #F2CD00; font-size: 24px"></span>
	{% when 'big-star-empty' %}
		<span class="glyphicon glyphicon-star-empty" style="color: #CCCCCC; font-size: 24px"></span>
	{% when 'status_success' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_success.png{% endcapture %}
		{{ url }}
	{% when 'status_new' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_new.png{% endcapture %}
		{{ url }}
	{% when 'status_process' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_process.png{% endcapture %}
		{{ url }}
	{% when 'status_fail' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_fail.png{% endcapture %}
		{{ url }}
{% endcase %}