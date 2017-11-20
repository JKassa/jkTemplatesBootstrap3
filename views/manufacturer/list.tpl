{% assign img_height = tpl_params.img_height | default_value: 150 %}
{% assign show_stock = tpl_params.prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.prod_quantity | default_value: 1 %}
{% include 'html/products/list' %}