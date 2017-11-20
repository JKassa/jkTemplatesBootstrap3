{% assign col_xs = tpl_params.f_col_xs | default_value: 4 %}
{% assign col_sm = col_xs | times: 2 %}
{% assign prod_height = tpl_params.f_prod_height | default_value: 282 %}
{% capture prod_height_css %}.thumbnails > li .over-wraper, .thumbnails > li .over-wraper-long { height: {{ prod_height }}px } .thumbnails > li:hover .over-wraper-long { min-height: {{ prod_height }}px }{% endcapture %}
{{ prod_height_css | addStyleDeclaration }}
{% assign img_height = tpl_params.f_img_height | default_value: 150 %}
{% assign show_stock = tpl_params.f_prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.f_prod_quantity | default_value: 1 %}
{% include 'html/products/block' %}