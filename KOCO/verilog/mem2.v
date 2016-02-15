//
// Name: Memory Module
// By  : Keith Schubert
// Date: Nov. 21, 2003
// Desc: 256x32 SRAM with 5ns access time

module SRAM256x32(DataIO,MemDone,Address,Write,Start);

// inputs and outputs
input [7:0] Address;
input Write, Start;
inout [31:0] DataIO;
output MemDone;
reg       MemDone;

// parameters
parameter access=4;

// declarations
reg [31:0] mem [0:256];
reg [31:0] DataXfer;
reg Out;

// create a tristate IO line
assign DataIO = (Out)? DataXfer : 32'bz;

// set initial conditions necessary for data transfer
initial
begin
  MemDone<=1;
  Out<=0;
  mem[0]= 32'h87888001;
  mem[1]= 32'h86808B02;
  mem[2]= 32'h87878603;
  mem[3]= 32'h01018304;
  mem[4]= 32'h82828101;
  mem[128]= 32'h00000000;
  mem[129]= 32'hFFFFFFFF;
  mem[130]= 32'hFFFFFFFD;
  mem[131]= 32'h00000100;
  mem[136]= 32'h00000001;
  mem[137]= 32'h00000002;
  mem[138]= 32'h00000004;
  mem[139]= 32'h00000008;
  
end


// handle a command from cpu
always @(posedge Start)
begin
           MemDone<=0;
           DataXfer<=DataIO;
  #access  if (Write)
             mem[Address]<=DataXfer;
           else
           begin
             DataXfer=mem[Address]; // use blocking to ensure timing
             Out=1;
           end
  #1       MemDone<=1;
  #1       Out<=0;  // hold output one cycle past transmission
           MemDone<=0;
end

endmodule 