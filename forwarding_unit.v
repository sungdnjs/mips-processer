module forwarding_unit(
					input	[4:0] rsD, rtD, rsE, rtE,
					input [4:0] writeregM, writeregW,
					input regwriteM, regwriteW,
					output           forwardaD, forwardbD,
					output reg [1:0] forwardaE, forwardbE);
				  

  // forwarding sources to D stage (branch equality)
  assign forwardaD = (rsD==writeregM);
  assign forwardbD = (rtD==writeregM);


  // forwarding sources to E stage (ALU)
  always @(*)
    begin
	//Initialize forwardaE,forwardbE
      forwardaE = 2'd0; 
	  forwardbE = 2'd0;
	  
	  //change the value of forwardaE,forwardbE depending on rsE, rtE
      if (rsE !== 0)
        if ((regwriteM==1)&&(writeregM!==4'd0)&&(writeregM==rsE)) 
				forwardaE = 2'b10;//EX hazard
        else if ((regwriteW==1)&&(writeregW!==4'd0)&&(writeregW==rsE))
				forwardaE = 2'b01;//MEM hazard
      if (rtE !== 0)
        if ((regwriteM==1)&&(writeregM!==4'd0)&&(writeregM==rtE)) 
				forwardbE = 2'b10;//EX hazard
        else if ((regwriteW==1)&&(writeregW!==4'd0)&&(writeregW==rtE)) 
				forwardbE = 2'b01;//MEM hazard
    end


endmodule
