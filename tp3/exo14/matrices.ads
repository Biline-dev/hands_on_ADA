

generic
   type Element is private; 
   with procedure Initialize (
         E : in out Element ); 
   with procedure Put (
         E : in     Element ); 
   with function "*" (
         E1,                 
         E2 : in     Element ) 
     return Element; 
   with function "+" (
         E1,                 
         E2 : in     Element ) 
     return Element; 

package Matrices is


   type Matrice is array (Integer range <>, Integer range <>) of Element; 

   function "*" (
         X : in     Element; 
         M : in     Matrice  ) 
     return Matrice; 
   function "*" (
         M : in     Matrice; 
         X : in     Element  ) 
     return Matrice; 
   function "+" (
         X,                 
         Y : in     Matrice ) 
     return Matrice; 

   procedure Put (
         M : Matrice ); 


end Matrices;
