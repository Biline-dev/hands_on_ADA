
with Tables;

with Text_Io;
use Text_Io;


procedure Test2 is 


   function Order (
         E1,          
         E2 : Integer ) 
     return Boolean is 
   begin
      return E1<E2;
   end Order;

   procedure Put (
         E : Integer ) is 
   begin
      Put(E'Img);
   end Put;



   package Montab is new Tables(Integer,12, Put, Order);
   use Montab;

   Tab1 : Table := (10, 3, 5, 10, 4, 100, 0, 101, 8, 19, 102, 25);  

begin
   Put(Tab1);
   New_Line;
   Sort(Tab1);
   Put(Tab1);
   New_Line;
end Test2;


