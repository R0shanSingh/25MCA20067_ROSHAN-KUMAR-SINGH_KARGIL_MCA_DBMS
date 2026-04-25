Select s.sup_name, p.prod_name,o.qty FROM Tbl_Orders o
JOIN Tbl_Products p on o.prod_id = p.prod_id
JOIN Tbl_Suppliers s on p.sup_id = s.sup_id;
