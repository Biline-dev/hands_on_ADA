with Text_IO; use Text_IO;

procedure test is

   counter : Integer :=0;
   task tic;
   task tac;

   task body tic is
   begin
      loop
         counter := counter +1;
         Put_Line("tic : " & Integer'Image(counter));
         delay 1.0;
      end loop;
   end tic;

   task body tac is
   begin
      loop
         counter := counter +1;
          Put_Line("tac : " & Integer'Image(counter));
          delay 1.0;
      end loop;
   end tac;

begin
  null;
end test;
