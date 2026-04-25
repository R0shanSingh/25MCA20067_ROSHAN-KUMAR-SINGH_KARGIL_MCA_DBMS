create or replace function update_stock()
returns Trigger AS 
$$ 
Begin
	update Tbl_Products
	Set stock_qty = stock_qty = new.qty
	where prod_id = new_prod_id;
	return new
END;
create Trigger update_stock_trigger
After insert on Tbl_orders
Execute function update_stock()
