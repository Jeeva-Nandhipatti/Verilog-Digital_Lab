//---------------------------------
//     DESIGN - Decoder_2to4.v
//---------------------------------

module decoder_2to4 (
  input  [1:0] in,      //2 bit input
  output reg [3:0] y);  //4 bit output
  
  assign y[0] = (~in[1] & ~in[0]);
  assign y[1] = (~in[1] &  in[0]);
  assign y[2] = ( in[1] & ~in[0]);
  assign y[3] = ( in[1] &  in[0]);
  
  //Another approach
  /*always @(*) begin
    case (in)
      2'b00: y = 4'b0001;
      2'b01: y = 4'b0010;
      2'b10: y = 4'b0100;
      2'b11: y = 4'b1000;
      default: y = 4'b0000;
    endcase
  end*/

endmodule

//---------------------------------
//  TESTBENCH - Decoder_2to4_tb.v
//---------------------------------

module decoder_2to4_tb;
  reg [1:0] in;
  wire [3:0] y;
  
  decoder_2to4 dut (.in(in),.y(y));
  
  initial begin
    in= 4'b00; #10 $display("i = %b, y = %b",in,y);
    in= 4'b01; #10 $display("i = %b, y = %b",in,y);
    in= 4'b10; #10 $display("i = %b, y = %b",in,y);
    in= 4'b11; #10 $display("i = %b, y = %b",in,y);
    #10;
    $finish;
  end
endmodule
