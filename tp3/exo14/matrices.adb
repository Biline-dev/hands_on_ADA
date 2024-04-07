

with Text_Io;
use Text_Io;

package body Matrices is



   function "*" (
         X : in     Element; 
         M : in     Matrice  ) 
     return Matrice is 

      Z           :          Matrice (M'First(1) .. M'Last(1), 
				 M'First(2) .. M'Last(2) );

   begin
      for I in M'First(1) .. M'Last(1) loop
         for J in M'First(2) .. M'Last(2)  loop
            Z(I,J):=X*M(I,J);
         end loop;
      end loop;

      return Z;
   end "*";


   function "*" (
         M : in     Matrice; 
         X : in     Element  ) 
     return Matrice is 

   begin
      return X*M;
   end "*";


   function "+" (
         X,                 
         Y : in     Matrice ) 
     return Matrice is 

      
      Z           :          Matrice (X'First(1) .. X'Last(1), 
				 Y'First(2) .. Y'Last(2) );
         
      Res         :          Element;  

   begin
      for I in X'First(1) .. X'Last(1) loop
         for J in Y'First(2) .. Y'Last(2)  loop
            Initialize(Res);
            for K in Y'First(1) .. Y'Last(1) loop
               Res:=Res+X(I,K)*Y(K,J);
            end loop;
            Z(I,J):=Res;
         end loop;
      end loop;

      return Z;
   end "+";



   procedure Put (
         M : Matrice ) is 

   begin
      for I in M'First(1) .. M'Last(1) loop
         for J in M'First(2) .. M'Last(2)  loop
            Put(M(I,J));
            Put(" ");
         end loop;
      end loop;

   end Put;

end Matrices;