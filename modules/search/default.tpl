{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

<form action="{{ form_action }}" name="modSearchForm" id="modSearchForm" method="get" style="width: {{ width_form }}px; margin: 10px auto">
  <div class="input-group">
    <input type="text" name="searchword" maxlength="{{ maxlength }}" class="form-control" placeholder="{{ '_' | jtext: 'MOD_JKASSA_SEARCH_PLACEHOLDER' }}">
    <span class="input-group-btn">
      <button type="submit" class="btn btn-default">
        <span class="glyphicon glyphicon-search"></span>
        {{ '_' | jtext: 'MOD_JKASSA_SEARCH_SEARCHBUTTON' }}
      </button>
    </span>
  </div>
  <div id="jk-search-autocomplete"></div>
  <input type="hidden" name="view" value="search" />
  <input type="hidden" name="option" value="com_jkassa" />
</form>