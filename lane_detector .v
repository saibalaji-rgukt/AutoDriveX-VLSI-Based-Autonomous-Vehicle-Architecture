module lane_detector(
    input lane_left,
    input lane_right,

    output turn_left,
    output turn_right
);

assign turn_left  = lane_right;
assign turn_right = lane_left;

endmodule