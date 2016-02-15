

module KES_cpu;

parameter clock=1;

reg [4:0] PC, I_ma, I_md;
reg [7:0] IR, D, S1, S2, I_md, D_md;
reg I_start, D_start, I_write, D_write;
wire I_done, D_done;
wire[7:0] I_databus, D_databus;
  
  assign I_databus = (I_start & I_write) ? I_md : 8'bz;
  SRAM256x8 I_mem(I_databus, I_done, I_ma, I_write, I_start);
  
  assign D_databus = (D_start & D_write) ? D_md : 8'bz;
  SRAM256x8 D_mem(D_databus, D_done, D_ma, D_write, D_start);


initial begin
  I_start<=1'b0;
  D_start<=1'b0;
  PC<=0;
  $display("PC  IR               D                Time");
  $monitor("%h  %h         %h         %0d",PC,IR,D,$time);
end

always begin
  /////////////////////////////////////
  //fetch
  /////////////////////////////////////
  
  #clock if (PC==5)
           $finish;
         I_ma<=PC;
         I_write<=1'b0;
         I_start<=1'b1;
         
         PC<=PC+1;
         
         @(posedge I_done) begin
           I_md<=I_databus;
           I_start<=1'b0;
         end
  #clock IR<=I_md;
  
  /////////////////////////////////////
  //decode
  /////////////////////////////////////
  #clock if (IR[7:6]==2'b10)
           begin
           D_ma<=IR[
           end
         else
           begin
           
           end
           
  /////////////////////////////////////
  //execute
  /////////////////////////////////////
  
  #clock D<=S1-S2;
  
  
  /////////////////////////////////////
  //write
  /////////////////////////////////////
  
  
end

endmodule 