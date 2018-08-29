<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>{{ shop_name }} - Информация о заказе</title>
<style>
@media only screen and (max-width: 300px) {
	.body {
		width: 218px !important;
		margin: auto !important;
	}
	.table {
		width: 195px !important;
		margin: auto !important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto !important;
		display: block !important;
	}
	span.title {
		font-size: 20px !important;
		line-height: 23px !important
	}
	span.subtitle {
		font-size: 14px !important;
		line-height: 18px !important;
		padding-top: 10px !important;
		display: block !important;
	}
	td.box p {
		font-size: 12px !important;
		font-weight: bold !important;
	}
	.table-recap table, .table-recap thead, .table-recap tbody, .table-recap th, .table-recap td, .table-recap tr { display: block !important; }
	.table-recap { width: 200px!important; }
	.table-recap tr td, .conf_body td { text-align: center !important; }
	.address {
		display: block !important;
		margin-bottom: 10px !important;
	}
	.space_address { display: none !important; }
}
@media only screen and (min-width: 301px) and (max-width: 500px) {
	.body {
		width: 308px!important;
		margin: auto!important;
	}
	.table {
		width: 285px!important;
		margin: auto!important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto!important;
		display: block!important;
	}
	.table-recap table, .table-recap thead, .table-recap tbody, .table-recap th, .table-recap td, .table-recap tr { display: block !important; }
	.table-recap { width: 295px !important; }
	.table-recap tr td, .conf_body td { text-align: center !important; }
}
@media only screen and (min-width: 501px) and (max-width: 768px) {
	.body {
		width: 478px!important;
		margin: auto!important;
	}
	.table {
		width: 450px!important;
		margin: auto!important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto!important;
		display: block!important;
	}
}
@media only screen and (max-device-width: 480px) {
	.body {
		width: 308px!important;
		margin: auto!important;
	}
	.table {
		width: 285px;
		margin: auto!important;
	}
	.logo, .titleblock, .linkbelow, .box, .footer, .space_footer {
		width: auto!important;
		display: block!important;
	}
	.table-recap { width: 295px!important; }
	.table-recap tr td, .conf_body td { text-align: center!important; }
	.address {
		display: block !important;
		margin-bottom: 10px !important;
	}
	.space_address { display: none !important; }
}
</style>
</head>

<body>
<div class="body" style="-webkit-text-size-adjust:none; background-color:#fff; width:650px; font-family: Open-sans, sans-serif; color:#555454; font-size: 13px;line-height: 18px; margin: auto">
  <table class="table table-mail" style="width: 100%; margin-top: 10px; -moz-box-shadow: 0 0 5px #afafaf; -webkit-box-shadow: 0 0 5px #afafaf; -o-box-shadow: 0 0 5px #afafaf; box-shadow: 0 0 5px #afafaf; filter: progid:DXImageTransform.Microsoft.Shadow(color=#afafaf,Direction=134,Strength=5)">
    <tbody>
      <tr>
        <td class="space" style="width: 20px; padding: 7px 0">&nbsp;</td>
        <td style="padding: 7px 0" align="center">
          <table class="table" style="width: 100%" bgcolor="#ffffff">
            <tbody>
              <tr>
                <td class="logo" style="border-bottom: 4px solid #5e6981; padding: 7px 0" align="center">
                  <a href="{{ shop_url }}" style="color: #5e6981" title="{{ shop_name }}">
                    <img src="{{ shop_url }}media/gswork/images/logo-jkassa.png" alt="{{ shop_name }}" />
                  </a>
                </td>
              </tr>
              <tr>
                <td class="titleblock" style="border-bottom: 1px solid #e2e7eb; padding: 7px 0" align="center">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    <span class="title" style="font-weight: 500; font-size: 28px; text-transform: uppercase; line-height: 33px">
                      Здравствуйте, {{ user_name }}
                    </span>
                    <br />
                    <span class="subtitle" style="font-weight: 500; font-size: 16px; text-transform: uppercase; line-height: 25px">
                      Благодарим за покупки в магазине {{ shop_name }}!
                    </span>
                  </font>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important">&nbsp;</td>
              </tr>
              <tr>
                <td class="box" style="border: 1px solid #D6D4D4; background-color: #f8f8f8; padding: 7px 0">
                  <table class="table" style="width: 100%">
                    <tbody>
                      <tr>
                        <td style="padding: 7px 0" width="10"></td>
                        <td style="padding: 7px 0">
                          <font size="2" face="Open-sans, sans-serif" color="#555454">
                            <p style="border-bottom: 1px solid #D6D4D4; margin: 3px 0 7px; text-transform: uppercase; font-weight: 500; font-size: 18px; padding-bottom: 10px" data-html-only="1">
                              {{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}
                            </p>
                            <span style="color: #777; font-family: Open-sans,sans-serif; font-size: small">
                              {% include 'html/order/payment' %}
                            </span>
                          </font>
                        </td>
                        <td style="padding: 7px 0" width="10"></td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              <tr>
                <td style="padding: 7px 0">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    <table class="table table-recap" style="width: 100%; border-collapse: collapse" bgcolor="#ffffff">
                      <!-- Title -->
                      <tr>
                        <th style="border: 1px solid #D6D4D4; background-color: #fbfbfb; color: #333; font-family: Arial; font-size: 13px; padding: 10px" bgcolor="#f8f8f8">ID | Код</th>
                        <th style="border: 1px solid #D6D4D4; background-color: #fbfbfb; color: #333; font-family: Arial; font-size: 13px; padding: 10px" bgcolor="#f8f8f8">Продукт</th>
                        <th style="border: 1px solid #D6D4D4; background-color: #fbfbfb; color: #333; font-family: Arial; font-size: 13px; padding: 10px" bgcolor="#f8f8f8" width="17%">Цена</th>
                        <th style="border: 1px solid #D6D4D4; background-color: #fbfbfb; color: #333; font-family: Arial; font-size: 13px; padding: 10px" bgcolor="#f8f8f8">Количество</th>
                        <th style="border: 1px solid #D6D4D4; background-color: #fbfbfb; color: #333; font-family: Arial; font-size: 13px; padding: 10px" bgcolor="#f8f8f8" width="17%">Сумма</th>
                      </tr>
                      {% for product in products %}
                      <tr>
                        <td style="border: 1px solid #D6D4D4; color: #777; padding: 5px">
                          <span style="color: #777; font-family: Open-sans,sans-serif; font-size: small">
                            {{ product.id }}<br>
                            {{ product.sku }}
                          </span>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #777; padding: 5px">
                          <span style="color: #777; font-family: Open-sans,sans-serif; font-size: small">
							<a href="{{ product.url }}" title="{{ '_' | jtext: 'COM_JKASSA_FILE_DOWNLOAD' }}" style="color: #5e6981">
							  {{ product.name }}
							</a>
                            {% if product.present %}
                              + {{ product.present.name }}
                            {% endif %}
                            {% if product.variants %}
                              <br>
                              {% for variant in product.variants %}
                                {{ variant.name }}:
                                {% if variant.type == 'color' or variant.type == 'texture' %}
                                  {{ variant.title }}
                                {% else %}
                                  {{ variant.value }}
                                {% endif %}
                                <br>
                              {% endfor %}
                            {% endif %}
							{% if product.attachment %}
							  <br>
							  {{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:
							  {% for file in product.attachment %}
							  <a href="{{ file.url }}" title="{{ '_' | jtext: 'COM_JKASSA_FILE_DOWNLOAD' }}" style="color: #5e6981">
								{{ file.name }}
							  </a><br>
							  {% endfor %}
							{% endif %}
                          </span>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #777; padding: 5px">
                          <span style="color: #777; font-family: Open-sans,sans-serif; font-size: small">
                            {% if product.old_cost %}
                            <del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del><br>
                            {% endif %}
                            {{ product.cost | costDisplay }}{{ currency.symbol }}
                          </span>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #777; padding: 5px">
                          <span style="color: #777; font-family: Open-sans,sans-serif; font-size: small">
                            {{ product.quantity }}
                          </span>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #777; padding: 5px">
                          <span style="color: #777; font-family: Open-sans,sans-serif; font-size: small">
                            {{ product.price | costDisplay }}{{ currency.symbol }}
                          </span>
                        </td>
                      </tr>
                      {% endfor %}
                      <tr>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table class="table" style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    <strong>Продукты</strong>
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" align="right" bgcolor="#f8f8f8">
                          <table style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    {{ pm_total | costDisplay }}{{ currency.symbol }}
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                      {% if discounts %}
                      {% for discount in discounts %}
                      <tr>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table class="table" style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    <strong>{{ discount.name }}</strong>
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    {{ discount.difference | costDisplay }}{{ currency.symbol }}
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                      {% endfor %}
                      {% endif %}
                      {% if delivery %}
                      <tr>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table class="table" style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    <strong>Доставка</strong>
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    {{ delivery.cost | costDisplay }}{{ currency.symbol }}
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                      {% endif %}
                      <tr>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table class="table" style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    <strong>Итого к оплате</strong>
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                        <td style="border: 1px solid #D6D4D4; color: #333; padding: 7px 0" colspan="4" bgcolor="#f8f8f8">
                          <table style="width: 100%; border-collapse: collapse">
                            <tbody>
                              <tr>
                                <td style="color: #333; padding: 0" width="10"></td>
                                <td style="color: #333; padding: 0" align="right">
                                  <font size="4" face="Open-sans, sans-serif" color="#555454">
                                    {{ pm_in_total | costDisplay }}{{ currency.symbol }}
                                  </font>
                                </td>
                                <td style="color: #333; padding: 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </font>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important"></td>
              </tr>
              <tr>
                <td style="padding: 7px 0">
                  <table class="table" style="width: 100%">
                    <tbody>
                      <tr>
                        {% if delivery %}
                        <!--Delivery-->
                        <td style="border: 1px solid #D6D4D4; background-color: #f8f8f8; padding: 7px 0; vertical-align: top" width="310">
                          <table class="table" style="width: 100%">
                            <tbody>
                              <tr>
                                <td style="padding: 7px 0" width="10"></td>
                                <td valign="top" style="padding: 7px 0">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    <p style="border-bottom: 1px solid #D6D4D4; margin: 3px 0 7px; text-transform: uppercase; font-weight: 500; font-size: 18px; padding-bottom: 10px" data-html-only="1">
                                      {{ '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' }}
                                    </p>
                                    <span style="color: #777" data-html-only="1">
                                      {% include 'html/order/delivery' %}
                                    </span>
                                  </font>
                                </td>
                                <td style="padding: 7px 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                        <td style="padding: 7px 0" width="20"></td>
                        {% endif %}
                        <td style="border: 1px solid #D6D4D4; background-color: #f8f8f8; padding: 7px 0; vertical-align: top" width="310">
                          <!--Buyer-->
                          <table class="table" style="width: 100%">
                            <tbody>
                              <tr>
                                <td style="padding: 7px 0" width="10"></td>
                                <td valign="top" style="padding: 7px 0">
                                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                                    <p style="border-bottom: 1px solid #D6D4D4; margin: 3px 0 7px; text-transform: uppercase; font-weight: 500; font-size: 18px; padding-bottom: 10px" data-html-only="1">
                                      {{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}
                                    </p>
                                    <span style="color: #777" data-html-only="1">
                                      {% include 'html/order/buyer' %}
                                    </span>
                                  </font>
                                </td>
                                <td style="padding: 7px 0" width="10"></td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important">&nbsp;</td>
              </tr>
              <tr>
                <td class="linkbelow" style="border-top: 1px solid #e2e7eb; padding: 7px 0">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    Вы можете просмотреть ваш заказ в разделе "История заказов" вашей учетной записи.
                  </font>
                </td>
              </tr>
              <tr>
                <td class="linkbelow" style="padding: 7px 0">
                  <font size="2" face="Open-sans, sans-serif" color="#555454">
                    Вы также можете перейти к <a href="{{ order_pending }}" style="color: #5e6981">странице заказа</a>, чтобы проверить его состояние.
                  </font>
                </td>
              </tr>
              <tr>
                <td class="space_footer" style="padding: 0 !important">&nbsp;</td>
              </tr>
              <tr>
                <td class="footer" style="border-top: 4px solid #5e6981; padding: 7px 0">
                  <a style="color: #5e6981" href="{{ shop_url }}">
                    {{ shop_name }}
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
        <td class="space" style="width: 20px; padding: 7px 0">&nbsp;</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>