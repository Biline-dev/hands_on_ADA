WITH Ada.Text_IO ;            
USE Ada.Text_IO;
WITH Ada.Integer_Text_IO ;    
USE Ada.Integer_Text_IO ;
with Ada.Text_IO.Float_IO;
USE Ada.Text_IO.Float_IO; 


procedure Lire is
   Angle_Degre : Integer range 1 .. 360;
begin
   Put("Saisir un entier : ");
   Get(Angle_Degre);
   Put_Line("Vous avez saisi : " & Integer'Image(Angle_Degre));
end Lire;
