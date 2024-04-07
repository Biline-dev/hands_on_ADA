with Text_IO;
use  Text_IO;

package body Piles is
   procedure Vider is 
   begin
      Nb := 0;
   end Vider;

   function Est_Vide return Boolean is 
   begin
      return Nb = 0;
   end Est_Vide;

   function Sommet return Element is 
   begin
      if Nb = 0 then
         raise Pile_Vide;
      end if;
      return Donnees(Nb);
   end Sommet;
   
   procedure Empiler (
         V : in     Element ) is 
   begin
      if Nb = Taille then
         raise Pile_Pleine;
      end if;
      Nb := Nb + 1;
      Donnees(Nb) := V;
   end Empiler;

   procedure Depiler is 
   begin
      if Nb = 0 then
         raise Pile_Vide;
      end if;
      Nb:= Nb - 1;
   end Depiler;

   procedure Inverser is 
   Temp : Table;
   Index : Natural := 1;
   begin
      if Nb = 0 then
         raise Pile_Vide;
      end if;

      -- Copy elements to temporary stack in reverse order
      for I in reverse 1 .. Nb loop
         Temp(Index) := Donnees(I);
         Index := Index + 1;
      end loop;

      -- Copy elements back to the original stack
      for I in 1 .. Nb loop
         Donnees(I) := Temp(I);
      end loop;
   end Inverser;

   procedure Afficher is
   begin
      if Nb = 0 then
         Put_Line("La pile est vide.");
      else
         Put("Contenu de la pile : ");
         for I in 1 .. Nb loop
            Put_Element(Donnees(I));
           
            Put(" ");
         end loop;
         New_Line;
      end if;
   end Afficher;


end;