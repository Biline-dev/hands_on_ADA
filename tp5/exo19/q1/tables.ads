

package Tables is


   Size : constant Natural := 10;  

   type Table_Range is range 1 .. Size; 
   type Table is array (Table_Range) of Integer; 


   procedure Initialize (
         Tab : in out Table;  
         Val : in     Integer ); 

   procedure Put (
         Tab : in     Table ); 

   procedure Sort (
         Tab : in out Table ); 

end Tables;
