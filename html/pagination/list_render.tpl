<nav aria-label="Page navigation">
  <div class="pull-right m-t-20 text-muted">
    {{ pagesCounter }}
  </div>
  <ul class="pagination">
    {{ start.data }}
    {{ previous.data }}
    {% for page in pages %}
      {{ page.data }}
    {% endfor %}
    {{ next.data }}
    {{ end.data }}
  </ul>
</nav>