select dell_store.customers.customerid, dell_store.customers.firstname,
       dell_store.customers.lastname, dell_store.orders.orderid,
       dell_store.orderlines.quantity, dell_store.products.title,
       dell_store.products.price, dell_store.categories.categoryname
    from dell_store.customers 
left join dell_store.orders 
    on dell_store.customers.customerid = dell_store.orders.customerid
left join dell_store.orderlines
    on dell_store.orders.orderid = dell_store.orderlines.orderid
left join dell_store.products
    on dell_store.orderlines.prod_id = dell_store.products.prod_id
left join dell_store.categories
    on dell_store.products.category = dell_store.categories.category