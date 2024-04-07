with Text_Io;
use Text_Io;


package body Tables is



   procedure Initialize (
         Tab : in out Table;  
         Val : in     Element ) is 
   begin
      for I in Table_Range loop
         Tab(I):=Val;
      end loop;
   end Initialize;


   procedure Put (
         Tab : in     Table ) is 
   begin
      for I in Table_Range loop
         Put(Tab(I));
         Put(' ');
      end loop;
   end Put;



   task type Mutex is
      entry P; 
      entry V; 
   end Mutex;
   task body Mutex is
   begin
      loop
         select
            accept P; 
         or
            terminate;
         end select;

         select
            accept V; 
         or
            terminate;
         end select;
      end loop;
   end Mutex;



   procedure Sort (
         Tab : in out Table ) is 

      A_Mutex : array (0 .. Nb_Partitions) of Mutex;  


      procedure Exclusive_Sort_Partition (
            Tab              : in out Table;       
            From,                                  
            To               :        Table_Range; 
            Partition_Number :        Natural      ) is 

         Temp : Element;  

      begin
         for I in From..To loop
            for J in From..To-1 loop

               if J <= From+1
                     then
                  A_Mutex(Partition_Number).P;
               end if;
               if J >= To-1
                     then
                  A_Mutex(Partition_Number+1).P;
               end if;

               if not In_Order(Tab(J),Tab(J+1))
                     then
                  Temp:=Tab(J);
                  Tab(J):=Tab(J+1);
                  Tab(J+1):=Temp;
               end if;

               if J <= From+1
                     then
                  A_Mutex(Partition_Number).V;
               end if;
               if J >= To-1
                     then
                  A_Mutex(Partition_Number+1).V;
               end if;
            end loop;
         end loop;
      end Exclusive_Sort_Partition;


      task type Sorter is
         entry Init_Sort (
               From,                                  
               To               : in     Table_Range; 
               Partition_Number :        Natural      ); 
         entry Do_Sort; 
         entry End_Sort; 
      end Sorter;

      task body Sorter is
         From_Ind,  
         To_Ind       : Table_Range;  
         Partition_Id : Natural;  

      begin
         accept Init_Sort (
               From,                                  
               To               : in     Table_Range; 
               Partition_Number : in     Natural      ) do 
            From_Ind:=From;
            To_Ind:=To;
            Partition_Id:=Partition_Number;
         end Init_Sort;

         loop
            select
               accept Do_Sort; 
               Exclusive_Sort_Partition(Tab, From_Ind, To_Ind,
                  Partition_Id);
            or
               terminate;
            end select;
            accept End_Sort; 
         end loop;
      end Sorter;



      Tsk      : array (0 .. Nb_Partitions - 1) of Sorter;  
      From,  
      To       : Table_Range;  
      Previous : Table;  

   begin

      for I in  0..Nb_Partitions-1 loop
         From:=Table_Range(1 + I*Size/Nb_Partitions);
         To:=Table_Range((I+1)*Size/Nb_Partitions);

         if I=0
               then
            To:=To+1;
         else
            if I=Nb_Partitions-1
                  then
               From:=From-1;
            else
               if (I<Nb_Partitions-1) and (I>0)
                     then
                  From:=From-1;
                  To:=To+1;
               end if;
            end if;
         end if;

         Tsk(I).Init_Sort(From,To,I);

      end loop;

      loop
         Previous:=Tab;
         for I in  0..Nb_Partitions-1 loop
            Tsk(I).Do_Sort;
         end loop;
         for I in  0..Nb_Partitions-1 loop
            Tsk(I).End_Sort;
         end loop;

         exit when Previous=Tab;
      end loop;

   end Sort;



end Tables;



