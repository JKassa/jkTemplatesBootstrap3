<title>{{ shop_name }} - Новый отзыв</title>
Здравствуйте, {{ admin_name }}.

В магазине "{{ shop_name }}" был добавлен новый отзыв для продукта "{{ product_name }}".

Пользователь: {{ user_name }}
Email пользователя: {{ user_email }}
IP пользователя: {{ user_ip }}

Отзыв:
{{ review }}

Просмотреть в магазине: {{ product_url }}

-- Модерация --
{% if moderation %}Опубликовать отзыв: {{ review_publish }}
Удалить отзыв: {{ review_delete }}
{% else %}Удалить отзыв: {{ review_delete }}{% endif %}

--

* Это уведомление создано автоматически системой и отвечать на него не нужно.