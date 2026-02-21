`timescale 1ns/1ps

//-------------------
//    DESIGN
//-------------------

module and_gate(a,b,out);
  input a,b;
  output out;
  
  assign out = a & b;
endmodule

//-------------------
//     TESTBENCH
//-------------------

module tb;
  reg a,b;
  wire out;
  
  and_gate dut(.a(a),.b(b),.out(out));    //Instantiation of design file
  
  initial begin
    $display("AND Gate Operation: ");
    a=0; b=0; #10 $display("%b AND %b = %b",a,b,out);
    a=0; b=1; #10 $display("%b AND %b = %b",a,b,out);
    a=1; b=0; #10 $display("%b AND %b = %b",a,b,out);
    a=1; b=1; #10 $display("%b AND %b = %b",a,b,out);
    $finish;
  end
endmodule
