//---------------------------------
//     DESIGN - Half_subtractor.v
//---------------------------------

module half_subtractor (
  input a,b,
  output borrow,diff);      //Borrow and Difference
  
  assign borrow = !a & b;
  assign diff = (!a & b) | (a & !b);
endmodule

//---------------------------------
//   TESTBENCH - Half_subtractor_tb.v
//---------------------------------

module tb;
  reg a,b;
  wire borrow,diff;        //Borrow and Difference
  
  half_subtractor dut(.a(a),.b(b),.borrow(borrow),.diff(diff));    //Instantiation of design module
  
  initial begin
    //Test cases
    a= 1'b0; b= 1'b0; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    a= 1'b0; b= 1'b1; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    a= 1'b1; b= 1'b0; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    a= 1'b1; b= 1'b1; #10 $display("a= %b, b= %b\nBorrow = %b, Difference = %b",a,b,borrow,diff);
    $finish;
  end
  
endmodule
