//
// Name: Memory Module
// By  : Keith Schubert
// Date: Nov. 21, 2003
// Desc: 32x8 SRAM with 5ns access time

module SRAM32x8(DataIO,MemDone,Address,Write,Start);

// inputs and outputs
input [4:0] Address;
input Write, Start;
inout [7:0] DataIO;
output MemDone;
reg       MemDone;

// parameters
parameter access=4;

// declarations
reg [7:0] mem [0:31];
reg [7:0] DataXfer;
reg Out;

// create a tristate IO line
assign DataIO = (Out)? DataXfer : 8'bz;

// set initial conditions necessary for data transfer
initial
begin
  MemDone<=1;
  Out<=0;
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