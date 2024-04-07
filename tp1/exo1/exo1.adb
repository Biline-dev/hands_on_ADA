with Ada.Text_IO;

procedure Hello is
   type k is new integer range 1..3;
   type m is array (1..5) of integer;
begin

   Ada.Text_IO.Put_Line("Hello, World!");
end Hello;