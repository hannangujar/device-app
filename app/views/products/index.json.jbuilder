json.array! @products, partial: "products/product", as: :product
function replaceProducts (innerHTML) {
  const products = document.getElementById('products');
  products.innerHTML = innerHTML;
}
replaceProducts("<%= j render 'product', products: @products %>");