with Text_IO; use Text_IO;

procedure test is

   counter : Integer := 0;

   task  mutex is
      entry p;
      entry v;
   end mutex;

   task tic;
   task tac;

   task body tic is
   begin
      loop
         mutex.p;
         counter := counter + 1;
         Put_Line("tic : " & Integer'Image(counter));
         delay 1.0;
         mutex.v;
      end loop;
   end tic;

   task body tac is
   begin
      loop
         mutex.p;
         counter := counter + 1;
         Put_Line("tac : " & Integer'Image(counter));
         delay 1.0;
         mutex.v;
      end loop;
   end tac;

   task body Mutex is
   begin
      loop
         accept P; 
         accept V; 
      end loop;
   end Mutex;

begin
   null;
end test;
