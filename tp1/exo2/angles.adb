-- angles.adb (Body)
WITH Ada.Text_IO ;            
--USE Ada.Text_IO;
WITH Ada.Integer_Text_IO ;    
--USE Ada.Integer_Text_IO ;

--with Float_IO;
--USE Float_IO; 

package body angles is

   
   package angles_deg is new Ada.Text_IO.Integer_IO(angle_degre);
   package angles_rad is new Ada.Text_IO.Float_IO(angle_radian);
   use angles_deg;
   use angles_rad;
   --

   procedure Get_deg(Angle : out angle_degre) is
   begin
      Ada.Text_IO.Put("Saisir un angle en degrés : ");
      Get(Angle);
   end Get_deg;

   procedure Get_rad(Angle : out angle_radian) is
   begin
      Ada.Text_IO.Put("Saisir un angle en radians : ");
      Get(Angle);
   end Get_rad;

   procedure Put_deg(Angle : angle_degre) is
   begin
      Ada.Text_IO.Put_Line("Angle en degre : ");
      put(Angle);
   end Put_deg;

   procedure Put_rad(Angle : angle_radian) is
   begin
      put(Angle);
      Ada.Text_IO.Put_Line("Angle en radians : " & Float'Image(Float(Angle)));
   end Put_rad;

end angles;
