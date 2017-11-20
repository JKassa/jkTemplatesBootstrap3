<title>{{ shop_name }} - Новый заказ</title>
Здравствуйте, {{ admin_name }}.

В магазине "{{ shop_name }}" был создан новый заказ.

{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}
{{ '_' | jtext: 'COM_JKASSA_PAYMENT_METHOD' }}: {{ syst_name }}
{{ '_' | jtext: 'COM_JKASSA_SHOP_ID' }}: {{ syst_id }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_NUMBER' }}: {{ pm_number }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_ID' }}: {{ order_id }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_TOTALL' }}: {{ pm_in_total | costDisplay }}{{ currency.symbol }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_CREATED' }}: {{ 'date' | jhtml: created, 'd F Y H:i' }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_DESC' }}: {{ pm_desc }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_STATE' }}: {{ order_status }}

{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}
{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}: {{ user_name }}
{{ '_' | jtext: 'JGLOBAL_EMAIL' }}: {{ user_email }}

Пожалуйста, проверьте раздел заказов магазина после входа в административную часть сайта.
Вы также можете перейти по ссылке, отправленной покупателю, для проверки статуса заказа:
{{ order_pending }}

--
* Это уведомление создано автоматически системой и отвечать на него не нужно.