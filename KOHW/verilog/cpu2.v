

module KES_cpu;

parameter clock=1;

reg [7:0] PC, ma;
reg [31:0] IR, D, S1, S2, md;
reg start, write;
wire done;
wire[31:0] databus;
  
  assign databus = (start & write) ? md : 32'bz;
  
  SRAM256x32 mem(databus, done, ma, write, start);


initial begin
  start<=1'b0;
  PC<=0;
  $display("PC  IR               D                Time");
  $monitor("%h  %h         %h         %0d",PC,IR,D,$time);
end

always begin
  /////////////////////////////////////
  //fetch and decode
  /////////////////////////////////////
  
  // fetch
  #clock if (PC==5)
           $finish;
         ma<=PC;
         write<=1'b0;
         start<=1'b1;
         
         PC<=PC+1;
         
         @(posedge done) begin
           md<=databus;
           start<=1'b0;
         end
  
  // get Source 1
  #clock IR<=md;
         ma<=md[23:16];
         write<=1'b0;
         start<=1'b1;
         
         @(posedge done) begin
           md<=databus;
           start<=1'b0;
         end
  
  // get Source 2 and
  #clock S1<=md;
         ma<=IR[15:8];
         write<=1'b0;
         start<=1'b1;
         
         @(posedge done) begin
           md<=databus;
           start<=1'b0;
         end
  #clock S2<=md;
  
  ////////////////////////////////////////////////////
  // execute and store
  ////////////////////////////////////////////////////
  
  #clock D<=S1-S2;
  #clock ma<=IR[31:24];
         md<=D;
         write<=1'b1;
         start<=1'b1;
         
         if (D[31])
           PC=IR[7:0];
         
         @(posedge done)
           start<=1'b0;
         $display("\n");
  
end

endmodule 