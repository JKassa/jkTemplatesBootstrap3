<title>{{ shop_name }} - Ответ на отзыв</title>
Здравствуйте, {{ admin_name }}.

В магазине "{{ shop_name }}" был добавлен новый ответ на отзыв для продукта "{{ product_name }}".

Пользователь: {{ user_name }}
Email пользователя: {{ user_email }}
IP пользователя: {{ user_ip }}

Ответ:
{{ review }}

{% if moderation %}
Опубликовать отзыв: {{ review_publish }}
Удалить отзыв: {{ review_delete }}
{% else %}
Просмотреть в магазине: {{ product_url }}
{% endif %}

--
* Это уведомление создано автоматически системой и отвечать на него не нужно.