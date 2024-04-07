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

   procedure Sort (
         Tab : in out Table ) is 


      procedure Sort_Partition (
            Tab  : in out Table;      
            From,                     
            To   :        Table_Range ) is 

         Temp : Element;  

      begin
         for I in From..To loop
            for J in From..To-1 loop
               if not In_Order(Tab(J),Tab(J+1))
                     then
                  Temp:=Tab(J);
                  Tab(J):=Tab(J+1);
                  Tab(J+1):=Temp;
               end if;
            end loop;
         end loop;
      end Sort_Partition;



      procedure Merge_Partition (
            Result : in out Table; 
            Tab    : in     Table  ) is 

         Index   : Natural;  
         Pointer : array (0 .. Nb_Partitions - 1) of Natural;  

         Number : array (0 .. Nb_Partitions - 1) of Natural;  

         Selected           : Element;  
         Selected_Partition : Natural;  

      begin
         Index:=1;
         for I in  0..Nb_Partitions-1 loop
            Pointer(I):=Index;
            Number(I):=1;
            Index:= Index + Size/Nb_Partitions;
         end loop;


         for I in Table_Range loop

            -- Recherche du plus petit element
            -- de chaque partition
            --
            for I in 0..Nb_Partitions-1 loop
               if Number(I)<= Size/Nb_Partitions  then
                  Selected:=Tab(Table_Range(Pointer(I)));
                  Selected_Partition:=I;
                  exit;
               end if;
            end loop;

            for J in 0..Nb_Partitions-1 loop
               if  (not In_Order(Selected, Tab(Table_Range(Pointer(J))) ))
                     and (Number(J) <= Size/Nb_Partitions)
                     then
                  Selected:=Tab(Table_Range(Pointer(J)));
                  Selected_Partition:=J;

               end if;
            end loop;
            Result(I):=Selected;
            Pointer(Selected_Partition):=Pointer(Selected_Partition)+1;
            Number(Selected_Partition):=Number(Selected_Partition)+1;
         end loop;
      end Merge_Partition;


      task type Sorter is
         entry Start_Sort (
               From,                     
               To   : in     Table_Range ); 
         entry End_Sort; 
      end Sorter;

      task body Sorter is
         From_Ind,  
         To_Ind   : Table_Range;  

      begin
         accept Start_Sort (
               From,                     
               To   : in     Table_Range ) do 
            From_Ind:=From;
            To_Ind:=To;
         end Start_Sort;
         Sort_Partition(Tab, From_Ind, To_Ind);
         accept End_Sort; 
      end Sorter;
      type Sorter_Ptr is access Sorter; 



      Tsk  : array (0 .. Nb_Partitions - 1) of Sorter_Ptr;  
      From,  
      To   : Table_Range;  
      Res  : Table;  

   begin

      for I in  0..Nb_Partitions-1 loop
         From:=Table_Range(1 + I*Size/Nb_Partitions);
         To:= Table_Range((I+1)*Size/Nb_Partitions);

         Tsk(I):= new Sorter;
         Tsk(I).Start_Sort(From,To);
      end loop;
      for I in  0..Nb_Partitions-1 loop
         Tsk(I).End_Sort;
      end loop;

      Merge_Partition(Res,Tab);
      Tab:=Res;

   end Sort;


end Tables;



