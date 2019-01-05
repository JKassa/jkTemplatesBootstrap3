<div id="jk_location" class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label class="col-sm-3 control-label">
    {{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
  </label>
  <div id="{{ field.name }}">
    <div class="col-sm-9 m-b-10" id="locations_countries_wrapper">
      <label for="locations_countries" style="display:none">{{ '_' | jtext: 'COM_JKASSA_COUNTRY' }}</label>
      <select name="locations_countries" id="locations_countries" class="form-control"{% if field.required %} required{% endif %}>
        <option value="">{{ '_' | jtext: 'COM_JKASSA_COUNTRY_SELECT' }}</option>
      </select>
    </div>
    <div class="col-sm-offset-3 col-sm-9 m-b-10" id="locations_regions_wrapper">
      <label for="locations_regions" style="display:none">{{ '_' | jtext: 'COM_JKASSA_STATE' }}</label>
      <select name="locations_regions" id="locations_regions" class="form-control"{% if field.required %} required{% endif %}>
        <option value="">{{ '_' | jtext: 'COM_JKASSA_STATE_SELECT' }}</option>
      </select>
    </div>
    <div class="col-sm-offset-3 col-sm-9" id="locations_cities_wrapper">
      <label for="locations_cities" style="display:none">{{ '_' | jtext: 'COM_JKASSA_CITY' }}</label>
      <select name="locations_cities" id="locations_cities" class="form-control"{% if field.required %} required{% endif %}>
        <option value="">{{ '_' | jtext: 'COM_JKASSA_CITY_SELECT' }}</option>
      </select>
    </div>
  </div>
</div>