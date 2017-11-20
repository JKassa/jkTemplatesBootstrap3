{% assign img_height = tpl_params.f_img_height | default_value: 150 %}
{% assign show_stock = tpl_params.f_prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.f_prod_quantity | default_value: 1 %}
{% include 'html/products/list' %}