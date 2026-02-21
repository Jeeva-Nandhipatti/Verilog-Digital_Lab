`timescale 1ns/1ps

//--------------------
//		DESIGN
//--------------------

module or_gate (a,b,out);
  input a,b;
  output out;
  
  assign out = a | b;
endmodule

//--------------------
//		TESTBENCH
//--------------------

module tb;
  reg a,b;
  wire out;
  
  or_gate dut(.a(a),.b(b),.out(out));
  
  initial begin
    $display("OR Gate Operation: ");
    a=0; b=0; #10 $display("%b AND %b = %b",a,b,out);
    a=0; b=1; #10 $display("%b AND %b = %b",a,b,out);
    a=1; b=0; #10 $display("%b AND %b = %b",a,b,out);
    a=1; b=1; #10 $display("%b AND %b = %b",a,b,out);
    $finish;
  end
endmodule
