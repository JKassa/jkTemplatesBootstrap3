<!--Header-->
<div class="page-header">
  {% if heading %}
  <h1>{{ heading }}</h1>
  {% else %}
  <h2>{{ title }}</h2>
  {% endif %}
</div>

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<form action="{{ form_action }}" name="searchForm" id="searchForm" method="get">
  <div class="well">
    <!--Search field-->
    <div class="form-group">
      <div class="input-group">
        <input type="text" name="searchword" maxlength="{{ maxlength }}" value="{{ origkeyword }}" class="form-control" />
        <span class="input-group-btn">
          <button type="submit" class="btn btn-default">
            <span class="glyphicon glyphicon-search"></span>
            {{ '_' | jtext: 'JGLOBAL_LOOKING_FOR' }}
          </button>
        </span>
      </div>
    </div>
  
    <!--Filter search-->
    <div class="form-group">
      <label class="radio-inline" id="searchphraseall-lbl" for="searchphraseall">
        <input type="radio" value="all" id="searchphraseall" name="searchphrase"{% if searchphrase == 'all' %} checked="checked"{% endif %}>
        {{ '_' | jtext: 'COM_JKASSA_ALL_WORDS' }}
      </label>
      <label class="radio-inline" id="searchphraseany-lbl" for="searchphraseany">
        <input type="radio" value="any" id="searchphraseany" name="searchphrase"{% if searchphrase == 'any' %} checked="checked"{% endif %}>
        {{ '_' | jtext: 'COM_JKASSA_ANY_WORDS' }}
      </label>
      <label class="radio-inline" id="searchphraseexact-lbl" for="searchphraseexact">
        <input type="radio" value="exact" id="searchphraseexact" name="searchphrase"{% if searchphrase == 'exact' %} checked="checked"{% endif %}>
        {{ '_' | jtext: 'COM_JKASSA_EXACT_PHRASE' }}
      </label>
    </div>
    
    {% if searchareas %}
    <div class="form-group">
      {% for areas in searchareas %}
      <label for="area-{{ areas.value }}" class="checkbox-inline">
        <input type="checkbox" name="areas[]" value="{{ areas.value }}" id="area-{{ areas.value }}"{% if areas.checked %} checked="checked"{% endif %} />
        {{ areas.text }}
      </label>
      {% endfor %}
    </div>
    {% endif %}
  </div>
  
  {% if total %}
  <!--Total poducts-->
  <span class="help-block">
    {{ 'plural' | jtext: 'COM_JKASSA_SEARCH_KEYWORD_N_RESULTS', total }}
  </span>
  {% endif %}
  
  <input type="hidden" name="view" value="search" />
  <input type="hidden" name="option" value="com_jkassa" />
</form>

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}