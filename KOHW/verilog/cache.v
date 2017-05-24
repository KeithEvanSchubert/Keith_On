//
// Name: Cache Module
// By  : Keith Schubert
// Date: Nov. 21, 2003
// Desc: 16x32 SRAM with 1ns access time and 2 access ports

module Cache16x32(DataIO_1,DataIO_2,MemDone_1,MemDone_2,Address_1,Address_2,Write_1,Write_2,Start_1,Start_2);

// inputs and outputs
input [7:0] Address_1,Address_2;
input Write_1, Write_2, Start_1, Start_2;
inout [31:0] DataIO_1, DataIO_2;
output MemDone_1, MemDone_2;
reg    MemDone_1, MemDone_2;

// parameters
parameter access=1;

// declarations
reg [31:0] mem [0:16];
reg [31:0] DataXfer_1, DataXfer_2;
reg Out_1, Out_2;

// create 2 tristate IO lines
assign DataIO_1 = (Out_1)? DataXfer_1 : 32'bz;
assign DataIO_2 = (Out_2)? DataXfer_2 : 32'bz;

// set initial conditions necessary for data transfer
initial
begin
  MemDone_1<=1;
  MemDone_2<=1;
  Out_1<=0;
  Out_2<=0;
end


// handle a command from cpu on port 1
always @(posedge Start_1)
begin
           MemDone_1<=0;
           DataXfer_1<=DataIO_1;
  #access  if (Write_1)
             mem[Address_1]<=DataXfer_1;
           else
           begin
             DataXfer_1=mem[Address_1]; // use blocking to ensure timing
             Out_1=1;
           end
  #1       MemDone<=1;
  #1       Out<=0;  // hold output one cycle past transmission
           MemDone<=0;
end

endmodule 