-- add them to the set up 

create procedure GetMaxQuantity() 

BEGIN

select MAX(TotalCost) from Orders;

END//    


create procedure ManageBooking
 (Booking_ID INT,Customer_id INT, Table_Num INT ,Table_Date TIME) 

BEGIN



replace into Bookings values(Booking_ID,Customer_id,Table_Num,Table_Date);



END//


create procedure AddBooking(Booking_ID INT,Customer_id INT, Table_Num INT ,Table_Date TIME) 


BEGIN


replace into Bookings values(Booking_ID,Customer_id,Table_Num,Table_Date);



END //



create procedure  UpdateBooking(Table_Num INT,Booking_date date)  

BEGIN

UPDATE Bookings SET TableNumber = Table_Num,   TableDate = Table_Date ;


END//



create procedure CancelBooking(Table_Num INT)

BEGIN

DELETE from Bookings where TableNumber= Table_Num;


END// 
