{% include 'html/products/default' %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ Itemid | jkcomments: title }}