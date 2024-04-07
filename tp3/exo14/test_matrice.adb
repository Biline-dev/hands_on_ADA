

with Text_Io;
use Text_Io;

with Matrices;


procedure Test_Matrice is 

   procedure Initialize (
         I : in out Integer ) is 
   begin
      I:=0;
   end Initialize;


   package Io is new Text_Io.Integer_Io(Integer);
   use Io;
   procedure Put (
         E : in     Integer ) is 
   begin
      Io.Put(E);
   end Put;


   package Mat is new Matrices(Integer,Initialize,Put,"*","+");
   use Mat;


   X   : Integer                      := 10;  

   -- Matrice 3 lignes/2 colonnes
   --
   M1   : Mat.Matrice (1 .. 3, 1 .. 2) := ((1, 1), (2, 2), (3, 3));  

   -- Matrice 2 lignes/3 colonnes
   --
   M2   : Mat.Matrice (1 .. 2, 1 .. 3) := ((2, 4, 1), (7, 2, 5));  


   Res1 : Mat.Matrice (1 .. 3, 1 .. 2);  
   Res2 : Mat.Matrice (1 .. 3, 1 .. 3);  

begin

   Put(M1);
   New_Line;
   Res1:=M1*X;
   Put(Res1);

   New_Line;
   New_Line;
   Res2:=M1+M2;
   Put(Res2);

end Test_Matrice;


