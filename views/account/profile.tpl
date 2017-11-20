<div class="profile">
  <!--Profile-->
  <fieldset id="users-profile-core">
    <legend>
      {{ '_' | jtext: 'COM_JKASSA_ACCOUNT_CONTACT' }}
    </legend>
    <dl class="dl-horizontal">
      <dt>{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}:</dt>
      <dd>{{ user_name }}</dd>
      <dt>{{ '_' | jtext: 'COM_USERS_REMIND_EMAIL_LABEL' }}:</dt>
      <dd>{{ user_email }}</dd>
      <dt>{{ '_' | jtext: 'COM_USERS_PROFILE_USERNAME_LABEL' }}:</dt>
      <dd>{{ user_username }}</dd>
      {% if profile.phone %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_PHONE_LABEL' }}</dt>
      <dd>{{ profile.phone }}</dd>
      {% endif %}
      {% if profile.country %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_COUNTRY_LABEL' }}</dt>
      <dd>{{ profile.country }}</dd>
      {% endif %}
      {% if profile.region %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_REGION_LABEL' }}</dt>
      <dd>{{ profile.region }}</dd>
      {% endif %}
      {% if profile.city %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_CITY_LABEL' }}</dt>
      <dd>{{ profile.city }}</dd>
      {% endif %}
      {% if profile.address1 %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_ADDRESS1_LABEL' }}</dt>
      <dd>{{ profile.address1 }}</dd>
      {% endif %}
      {% if profile.address2 %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_ADDRESS2_LABEL' }}</dt>
      <dd>{{ profile.address2 }}</dd>
      {% endif %}
      {% if profile.postal_code %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_POSTAL_CODE_LABEL' }}</dt>
      <dd>{{ profile.postal_code }}</dd>
      {% endif %}
      {% if profile.website %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_WEB_SITE_LABEL' }}</dt>
      <dd>{{ profile.website }}</dd>
      {% endif %}
      {% if profile.dob %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_DOB_LABEL' }}</dt>
      <dd>{{ profile.dob }}</dd>
      {% endif %}
      {% if profile.aboutme %}
      <dt>{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_ABOUT_ME_LABEL' }}</dt>
      <dd>{{ profile.aboutme }}</dd>
      {% endif %}
      <dt>{{ '_' | jtext: 'COM_USERS_PROFILE_REGISTERED_DATE_LABEL' }}:</dt>
      <dd>{{ 'date' | jhtml: registerDate }}</dd>
      <dt>{{ '_' | jtext: 'COM_USERS_PROFILE_LAST_VISITED_DATE_LABEL' }}:</dt>
      {% if lastvisitDate != '0000-00-00 00:00:00' %}
      <dd>{{ 'date' | jhtml: lastvisitDate }}</dd>
      {% else %}
      <dd>{{ '_' | jtext: 'COM_USERS_PROFILE_NEVER_VISITED' }}</dd>
      {% endif %}
    </dl>
  </fieldset>
  
  <!--Edit profile | Log out-->
  <ul class="btn-toolbar">
    <li class="btn-group">
      <a class="btn btn-default" href="{{ edit_url }}" target="_top">
        <span class="glyphicon glyphicon-user"></span>
        {{ '_' | jtext: 'COM_USERS_EDIT_PROFILE' }}
      </a>
      <a class="btn btn-default" href="{{ logout_url }}">
        <span class="glyphicon glyphicon-off"></span>
        {{ '_' | jtext: 'JLOGOUT' }}
      </a>
    </li>
  </ul>
</div>