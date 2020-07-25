--Retrieve all the customers names and addresses who lives in United States

select name,
       address
from customers
where country = 'United States' --Retrieve all the customers ordered by ascending name

    select *
    from customers
order by name --Retrieve all the products which cost more than 100

select *
from products
where unit_price > 100 --Retrieve all the products whose name contains the word socks

    select *
    from products where product_name like ('%socks%')--Retrieve the 5 most expensive products

    select *
    from products
order by unit_price desc
limit 5;

--Retrieve all the products with their corresponding suppliers. The result should only
--contain the columns product_name, unit_price and supplier_name

select product_name,
       unit_price,
       supplier_name
from products
join suppliers on products.supplier_id = suppliers.id --Retrieve all the products sold by suppliers based in the United Kingdom. The result should only
--contain the columns product_name and supplier_name

select product_name,
       supplier_name
from products
join suppliers on products.supplier_id = suppliers.id
where country = 'United Kingdom' --Retrieve all orders from customer ID 1

    select *
    from orders where customer_id = 1 --Retrieve all orders from customer named Hope Crosby

    select *
    from orders
    join customers on orders.customer_id = customers.id where name = 'Hope Crosby' --Retrieve all the products in the order ORD006. The result should only contain the columns product_name, unit_price and quantity

    select product_name,
           unit_price,
           quantity
    from products
    join order_items on products.id = order_items.product_id
    join orders on order_items.order_id = orders.id where order_reference = 'ORD006' --Retrieve all the products with their supplier for all orders of all customers.
--The result should only contain the columns name (from customer), order_reference
-- order_date, product_name, supplier_name and quantity

    select name,
           order_reference,
           order_date,
           product_name,
           supplier_name,
           quantity
    from customers
    join orders on customers.id = orders.customer_id
    join order_items on orders.id = order_items.order_id
    join products on order_items.product_id = products.id
    join suppliers on products.supplier_id = suppliers.id --Retrieve the names of all customers who bought a product from a supplier from China

    select name
    from customers
    join orders on customers.id = orders.customer_id
    join order_items on orders.id = order_items.order_id
    join products on order_items.product_id = products.id
    join suppliers on products.supplier_id = suppliers.id where suppliers.country = 'China'