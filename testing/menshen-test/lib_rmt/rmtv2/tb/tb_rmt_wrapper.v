
`timescale 1ns / 1ps

module tb_rmt_wrapper #(
    // Slave AXI parameters
	parameter C_S_AXI_DATA_WIDTH = 32,
	parameter C_S_AXI_ADDR_WIDTH = 12,
	parameter C_BASEADDR = 32'h80000000,
	// AXI Stream parameters
	// Slave
	parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128,
	// Master
	parameter C_M_AXIS_DATA_WIDTH = 512,
	// self-defined
	parameter PHV_ADDR_WIDTH = 4
)();

reg                                 clk;
reg                                 aresetn;

reg [C_S_AXIS_DATA_WIDTH-1:0]		s_axis_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]	s_axis_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		s_axis_tuser;
reg									s_axis_tvalid;
wire								s_axis_tready;
reg									s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		    m_axis_tdata;
wire [((C_S_AXIS_DATA_WIDTH/8))-1:0]    m_axis_tkeep;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		    m_axis_tuser;
wire								    m_axis_tvalid;
reg										m_axis_tready;
wire									m_axis_tlast;


//clk signal
localparam CYCLE = 10;

always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    aresetn = 1;
    #(10);
    aresetn = 0; //reset all the values
    #(10);
    aresetn = 1;
end

initial begin
    #(3*CYCLE+CYCLE/2);
    #(40* CYCLE)
    m_axis_tready <= 1'b1;
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(3*CYCLE)
    // conf1.txt:
    s_axis_tdata <= 512'h0000000000270e250d230c910ba10801000013ca1f00f2f1d204dededede6f6f6f6f1dde1140000001003300004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    s_axis_tkeep <= 64'h000000000000001f;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000270e250d230c910ba10801000513c51f00f2f1d204dededede6f6f6f6f1dde1140000001003300004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    s_axis_tkeep <= 64'h000000000000001f;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000c0000010001616a1000f2f1d204dededede6f6f6f6f2cde1140000001002400004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h003fffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'hffffffffffffffffffffffffffffff010f01b6692400f2f1d204dededede6f6f6f6f18de1140000001003800004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ffff0000ffffffffff;
    s_axis_tkeep <= 64'h00000000000003ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000100000000241ba2500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00100000000000000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0000f029da55a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007808c0200001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000100001000242892500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d00000000000000000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0010f029da55a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007808c0100001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    
    
    // confsys.txt:
    s_axis_tdata <= 512'h0000000000000000000000000c0000010021614a1000f2f1d204dededede6f6f6f6f2cde1140000001002400004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h003fffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000ffffffffffffffffffffffff010f21b6492400f2f1d204dededede6f6f6f6f18de1140000001003800004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ffffffffffffffff00;
    s_axis_tkeep <= 64'h00000000000003ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000c000002002161491000f2f1d204dededede6f6f6f6f2cde1140000001002400004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h003fffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000ffffffffffffffffffffffff020f21b6482400f2f1d204dededede6f6f6f6f18de1140000001003800004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ffffffffffffffff00;
    s_axis_tkeep <= 64'h00000000000003ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000c000003002161481000f2f1d204dededede6f6f6f6f2cde1140000001002400004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h003fffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000ffffffffffffffffffffffff030f21b6472400f2f1d204dededede6f6f6f6f18de1140000001003800004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ffffffffffffffff00;
    s_axis_tkeep <= 64'h00000000000003ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000c000004002161471000f2f1d204dededede6f6f6f6f2cde1140000001002400004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h003fffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000ffffffffffffffffffffffff040f21b6462400f2f1d204dededede6f6f6f6f18de1140000001003800004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ffffffffffffffff00;
    s_axis_tkeep <= 64'h00000000000003ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000c00000f0021613c1000f2f1d204dededede6f6f6f6f2cde1140000001002400004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h003fffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000ffffffffffffffffffffffff0f0f21b63b2400f2f1d204dededede6f6f6f6f18de1140000001003800004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ffffffffffffffff00;
    s_axis_tkeep <= 64'h00000000000003ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000001000000022429a2500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0000f22da235a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000050c50000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000200001002242892500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0010f22da225a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000050c50000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000300002002242782500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0020f22da215a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000050c50000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000400003002242672500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0030f22da205a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000050c50000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000f00004002241b62500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0040f22da1f5a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000050c50000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000100005002242a52500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0050f22ea235a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000040c00000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000200006002242942500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0060f22ea225a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000040c00000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000300007002242832500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0070f22ea215a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000040c00000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000400008002242722500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0080f22ea205a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000040c00000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000f00009002241c12500f2f1d204dededede6f6f6f6f17de1140000001003900004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000;
    s_axis_tkeep <= 64'h00000000000007ff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000f00001e00003c0000780000f0090f22ea1f5a00f2f1d204dededede6f6f6f6fe2dd1140000001006e00004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000040c00000e00100c00300800700000f00001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f00000e00100c003008007;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    
    
    // stateconf.txt:
    s_axis_tdata <= 512'h0000000000000000000000000000040100136f580d00f2f1d204dededede6f6f6f6f2fde1140000001002100004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h0007ffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000004040200136f530d00f2f1d204dededede6f6f6f6f2fde1140000001002100004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h0007ffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000008040300136f4e0d00f2f1d204dededede6f6f6f6f2fde1140000001002100004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h0007ffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000c040400136f490d00f2f1d204dededede6f6f6f6f2fde1140000001002100004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'h0007ffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000002000000030000002600404d1a00e110d204dededede6f6f6f6f22de1140000001002e00004500080f000081050403020100090000000000;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(100*CYCLE);
end
/*
initial begin
    #(3*CYCLE+CYCLE/2);
    #(40* CYCLE)
    m_axis_tready <= 1'b1;
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(3*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000001001355541c00f2f1d204dededede6f6f6f6f20de1140000001003000004500080f0000810504030201000b0a09080706;
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010042;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(3*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000002001351531c00f2f1d204dededede6f6f6f6f20de1140000001003000004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010042;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(3*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000000000300134d521c00f2f1d204dededede6f6f6f6f20de1140000001003000004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010042;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000804; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(3*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000004001349511c00f2f1d204dededede6f6f6f6f20de1140000001003000004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010042;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c04; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(10*CYCLE)

    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010000902f2e00f2f1d204dededede6f6f6f6f0ede1140000001004200004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010054;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000270e250d230c910ba108; 
    s_axis_tkeep <= 64'h00000000000fffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010005902a2e00f2f1d204dededede6f6f6f6f0ede1140000001004200004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010054;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000270e250d230c910ba108; 
    s_axis_tkeep <= 64'h00000000000fffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000000000100014f5e1f00f2f1d204dededede6f6f6f6f1dde1140000001003300004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010045;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0000; 
    s_axis_tkeep <= 64'h000000000000001f;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010f0117ea3300f2f1d204dededede6f6f6f6f09de1140000001004700004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000010059;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000080ffff0000ffffffffffffffffffffffffffffffffffffffff; 
    s_axis_tkeep <= 64'h0000000001ffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000275683400f2f1d204dededede6f6f6f6f08de1140000001004800004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0000000000000000000000000001005a;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000a00100000000000000000000000000000000000000001000; 
    s_axis_tkeep <= 64'h0000000003ffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000000f02e83c6900f2f1d204dededede6f6f6f6fd3dd1140000001007d00004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0000000000000000000000000001008f;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000f00001e00003c0000780000f00000e00100c003008007808c0200001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f0; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f00000e00100c00300800700; 
    s_axis_tkeep <= 64'h0000000000007fff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000001000245683400f2f1d204dededede6f6f6f6f08de1140000001004800004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0000000000000000000000000001005a;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000000000000000000000001000; 
    s_axis_tkeep <= 64'h0000000003ffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(30*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010f02e93b6900f2f1d204dededede6f6f6f6fd3dd1140000001007d00004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0000000000000000000000000001008f;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h000f00001e00003c0000780000f00000e00100c003008007808c0100001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f0; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #(CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f00000e00100c00300800700; 
    s_axis_tkeep <= 64'h0000000000007fff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(40*CYCLE)
    s_axis_tdata <= 512'h000000000000000004000000020000000d009a201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000004000000020000000d009a201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000004000000020000000d009a201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000004000000020000000d009a201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000004000000020000000d009a201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
    #(5*CYCLE)
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
	// #CYCLE
    // s_axis_tdata <= 512'h11; 
    // s_axis_tkeep <= 64'h0000000000000001;
    // s_axis_tuser <= 128'h00000000000000000000000000000040;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b1;
	#CYCLE
	s_axis_tdata <= 0;
	s_axis_tkeep <= 0;
	s_axis_tuser <= 0;
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    #(40*CYCLE);
end
*/

rmt_wrapper #(
	.C_S_AXI_DATA_WIDTH(),
	.C_S_AXI_ADDR_WIDTH(),
	.C_BASEADDR(),
	.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
	.C_S_AXIS_TUSER_WIDTH(),
	.C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
	.PHV_ADDR_WIDTH()
)rmt_wrapper_ins
(
	.clk(clk),		// axis clk
	.aresetn(aresetn),	

	// input Slave AXI Stream
	.s_axis_tdata(s_axis_tdata),
	.s_axis_tkeep(s_axis_tkeep),
	.s_axis_tuser(s_axis_tuser),
	.s_axis_tvalid(s_axis_tvalid),
	.s_axis_tready(s_axis_tready),
	.s_axis_tlast(s_axis_tlast),

	// output Master AXI Stream
	.m_axis_tdata(m_axis_tdata),
	.m_axis_tkeep(m_axis_tkeep),
	.m_axis_tuser(m_axis_tuser),
	.m_axis_tvalid(m_axis_tvalid),
	.m_axis_tready(m_axis_tready),
	.m_axis_tlast(m_axis_tlast)
	
);

endmodule
