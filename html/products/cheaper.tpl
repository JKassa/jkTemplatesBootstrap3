<div class="text-center jk-cheaper carousel slide" id="cheaperCarousel" data-ride="carousel">
  <!-- Carousel items -->
  <div class="carousel-inner" role="listbox">
    {% for together in cheaper %}
      {% for cheap in together.cheaper %}
      <ul class="row list-unstyled item {% if cheap.active %}active{% endif %}">
        <li class="col-xs-3">
          <!--Product Image-->
          <div>
            <img {{ together.image | img_exists: '50x70' }} style="max-height: 30%" alt="{{ together.alias }}" />
          </div>
          <!--Name product-->
          <h5>
            {{ together.name }}
          </h5>
          <!--Price product-->
          <div class="m-t-5">
            {% if together.old_cost %}
            <!--old cost-->
            <del class="text-muted">
              {{ together.old_cost | costDisplay }}{{ currency.symbol }}
            </del>
            {% endif %}
            <!--cost-->
            <span class="cost">
              <span>{{ together.cost | costDisplay }}</span>{{ currency.symbol }}
            </span>
          </div>
        </li>
        <li class="col-xs-1 plass">
          +
        </li>
        <li class="col-xs-3">
          <!--Product Image-->
          <div>
            <img {{ cheap.image | img_exists: '50x70' }} style="max-height: 30%" alt="{{ cheap.alias }}" />
          </div>
          <!--Name and URL product-->
          <h5>
            <a href="{{ cheap.url }}">
              {{ cheap.name }}
            </a>
          </h5>
          <!--SKU (code)-->
          <div class="text-muted small m-t-5">
            {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ cheap.sku }}
          </div>
          <!--Price product-->
          <div class="m-t-5">
            <!--old cost-->
            <del class="text-muted">
              {{ cheap.old_cost | costDisplay }}{{ currency.symbol }}
            </del>
            <!--cost-->
            <strong class="text-info">
              {{ cheap.cost | costDisplay }}{{ currency.symbol }}
            </strong>
          </div>
        </li>
        <li class="col-xs-1 equally">
          =
        </li>
        <li class="col-xs-4">
          <!--old price-->
          <del class="text-muted">
            {{ cheap.old_price | costDisplay }}{{ currency.symbol }}
          </del>
          <br>
          <!--new price-->
          <span class="lead text-info">
            {{ cheap.new_price | costDisplay }}{{ currency.symbol }}
          </span>
          <br>
          <!--discount-->
          <div class="discount">
            {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }} {{ cheap.discount | costDisplay }}{{ cheap.symbol }}
          </div>
          <!--Add to cart-->
          <div class="m-t-10">
            <a href="#" data-click="to-cart" data-id="{{ cheap.id }}" class="btn btn-info" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', cheap.name }}">
              <span class="glyphicon glyphicon-shopping-cart"></span>
              {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
            </a>
          </div>
        </li>
      </ul>
      {% endfor %}
    {% endfor %}
  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#cheaperCarousel" role="button" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#cheaperCarousel" role="button" data-slide="next">&rsaquo;</a>
</div>