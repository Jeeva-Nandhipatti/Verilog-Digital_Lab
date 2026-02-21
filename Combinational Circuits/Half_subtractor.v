//---------------------------------
//     DESIGN - Half_subtractor.v
//---------------------------------

module half_subtractor (
  input a,b,
  output borrow,diff);
  
  assign borrow = !a & b;
  assign diff = (!a & b) | (a & !b);
endmodule

//---------------------------------
//   TESTBENCH - Half_subtractor_tb.v
//---------------------------------

module tb;
  reg a,b;
  wire borrow,diff;
  
  half_subtractor dut(.a(a),.b(b),.borrow(borrow),.diff(diff));    //Instantiation of design file
  
  initial begin
    a=0; b=0; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    a=0; b=1; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    a=1; b=0; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    a=1; b=1; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    $finish;
  end
  
endmodule
