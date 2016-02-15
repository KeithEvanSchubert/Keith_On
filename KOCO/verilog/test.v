module test;
  reg [31:0] md;
  reg [7:0] ma;
  reg start, write;
  wire done;
  wire[31:0] databus;
  
  assign databus = (start & write) ? md : 32'bz;
  
  SRAM256x32 mem(databus, done, ma, write, start);
  
  initial
  begin
  $monitor("%h         %h       %b %b %b %0d",md,ma,write,start,done,$time);
  #1  ma    = 8'b00000010;
      md    =32'h00000005;
      write = 1'b1;
      start = 1'b1;
  #1  start = 1'b0;
     
  #20 ma    = 8'b00000011;
      md    =32'h00000050;
      write = 1'b1;
      start = 1'b1;
  #1  start = 1'b0;
     
  #20 ma    = 8'b00000010;
      write = 1'b0;
      start = 1'b1;
  #1  start = 1'b0;
      
  #20 $finish;
  end
  
  always @(posedge done)
    if(~write)
      md=databus;
endmodule 