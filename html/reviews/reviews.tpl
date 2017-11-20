{% if reviews_access %}
<div class="alert alert-block">
  {{ '_' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_VIEW' }}
</div>
{% else %}

<!--Reviews-->
<div id="jkReviews">
  {% if reviews %}
    {{ reviews }}
  {% else %}
    <div class="alert alert-info alert-block" id="noPosts">
      {{ '_' | jtext: 'COM_JKASSA_REVIEWS_NO' }}
    </div>
  {% endif %}
</div>

 {% if reviews_more %}
  <div class="text-center m-t-30">
	<a href="#" class="btn btn-lg btn-link" data-click="more-reviews" data-id="{{ id }}" data-limitstart="0">
	  <span class="glyphicon glyphicon-repeat"></span>
	  {{ '_' | jtext: 'COM_JKASSA_MORE' }}
	</a>
  </div>
{% endif %}

<!--Form-->
{% if reviews_access_form %}
<div class="alert alert-block">
  {{ '_' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_POST' }}
</div>
{% else %}
<div class="well m-t-30">
  {% include 'html/reviews/form' %}
</div>
{% endif %}
{% endif %}