
with Tables;
use Tables;

with Text_Io;
use Text_Io;


procedure Test1 is 

   Tab1 : Table := (10, 3, 5, 10, 4, 100, 0, 101, 8, 19);  

begin
   Put(Tab1);
   New_Line;
   Sort(Tab1);
   Put(Tab1);
   New_Line;
   Initialize(Tab1, 0);
   Put(Tab1);
   New_Line;
end Test1;


