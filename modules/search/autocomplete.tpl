<a href="{{ url }}" class="media" style="display: block">
  <!--Image-->
  <span class="media-left" style="min-width: 60px">
    <img src="{{ image }}" class="media-object" alt="{{ alias }}" style="width: auto; height: 60px; margin: 0 auto">
  </span>
  <span class="media-body">
    <!--Name-->
    <strong class="media-heading" style="display: block; font-size: 14px">
      {{ name }}
    </strong>
    <!--Price-->
    <span>
      {% if old_cost %}
      <!--old cost-->
      <del class="text-muted">{{ old_cost | costDisplay }}{{ currency.symbol }}</del>
      {% endif %}
      <!--cost-->
      <strong>{{ cost | costDisplay }}</strong>{{ currency.symbol }}
    </span>
    <br>
    <small class="text-muted">{{ sku }}</small>
  </span>
</a>