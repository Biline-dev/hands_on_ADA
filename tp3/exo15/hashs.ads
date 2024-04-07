

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;



generic
   Size : Positive := 100;  
   type Data_Type is private; 

   with function Compute_Hash (
         Key  : in     Unbounded_String ) 
     return Natural; 
   with procedure Put (
         D : Data_Type ); 


package Hashs is


   type Hash is private; 


   procedure Initialize (
         H : in out Hash ); 

   procedure Add (
         H     : in out Hash;             
         Key   : in     Unbounded_String; 
         D     : in     Data_Type         ); 

   function Consult (
         H     : in     Hash;            
         Key   : in     Unbounded_String ) 
     return Data_Type; 

   procedure Put (
         H : in     Hash ); 


   -- Exception levee par "Consult" si la clef
   -- n'est pas trouve dans la table
   -- 
   Data_Not_Found : exception;


private


   type Cell; 
   type Link is access Cell; 


   type Cell is 
      record 
         Next   : Link;  
         Key    : Unbounded_String;  
         A_Data : Data_Type;  
      end record; 


   type Hash is array (1 .. Size) of Link; 



end Hashs;


