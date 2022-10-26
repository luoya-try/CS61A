.read data.sql


CREATE TABLE average_prices AS
  SELECT products.category, AVG(products.MSRP) AS average_price
  FROM products
  GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT inventory.store, inventory.item, MIN(inventory.price)
  FROM inventory
  GROUP BY inventory.item;

CREATE TABLE help_shopping_list AS
  SELECT lowest_prices.item, lowest_prices.store, MIN(MSRP / products.rating)
  FROM lowest_prices, products
  WHERE products.name = lowest_prices.item
  GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT help_shopping_list.item, help_shopping_list.store 
  FROM help_shopping_list;

  


CREATE TABLE total_bandwidth AS
  SELECT SUM(stores.Mbs)
  FROM shopping_list, stores
  WHERE shopping_list.store = stores.store;
