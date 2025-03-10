 class cls_room;
	string name;
	int roll_no;
	int age;
	task students;
		name = "Virat_Kohli";
		roll_no = 18;
		age = 33;
	endtask : students
endclass : cls_room



module class_access; 
	initial begin
     cls_room cls1=new();
	cls1.students;
      $display("student name = %0s  roll_no = %0d  age = %0d;",cls1.name,cls1.roll_no,cls1.age);
	cls1.age = 38;
	cls1.name = "Rohit";
      $display("student name = %0s  roll_no = %0d  age = %0d;",cls1.name,cls1.roll_no,cls1.age);
end 
endmodule
