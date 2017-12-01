{% assign col_md = tpl_params.p_in_row | default_value: 4 %}
{% assign prod_height = tpl_params.prod_height | default_value: 282 %}
{% capture prod_height_css %}.thumbnails > li .over-wraper, .thumbnails > li .over-wraper-long { height: {{ prod_height }}px } .thumbnails > li:hover .over-wraper-long { min-height: {{ prod_height }}px }{% endcapture %}
{{ prod_height_css | addStyleDeclaration }}
{% assign img_height = tpl_params.img_height | default_value: 150 %}
{% assign show_stock = tpl_params.prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.prod_quantity | default_value: 1 %}
{% include 'html/products/block' %}