# *************************************************************************
#
# Copyright 2020 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# *************************************************************************
#if {$num_qdma > 1} {
#    source box_250mhz/box_250mhz_axis_switch.tcl
#}

# rmt-related
read_verilog cookie.v
read_verilog sub_deparser.v
read_verilog deparser_top.v
read_verilog depar_wait_segs.v
read_verilog depar_do_deparsing.v
read_verilog parser_do_parsing.v
read_verilog parser_do_parsing_top.v
read_verilog parser_wait_segs.v
read_verilog sub_parser.v
read_verilog parser_top.v
read_verilog pkt_filter.v
read_verilog rmt_wrapper.v
read_verilog stage.v
read_verilog last_stage.v
read_verilog output_arbiter.v
read_verilog action_engine.v
read_verilog alu_1.v
read_verilog alu_2.v
read_verilog alu_3.v
read_verilog crossbar.v
read_verilog key_extract.v
read_verilog key_extract_top.v
read_verilog lookup_engine_top.v
read_verilog lke_cam_part.v
read_verilog lke_ram_part.v

read_verilog -quiet -sv p2p_250mhz.sv
