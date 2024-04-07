with Text_Io;
use Text_Io;


package body Tables is


   procedure Initialize (
         Tab : in out Table;  
         Val : in     Integer ) is 
   begin
      for I in Table_Range loop
         Tab(I):=Val;
      end loop;
   end Initialize;

   procedure Put (
         Tab : in     Table ) is 
   begin
      for I in Table_Range loop
         Put(Tab(I)'Img);
         Put(' ');
      end loop;
   end Put;

   procedure Sort (
         Tab : in out Table ) is 

      Temp : Integer;  

   begin
      for I in Table_Range'First..(Table_Range'Last-1) loop
         for J in Table_Range'First..(Table_Range'Last-1) loop
            if Tab(J)<Tab(J+1)
                  then
               Temp:=Tab(J);
               Tab(J):=Tab(J+1);
               Tab(J+1):=Temp;
            end if;
         end loop;
      end loop;
   end Sort;



end Tables;



