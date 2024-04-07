generic

   type Element is private; 
   Size          : Natural := 15;  
   Nb_Partitions : Natural := 3;  

   with procedure Put (
         E : in     Element ); 
   with function In_Order (
         E1,                 
         E2 : in     Element ) 
     return Boolean; 

package Tables is


   type Table_Range is new Integer range 1 .. Size; 
   type Table is array (Table_Range) of Element; 



   procedure Initialize (
         Tab : in out Table;  
         Val : in     Element ); 
   procedure Put (
         Tab : in     Table ); 
   procedure Sort (
         Tab : in out Table ); 

end Tables;
