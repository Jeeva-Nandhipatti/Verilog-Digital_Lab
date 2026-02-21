//---------------------------------
//     DESIGN - Full_adder.v
//---------------------------------

module full_adder (
  input a,b,c,
  output sum,carry);
  
  assign sum = a ^ b ^ c;
  assign carry = (a & b) | (b & c) | (c & a);
endmodule

//---------------------------------
//   TESTBENCH - Full_adder_tb.v
//---------------------------------

module tb;
  reg a,b,c;
  wire sum,carry;
  
  full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));		 //Instantiation of design module
  
  initial begin
    
    a = 1'b0; b = 1'b0; c = 1'b0; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b0; b = 1'b0; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b0; b = 1'b1; c = 1'b0; #10;
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b0; b = 1'b1; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b1; b = 1'b0; c = 1'b0; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b1; b = 1'b0; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b1; b = 1'b1; c = 1'b0; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    a = 1'b1; b = 1'b1; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, sum = %b, Carry = %b",a,b,c,sum,carry);
    $finish;
  end
  
endmodule
