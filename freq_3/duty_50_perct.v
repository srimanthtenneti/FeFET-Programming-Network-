// ********************************************
//  File : Frequency by 3 circuit
//  Engineer : Srimanth Tenneti 
//  RTL Revision : 0.01 
//  Date : 21 Sept 2022 
// ********************************************


module ff3(
  input clk,
  output reg out
);
  
  reg [1:0] count = 2'b00;
  
  always @ (posedge clk)
    begin 
      count = count + 1;
      if (count == 2'b11)
        out <= 1;
      else 
        out <= 0;
    end 
endmodule 

module dffn(
  input clk,
  input d,
  output reg o
);
  
  always @ (negedge clk)
    begin 
      o <= d;
    end 
endmodule 

module ff3top (
  input clk,
  output f3
);
  
  wire w1;
  
  ff3 u1(
    .clk(clk),
    .out(w1)
  );
  
  wire w2;
  
  
  dffn f0 (
    .clk(clk),
    .d(w1),
    .o(w2)
  );
  
  assign f3 = w1 | w2;
  
endmodule 
