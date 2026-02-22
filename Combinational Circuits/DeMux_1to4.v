//---------------------------------
//     DESIGN - DeMux_1to4.v
//---------------------------------

module demux_1to4(
  input data_in,
  input [1:0]sel,		// 2-bit select line
  output out0,			
  output out1,			
  output out2,			
  output out3			
);
  
  //Used Ternary operator to check condition for select signal
  
  assign out0 = (sel == 2'b00) ? data_in : 1'b0;		// Assigns data_in value when sel=00
  assign out1 = (sel == 2'b01) ? data_in : 1'b0;		// Assigns data_in value when sel=01
  assign out2 = (sel == 2'b10) ? data_in : 1'b0;		// Assigns data_in value when sel=10
  assign out3 = (sel == 2'b11) ? data_in : 1'b0;		// Assigns data_in value when sel=11

endmodule

//---------------------------------
//     TESTBENCH - DeMux_1to4_tb.v
//---------------------------------

module demux_1to4_tb;
  reg data_in;
  reg [1:0]sel;
  wire out0, out1, out2, out3;
    
  demux_1to4 dut (
    .data_in(data_in),
    .sel(sel),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3));
    
  initial begin 

    // Test cases
    data_in = 1'b1; sel = 2'b00; #10
    $display("\ndata_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    sel = 2'b01; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    sel = 2'b10; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    sel = 2'b11; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    $display("-------------------------------------------------------------------------------\n");

    data_in = 1'b1; sel = 2'b11; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    sel = 2'b10; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    sel = 2'b01; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    sel = 2'b00; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    $display("-------------------------------------------------------------------------------\n");

    data_in = 1'b1; sel = 2'b01; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    data_in = 1'b0; sel = 2'b01; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    data_in = 1'b1; sel = 2'b01; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b",data_in,sel,out0,out1,out2,out3);
    data_in = 1'b0; sel = 2'b01; #10
    $display("data_in= %b, sel= %b --> out0= %b,out1= %b,out2= %b,out3= %b\n",data_in,sel,out0,out1,out2,out3);
    #10 
    $finish;
    end

endmodule
